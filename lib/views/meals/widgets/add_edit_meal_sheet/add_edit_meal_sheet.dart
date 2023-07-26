import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:mealo/models/rating/rating.dart';
import 'package:mealo/widgets/base/functional/async_value_builder.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../models/embeddings/rating_link/rating_link.dart';
import '../../../../models/meal/meal.dart';
import '../../../../utils/modal.dart';
import '../../../../utils/persistance.dart';
import '../../../../utils/styling.dart';
import '../../../../utils/validation.dart';
import '../../../../widgets/base/functional/text_form_field.dart';
import '../../../../widgets/base/ui/divider.dart';
import '../../../../widgets/base/ui/text_button.dart';
import '../../../../widgets/dialog/confirmation.dart';
import 'images_step/images_step.dart';
import 'ingredients_step/ingredients_step.dart';
import 'rating_step.dart';
import 'stepper_control.dart';
import 'stepper_overview.dart';
import 'tags_step.dart';

enum AddEditMealStep {
  images,
  tags,
  ratings,
  ingredients,
}

class AddEditMealSheet extends ConsumerStatefulWidget {
  final Meal? meal;

  const AddEditMealSheet({
    super.key,
    this.meal,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddMealSheetState();
}

class _AddMealSheetState extends ConsumerState<AddEditMealSheet> {
  final GlobalKey<FormState> _form = GlobalKey();

  Meal? _meal;

  late final TextEditingController _name;

  final List<XFile> _thumbnailToAdd = [];
  final List<XFile> _imagesToAdd = [];

  final List<String> _imagesUuidsToDelete = [];

  AddEditMealStep _step = AddEditMealStep.values.first;

  @override
  void initState() {
    super.initState();

    _meal = this.widget.meal;

    _name = TextEditingController(text: this.widget.meal?.name ?? '');
  }

  /// In case we are about to add a new meal, we can't only create an empty meal
  /// we need to make sure some defaults are in place (like initial ratings)
  Meal _initMeal(List<Rating> ratings) {
    Meal meal = Meal();

    meal.ratings = ratings
        .map(
          (rating) => RatingLink()
            ..ratingUuid = rating.uuid
            ..value = RatingValue.three,
        )
        .toList();

    return meal;
  }

  Future<void> _deleteImages(List<String> imagesUuidsToDelete,
      [String? path]) async {
    List<Future> deletions = [];

    /// The apps root directory for custom content
    path ??= (await getApplicationDocumentsDirectory()).path;

    for (String uuid in imagesUuidsToDelete) {
      deletions.add(File('$path/$uuid').delete());
    }
    await Future.wait(deletions);
  }

  /// While adding / editing a meal, users will delete or add images. They can
  /// delete existing images or ones they just added and haven't persisted
  /// so far. This function will check for these and either delete or save
  /// the images
  Future<({String? thumbnail, List<String> images})> _handleImages() async {
    String path = (await getApplicationDocumentsDirectory()).path;

    await _deleteImages(_imagesUuidsToDelete);

    String? thumbnailUuid;
    List<String> imagesUuids = [];

    if (_thumbnailToAdd.isNotEmpty) {
      await _thumbnailToAdd.first.saveTo('$path/$thumbnailUuid');
      thumbnailUuid = const Uuid().v4();
    }

    for (XFile image in _imagesToAdd) {
      String uuid = const Uuid().v4();
      await image.saveTo('$path/$uuid');
      imagesUuids.add(uuid);
    }

    return (thumbnail: thumbnailUuid, images: imagesUuids);
  }

  void _saveMeal() async {
    final uuids = await _handleImages();

    PersistanceUtils.transaction(
      (isar) {
        /// Leaving out the properties which are [IsarLinks] since they need
        /// to be handled seperately (see down below)
        isar.meals.put(
          _meal!
            ..name = _name.text.trim()
            ..thumbnailUuid = uuids.thumbnail
            ..imagesUuids = uuids.images,
        );

        /// [IsarLink/s] need special treatment for correct persistance
        /// which means we need to manually reset and save them to
        /// work properly - see the docs for more
        // _meal!.tags.addAll(_tags);
        // await _meal!.tags.save();

        // return id;
      },
    );
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void _deleteMeal() async {
    if (this.widget.meal != null) {
      /// We need to gather all the image uuids which are associated with the
      /// to be deleted meal
      List<String> imagesUuidsToDelete = [...this.widget.meal!.imagesUuids];
      if (this.widget.meal!.thumbnailUuid != null) {
        imagesUuidsToDelete.add(this.widget.meal!.thumbnailUuid!);
      }

      await _deleteImages(imagesUuidsToDelete);

      PersistanceUtils.transaction(
          (isar) => isar.meals.delete(this.widget.meal!.uuid));
    }
    if (mounted) {
      Navigator.of(context).pop('delete');
    }
  }

  String? _checkMealNameUnique(String name) {
    List<Meal> meals = PersistanceUtils.instance.meals
        .where()
        .nameEqualTo(name.trim())
        .findAll();

    if (meals.isNotEmpty &&
        meals.every((meal) => meal.uuid != this.widget.meal?.uuid)) {
      return 'Meal already exists!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    Widget view() => Stack(
          children: [
            Scaffold(
              body: Padding(
                padding: const EdgeInsets.only(
                  top: 24.0,
                  left: 24.0,
                  right: 24.0,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${this.widget.meal != null ? "Edit" : "New"} Meal',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            if (this.widget.meal != null)
                              Padding(
                                padding: const EdgeInsets.only(left: 12.0),
                                child: BaseTextButton(
                                  onPressed: () => ModalUtils.showBaseDialog(
                                    context,
                                    ConfirmationDialog(
                                      isYesDestructive: true,
                                      onYes: () => _deleteMeal(),
                                    ),
                                  ),
                                  isDestructive: true,
                                  child: const Text('Delete'),
                                ),
                              ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(CupertinoIcons.clear),
                          onPressed: () {
                            /// Important step - this makes sure that all changes we made
                            /// here are set back to its original value
                            ref.invalidate(mealsProvider);
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 24.0),
                    Form(
                      key: _form,
                      child: BaseTextFormField(
                        controller: _name,
                        validator: (name) =>
                            ValidationUtils.name(name?.trim()) ??
                            _checkMealNameUnique(name!),
                        hintText: 'Name',
                      ),
                    ),
                    const SizedBox(height: 24.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: StepperOverview(
                        step: _step.index,
                        max: AddEditMealStep.values.length - 1,
                        size: 42,
                        titles: const [
                          'Images',
                          'Tags',
                          'Ratings',
                          'Ingredients',
                        ],
                        onStepTapped: (step) => setState(
                          () => _step = AddEditMealStep.values[step],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Expanded(
                      child: ListView(
                        physics: const ClampingScrollPhysics(),
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 24.0),
                              child: AnimatedSwitcher(
                                duration: StylingUtils.kBaseAnimationDuration,
                                child: () {
                                  return switch (_step) {
                                    AddEditMealStep.images => ImagesStep(
                                        meal: _meal!,
                                        thumbnailToAdd: _thumbnailToAdd,
                                        imagesToAdd: _imagesToAdd,
                                        imagesUuidsToDelete:
                                            _imagesUuidsToDelete,
                                      ),
                                    AddEditMealStep.tags => TagsStep(
                                        meal: _meal!,
                                      ),
                                    AddEditMealStep.ratings => RatingStep(
                                        meal: _meal!,
                                      ),
                                    AddEditMealStep.ingredients =>
                                      IngredientsStep(
                                        meal: _meal!,
                                      ),
                                  };
                                }(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 36.0 +
                                48.0 +
                                MediaQuery.of(context).viewPadding.bottom,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BaseDivider(),
                  Material(
                    child: Padding(
                      padding: const EdgeInsets.all(24.0) +
                          MediaQuery.of(context).viewPadding,
                      child: StepperControl(
                        step: _step.index,
                        max: AddEditMealStep.values.length - 1,
                        onBack: () => setState(
                          () => _step = AddEditMealStep.values[_step.index - 1],
                        ),
                        onNext: () => setState(
                          () => _step = AddEditMealStep.values[_step.index + 1],
                        ),
                        onSave: () {
                          if (_form.currentState!.validate()) {
                            _saveMeal();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );

    if (this.widget.meal == null) {
      final asyncRatings = ref.watch(ratingsProvider);
      return BaseAsyncValueBuilder(
        asyncValue: asyncRatings,
        loadingText: 'Warming up the meal...',
        data: (ratings) {
          _meal ??= _initMeal(ratings);

          return view();
        },
      );
    }

    return view();
  }
}
