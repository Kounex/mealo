import 'package:base_components/base_components.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/ingredients_step_long/ingredient_row.dart';

import '../../../../../models/ingredient/ingredient.dart';
import '../../../../../models/meal/meal.dart';
import '../../../../../models/unit/unit.dart';

class IngredientsStepLong extends ConsumerStatefulWidget {
  final Meal meal;

  const IngredientsStepLong({
    super.key,
    required this.meal,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IngredientsStepState();
}

class _IngredientsStepState extends ConsumerState<IngredientsStepLong> {
  final GlobalKey<FormState> _form = GlobalKey();

  // final Map<int, bool> _editMap = {};

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Ingredient>> asyncIngredients =
        ref.watch(ingredientsProvider);
    final AsyncValue<List<Unit>> asyncUnits = ref.watch(unitsProvider);

    return Column(
      children: [
        BaseCard(
          topPadding: 0,
          bottomPadding: 0,
          leftPadding: 0,
          rightPadding: 0,
          backgroundColor: Theme.of(context).cardColor.lighten(2),
          child: BaseAsyncValueBuilder(
            asyncValue: asyncIngredients,
            data: (ingredients) => BaseAsyncValueBuilder(
              asyncValue: asyncUnits,
              data: (units) => Form(
                key: _form,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (this.widget.meal.ingredients.isNotEmpty)
                        Text(
                          'List of ingredients',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      SizedBox(height: DesignSystem.spacing.x12),
                      ...this.widget.meal.ingredients.mapIndexed(
                            (index, ingredient) => IngredientRow(
                              /// TODO: check why it is necessary to have a key
                              /// here
                              key: ValueKey(ingredient),
                              ingredient: ingredient,
                              ingredients: List.from(
                                ingredients.whereNot((baseIngredient) => this
                                    .widget
                                    .meal
                                    .ingredients
                                    .any((mealIngredient) =>
                                        baseIngredient.uuid ==
                                        mealIngredient.uuidIngredient)),
                              ),
                              onDelete: () => setState(
                                () => this.widget.meal.ingredients = this
                                    .widget
                                    .meal
                                    .ingredients
                                    .whereNotIndexed((i, _) => i == index)
                                    .toList(),
                              ),
                            ),
                          ),
                      if (this.widget.meal.ingredients.isEmpty) ...[
                        SizedBox(height: DesignSystem.spacing.x24),
                        const Center(
                          child:
                              BasePlaceholder(text: 'No ingredients added yet'),
                        ),
                        SizedBox(height: DesignSystem.spacing.x24),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: DesignSystem.spacing.x24),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => setState(
              () => this.widget.meal.ingredients = [
                ...this.widget.meal.ingredients,
                IngredientLink(),
              ],
            ),
            child: const Text('Add ingredient'),
          ),
        ),
      ],
    );
  }
}
