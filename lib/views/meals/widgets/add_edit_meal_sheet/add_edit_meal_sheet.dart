import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../models/meal/meal.dart';
import '../../../../models/tag/tag.dart';
import '../../../../utils/isar.dart';
import '../../../../utils/modal.dart';
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
  final _name = TextEditingController();

  final List<String> _thumbnailUUID = [];
  final List<String> _imagesUUIDs = [];
  final List<Tag> _tags = [];
  final List<RatingMap> _ratingMap = [];
  final List<IngredientMap> _ingredientMap = [];

  final List<XFile> _thumbnailToAdd = [];
  final List<XFile> _imagesToAdd = [];

  final List<String> _imagesUUIDsToDelete = [];

  AddEditMealStep _step = AddEditMealStep.values.first;

  @override
  void initState() {
    super.initState();

    if (this.widget.meal != null) {
      if (this.widget.meal!.thumbnailUUID != null) {
        _thumbnailUUID.add(this.widget.meal!.thumbnailUUID!);
      }
      _imagesUUIDs.addAll(this.widget.meal!.imagesUUIDs);
      _name.text = this.widget.meal!.name;
      _tags.addAll(this.widget.meal!.tags);
      _ratingMap.addAll(this.widget.meal!.ratings);
      _ingredientMap.addAll(this.widget.meal!.ingredients);
    }
  }

  Future<void> _handleImages() async {
    String path = (await getApplicationDocumentsDirectory()).path;
    List<Future> deletions = [];
    for (String uuid in _imagesUUIDsToDelete) {
      deletions.add(File('$path/$uuid').delete());
    }
    await Future.wait(deletions);

    if (_thumbnailToAdd.isNotEmpty) {
      String uuid = const Uuid().v4();
      await _thumbnailToAdd.first.saveTo('$path/$uuid');
      _thumbnailUUID.clear();
      _thumbnailUUID.add(uuid);
    }

    for (XFile image in _imagesToAdd) {
      String uuid = const Uuid().v4();
      await image.saveTo('$path/$uuid');
      _imagesUUIDs.add(uuid);
    }
  }

  void _saveMeal() async {
    Meal meal = this.widget.meal ?? Meal();

    await _handleImages();

    await IsarUtils.crud(
      (isar) async {
        int id = await isar.meals.put(
          meal
            ..thumbnailUUID = _thumbnailUUID.firstOrNull
            ..imagesUUIDs = _imagesUUIDs
            ..name = _name.text.trim()
            ..ratings = _ratingMap
            ..ingredients = _ingredientMap,
        );

        /// [IsarLink/s] need special treatment for correct persistance
        /// which means we need to manually reset and save them to
        /// work properly - see the docs for more
        await meal.tags.reset();
        meal.tags.addAll(_tags);
        await meal.tags.save();
        return id;
      },
    );
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void _deleteMeal() async {
    if (this.widget.meal != null) {
      String path = (await getApplicationDocumentsDirectory()).path;
      List<String> imagesUUIDsToDelete = [...this.widget.meal!.imagesUUIDs];
      if (this.widget.meal!.thumbnailUUID != null) {
        imagesUUIDsToDelete.add(this.widget.meal!.thumbnailUUID!);
      }
      List<Future> deletions = [];
      for (String uuid in imagesUUIDsToDelete) {
        deletions.add(File('$path/$uuid').delete());
      }
      await Future.wait(deletions);

      await IsarUtils.crud(
          (isar) => isar.meals.deleteByUuid(this.widget.meal!.uuid));
    }
    if (mounted) {
      Navigator.of(context).pop('delete');
    }
  }

  String? _checkMealNameUnique(String name) {
    List<Meal> meals = IsarUtils.instance.meals
        .filter()
        .nameEqualTo(name.trim())
        .findAllSync();

    if (meals.isNotEmpty &&
        meals.every((meal) => meal.uuid != this.widget.meal?.uuid)) {
      return 'Meal already exists!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                              switch (_step) {
                                case AddEditMealStep.images:
                                  return ImagesStep(
                                    thumbnailUUID: _thumbnailUUID,
                                    imagesUUIDs: _imagesUUIDs,
                                    thumbnailToAdd: _thumbnailToAdd,
                                    imagesToAdd: _imagesToAdd,
                                    imagesUUIDsToDelete: _imagesUUIDsToDelete,
                                  );
                                case AddEditMealStep.tags:
                                  return TagsStep(
                                    tags: _tags,
                                  );
                                case AddEditMealStep.ratings:
                                  return RatingStep(
                                    ratingMap: _ratingMap,
                                  );
                                case AddEditMealStep.ingredients:
                                  return IngredientsStep(
                                    ingredientMap: _ingredientMap,
                                  );
                              }
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
  }
}
