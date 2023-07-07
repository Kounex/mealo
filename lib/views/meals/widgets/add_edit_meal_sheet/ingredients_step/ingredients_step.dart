import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../models/ingredient/ingredient.dart';
import '../../../../../models/meal/meal.dart';
import '../../../../../models/unit/unit.dart';
import '../../../../../widgets/base/functional/async_value_builder.dart';
import '../../../../../widgets/base/ui/card.dart';
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

    return Column(
      children: [
        BaseCard(
          topPadding: 0,
          bottomPadding: 0,
          leftPadding: 0,
          rightPadding: 0,
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
                      if (this.widget.ingredientMap.isNotEmpty)
                        Text(
                          'List of ingredients',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      const SizedBox(height: 12.0),
                      ...this.widget.ingredientMap.mapIndexed(
                            (index, ingredient) => IngredientRow(
                              /// TODO: check why it is necessary to have a key
                              /// here
                              key: ValueKey(ingredient),
                              ingredient: ingredient,
                              ingredients: ingredients,
                              units: units,
                              onDelete: () => setState(
                                () => this.widget.ingredientMap.removeAt(index),
                              ),
                            ),
                          ),
                      if (this.widget.ingredientMap.isEmpty) ...[
                        const SizedBox(height: 24.0),
                        const Center(
                          child:
                              BasePlaceholder(text: 'No ingredients added yet'),
                        ),
                        const SizedBox(height: 24.0),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
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
    );
  }
}
