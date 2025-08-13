import 'dart:io';

import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:mealo/widgets/shared/dialog/confirmation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../models/embeddings/rating_link/rating_link.dart';
import '../../../../models/meal/meal.dart';
import '../../../../models/rating/rating.dart';
import '../../../../utils/persistence.dart';
import 'images_step/images_step_old.dart';
import 'ingredient_step.dart';
import 'rating_step.dart';
import 'stepper_control.dart';
import 'stepper_overview.dart';
import 'tags_step.dart';

enum AddEditMealStep {
  images,
  ratings,
  ingredients,
  tags;

  String get title => switch (this) {
        AddEditMealStep.images => 'Images',
        AddEditMealStep.ratings => 'Ratings',
        AddEditMealStep.ingredients => 'Ingredients',
        AddEditMealStep.tags => 'Tags',
      };
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
      thumbnailUuid = const Uuid().v4();
      await _thumbnailToAdd.first.saveTo('$path/$thumbnailUuid');
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

    PersistenceUtils.transaction(
      PersistenceOperation.insertUpdate,
      [
        _meal!
          ..name = _name.text.trim()
          ..thumbnailUuid = uuids.thumbnail
          ..imagesUuids = uuids.images,
      ],
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

      PersistenceUtils.transaction(
        PersistenceOperation.delete,
        [this.widget.meal!],
      );
    }
    if (mounted) {
      Navigator.of(context).pop('delete');
    }
  }

  String? _checkMealNameUnique(String name) {
    List<Meal> meals =
        PersistenceUtils.where<Meal>().nameEqualTo(name.trim()).findAll();

    if (meals.isNotEmpty &&
        meals.every((meal) => meal.uuid != this.widget.meal?.uuid)) {
      return 'Meal already exists!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final asyncRatings = ref.watch(ratingsProvider);
    return BaseAsyncValueBuilder(
      asyncValue: asyncRatings,
      loadingText: 'Warming up the meal...',
      data: (ratings) {
        _meal ??= _initMeal(ratings);

        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: DesignSystem.spacing.x24,
                left: DesignSystem.spacing.x24,
                right: DesignSystem.spacing.x24,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '${this.widget.meal != null ? "Edit" : "New"} Meal',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      if (this.widget.meal != null)
                        Padding(
                          padding:
                              EdgeInsets.only(left: DesignSystem.spacing.x12),
                          child: BaseTextButton(
                            onPressed: () => ModalUtils.showBaseDialog(
                              context,
                              MealoConfirmationDialog(
                                title: 'Delete Meal',
                                body:
                                    'Are you sure you want to delete this meal? This action can\'t be undone!',
                                isYesDestructive: true,
                                onYes: (_) => _deleteMeal(),
                              ),
                            ),
                            isDestructive: true,
                            child: const Text('Delete'),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: DesignSystem.spacing.x24),
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
                  SizedBox(height: DesignSystem.spacing.x24),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: DesignSystem.spacing.x4),
                    child: StepperOverview(
                      step: _step.index,
                      max: AddEditMealStep.values.length - 1,
                      size: DesignSystem.size.x42,
                      titles: List.from(
                          AddEditMealStep.values.map((step) => step.title)),
                      onStepTapped: (step) => setState(
                        () => _step = AddEditMealStep.values[step],
                      ),
                    ),
                  ),
                  SizedBox(height: DesignSystem.spacing.x12),
                  Expanded(
                    child: ListView(
                      physics: const ClampingScrollPhysics(),
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: DesignSystem.spacing.x24),
                            child: AnimatedSwitcher(
                              duration:
                                  DesignSystem.animation.defaultDurationMS250,
                              child: switch (_step) {
                                AddEditMealStep.images => ImagesStepOld(
                                    meal: _meal!,
                                    thumbnailToAdd: _thumbnailToAdd,
                                    imagesToAdd: _imagesToAdd,
                                    imagesUuidsToDelete: _imagesUuidsToDelete,
                                  ),
                                AddEditMealStep.ratings => RatingStep(
                                    meal: _meal!,
                                  ),
                                AddEditMealStep.ingredients => IngredientStep(
                                    meal: _meal!,
                                  ),
                                AddEditMealStep.tags => TagsStep(
                                    meal: _meal!,
                                  ),
                              },
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
                      padding: EdgeInsets.all(DesignSystem.spacing.x24) +
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
      },
    );
  }
}
