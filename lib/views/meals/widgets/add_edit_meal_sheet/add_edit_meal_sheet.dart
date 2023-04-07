import 'package:collection/collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/utils/styling.dart';
import 'package:mealo/utils/validation.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/images_step/images_step.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/ingredients_step/ingredients_step.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/rating_step.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/stepper_overview.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/tags_step.dart';
import 'package:mealo/widgets/base/ui/divider.dart';
import 'package:mealo/widgets/dialog/confirmation.dart';

import '../../../../models/meal/meal.dart';
import '../../../../models/tag/tag.dart';
import '../../../../utils/isar.dart';
import 'stepper_control.dart';

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

  final List<String> _thumbnailBase64 = [];
  final List<String> _imagesBase64 = [];
  final List<Tag> _tags = [];
  final List<RatingMap> _ratingMap = [];
  final List<IngredientMap> _ingredientMap = [];

  AddEditMealStep _step = AddEditMealStep.values.first;

  @override
  void initState() {
    super.initState();

    if (this.widget.meal != null) {
      if (this.widget.meal!.thumbnailBase64 != null) {
        _thumbnailBase64.add(this.widget.meal!.thumbnailBase64!);
      }
      _imagesBase64.addAll(this.widget.meal!.imagesBase64);
      _name.text = this.widget.meal!.name;
      _tags.addAll(this.widget.meal!.tags);
      _ratingMap.addAll(this.widget.meal!.ratings);
      _ingredientMap.addAll(this.widget.meal!.ingredients);
    }
  }

  void _saveMeal() async {
    Meal meal = this.widget.meal ?? Meal();

    await IsarUtils.crud(
      (isar) async {
        int id = await isar.meals.put(
          meal
            ..thumbnailBase64 = _thumbnailBase64.firstOrNull
            ..imagesBase64 = _imagesBase64
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
    await IsarUtils.crud(
        (isar) => isar.meals.deleteByUuid(this.widget.meal!.uuid));

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
                            padding: const EdgeInsets.only(left: 4.0),
                            child: IconButton(
                              onPressed: () => ModalUtils.showBaseDialog(
                                context,
                                ConfirmationDialog(
                                  isYesDestructive: true,
                                  onYes: () => _deleteMeal(),
                                ),
                              ),
                              icon: const Icon(
                                  FluentIcons.delete_dismiss_24_regular),
                              color: Theme.of(context).colorScheme.error,
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
                  child: TextFormField(
                    controller: _name,
                    validator: (name) =>
                        ValidationUtils.name(name?.trim()) ??
                        _checkMealNameUnique(name!),
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: StepperOverview(
                    step: _step.index,
                    max: AddEditMealStep.values.length - 1,
                    size: 42,
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
                                    thumbnailBase64: _thumbnailBase64,
                                    imagesBase64: _imagesBase64,
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
