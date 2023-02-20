import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/utils/styling.dart';
import 'package:mealo/utils/validation.dart';
import 'package:mealo/views/meals/widgets/add_meal_sheet/ingredients_step.dart';
import 'package:mealo/views/meals/widgets/add_meal_sheet/rating_step.dart';
import 'package:mealo/views/meals/widgets/add_meal_sheet/stepper_control.dart';
import 'package:mealo/views/meals/widgets/add_meal_sheet/stepper_overview.dart';
import 'package:mealo/views/meals/widgets/add_meal_sheet/tags_step.dart';

import '../../../../models/meal/meal.dart';
import '../../../../models/tag/tag.dart';
import '../../../../utils/isar.dart';

enum AddMealStep {
  tags,
  ratings,
  ingredients,
}

class AddMealSheet extends ConsumerStatefulWidget {
  const AddMealSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddMealSheetState();
}

class _AddMealSheetState extends ConsumerState<AddMealSheet> {
  final GlobalKey<FormState> _form = GlobalKey();

  final _name = TextEditingController();

  final List<Tag> _tags = [];
  final List<RatingValueMap> _valueMap = [];
  final List<IngredientMap> _ingredientMap = [];

  AddMealStep _step = AddMealStep.values[0];

  void _saveMeal() async {
    await IsarUtils.crud(
      (isar) {
        return isar.meals.put(
          Meal()
            ..name = _name.text.trim()
            ..tags.addAll(_tags)
            ..ratings = _valueMap
            ..ingredients = _ingredientMap,
        );
      },
    );
    if (context.mounted) {
      Navigator.of(context).pop();
    }
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
              Text(
                'New Meal',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.clear),
                onPressed: () => Navigator.of(context).pop(),
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
              max: AddMealStep.values.length - 1,
              size: 42,
              onStepTapped: (step) => setState(
                () => _step = AddMealStep.values[step],
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
                      case AddMealStep.tags:
                        return const TagsStep();
                      case AddMealStep.ratings:
                        return RatingStep(
                          valueMap: _valueMap,
                        );
                      case AddMealStep.ingredients:
                        return const IngredientsStep();
                    }
                  }(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12.0),
          StepperControl(
            step: _step.index,
            max: AddMealStep.values.length - 1,
            onBack: () => setState(
              () => _step = AddMealStep.values[_step.index - 1],
            ),
            onNext: () => setState(
              () => _step = AddMealStep.values[_step.index + 1],
            ),
            onSave: () {
              if (_form.currentState!.validate()) {
                _saveMeal();
              }
            },
          ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}
