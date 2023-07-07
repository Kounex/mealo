import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../models/ingredient/ingredient.dart';
import '../../../../../models/meal/meal.dart';
import '../../../../../models/unit/unit.dart';
import '../../../../../widgets/base/functional/async_value_builder.dart';
import '../../../../../widgets/base/ui/divider.dart';
import '../../../../../widgets/base/ui/placeholder_text.dart';
import 'ingredient_row.dart';

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
              if (this.widget.ingredientMap.isNotEmpty)
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
              if (this.widget.ingredientMap.isEmpty) ...[
                const SizedBox(height: 8.0),
                const BasePlaceholder(text: 'No ingredients added yet'),
                const SizedBox(height: 12.0),
              ],
              const SizedBox(height: 12.0),
              const BaseDivider(),
              const SizedBox(height: 24.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => setState(
                    () => this.widget.ingredientMap.add(IngredientMap()),
                  ),
                  child: const Text('Add ingredient'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
