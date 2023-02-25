import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/ingredient/ingredient.dart';
import 'package:mealo/models/meal/meal.dart';
import 'package:mealo/models/unit/unit.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/ingredients_step/ingredient_row.dart';
import 'package:mealo/widgets/base/functional/async_value_builder.dart';

class IngredientsStep extends ConsumerStatefulWidget {
  final List<IngredientMap> ingredientMap;

  const IngredientsStep({
    super.key,
    required this.ingredientMap,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IngredientsStepState();
}

class _IngredientsStepState extends ConsumerState<IngredientsStep> {
  final GlobalKey<FormState> _form = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Ingredient>> asyncIngredients =
        ref.watch(ingredientsProvider);
    final AsyncValue<List<Unit>> asyncUnits = ref.watch(unitsProvider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncIngredients,
      data: (ingredients) => BaseAsyncValueBuilder(
        asyncValue: asyncUnits,
        data: (units) => Form(
          key: _form,
          child: Column(
            children: [
              ...this.widget.ingredientMap.map(
                    (ingredient) => Padding(
                      padding: const EdgeInsets.only(bottom: 12.0),
                      child: IngredientRow(
                        ingredient: ingredient,
                        ingredientMap: this.widget.ingredientMap,
                        ingredients: ingredients,
                        units: units,
                        onDelete: () => setState(
                          () => this.widget.ingredientMap.remove(ingredient),
                        ),
                      ),
                    ),
                  ),
              const Divider(thickness: 0),
              const SizedBox(height: 12.0),
              ElevatedButton(
                onPressed: () => setState(
                    () => this.widget.ingredientMap.add(IngredientMap())),
                child: const Text('Add ingredient'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
