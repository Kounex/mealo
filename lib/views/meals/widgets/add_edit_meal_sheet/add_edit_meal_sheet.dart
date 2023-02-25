import 'package:beamer/beamer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/utils/styling.dart';
import 'package:mealo/utils/validation.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/ingredients_step/ingredients_step.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/rating_step.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/stepper_control.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/stepper_overview.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/tags_step.dart';
import 'package:mealo/widgets/dialog/confirmation.dart';

import '../../../../models/meal/meal.dart';
import '../../../../models/tag/tag.dart';
import '../../../../utils/isar.dart';

enum AddEditMealStep {
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

  final List<Tag> _tags = [];
  final List<RatingMap> _ratingMap = [];
  final List<IngredientMap> _ingredientMap = [];

  AddEditMealStep _step = AddEditMealStep.values.first;

  @override
  void initState() {
    super.initState();

    if (this.widget.meal != null) {
      _name.text = this.widget.meal!.name;
      _tags.addAll(this.widget.meal!.tags);
      _ratingMap.addAll(this.widget.meal!.ratings);
      _ingredientMap.addAll(this.widget.meal!.ingredients);
    }
  }

  void _saveMeal() async {
    Meal meal = this.widget.meal ?? Meal();

    await IsarUtils.crud(
      (isar) {
        return isar.meals.put(
          meal
            ..name = _name.text.trim()
            ..tags.addAll(_tags)
            ..ratings = _ratingMap
            ..ingredients = _ingredientMap,
        );
      },
    );
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void _deleteMeal() {
    Navigator.of(context).pop();
    Beamer.of(context).beamBack();
    IsarUtils.crud((isar) => isar.meals.deleteByUuid(this.widget.meal!.uuid));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
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

                        /// With M3, elevation will have an impact on the color of some
                        /// components like [Card] or [BottomSheet]. Basically a
                        /// so called [surfaceTint] is going to be applied to the
                        /// base color with an opacity based on the elevation. This
                        /// makes it very difficult to mimic a color as needed in
                        /// this use case since we are working with opcaity which
                        /// can't be stacked...
                        ///
                        // icon: Container(
                        //   height: 32.0,
                        //   width: 32.0,
                        //   alignment: Alignment.center,
                        //   child: Stack(
                        //     fit: StackFit.expand,
                        //     children: [
                        //       const Icon(FluentIcons.food_24_filled),
                        //       Positioned(
                        //         right: 0,
                        //         top: 0,
                        //         child: Container(
                        //           height: 32.0,
                        //           width: 32.0,
                        //           alignment: Alignment.center,
                        //           decoration: BoxDecoration(
                        //             color: ElevationOverlay.applySurfaceTint(
                        //               Theme.of(context)
                        //                   .bottomSheetTheme
                        //                   .backgroundColor!,
                        //               Theme.of(context).colorScheme.surfaceTint,
                        //               Theme.of(context)
                        //                   .bottomSheetTheme
                        //                   .elevation!,
                        //             ),
                        //             shape: BoxShape.circle,
                        //           ),
                        //           child: Transform.translate(
                        //             offset: const Offset(0.4, 0),
                        //             child: const Icon(
                        //               CupertinoIcons.clear_circled_solid,
                        //               size: 12.0,
                        //             ),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        icon: const Icon(FluentIcons.delete_dismiss_24_regular),
                        color: Theme.of(context).colorScheme.error,
                      ),
                    ),
                ],
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.clear),
                onPressed: () {
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
              validator: ValidationUtils.name,
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
              children: [
                const SizedBox(height: 24.0),
                AnimatedSwitcher(
                  duration: StylingUtils.kBaseAnimationDuration,
                  child: () {
                    switch (_step) {
                      case AddEditMealStep.tags:
                        return TagsStep(
                          tags: _tags,
                        );
                      case AddEditMealStep.ratings:
                        return RatingStep(
                          valueMap: _ratingMap,
                        );
                      case AddEditMealStep.ingredients:
                        return IngredientsStep(
                          ingredientMap: _ingredientMap,
                        );
                    }
                  }(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          StepperControl(
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
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
