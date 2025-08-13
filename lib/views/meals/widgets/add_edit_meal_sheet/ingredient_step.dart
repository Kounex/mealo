import 'package:base_components/base_components.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/ingredient/ingredient.dart';

import '../../../../models/meal/meal.dart';
import '../../../../utils/persistence.dart';
import '../../../../widgets/shared/dialog/add_edit_model.dart';

class IngredientStep extends ConsumerStatefulWidget {
  final Meal meal;

  const IngredientStep({
    super.key,
    required this.meal,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _IngredientStepState();
}

class _IngredientStepState extends ConsumerState<IngredientStep> {
  List<Ingredient> _suggestions(List<Ingredient> ingredients, String text) {
    return ingredients.where(
      (ingredient) {
        bool ingredientNotSelected = this.widget.meal.ingredients.every(
            (selectedIngredient) =>
                selectedIngredient.uuidIngredient != ingredient.uuid);

        bool ingredientWithTextExists = text.trim().isEmpty
            ? true
            : ingredient.name.toLowerCase().contains(
                  text.toLowerCase().trim(),
                );

        return ingredientNotSelected && ingredientWithTextExists;
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Ingredient>> asyncIngredients =
        ref.watch(ingredientsProvider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncIngredients,
      data: (ingredients) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseSuggestionTextField<Ingredient>(
            suggestions: (text) => _suggestions(ingredients, text),
            hintText: 'Search for ingredients...',
            suggestionText: (ingredient) => ingredient.name,
            sort: (ingredient1, ingredient2) => ingredient1.name
                .toLowerCase()
                .compareTo(ingredient2.name.toLowerCase()),
            onCreateNew: (text) async {
              Ingredient? ingredient = await ModalUtils.showBaseDialog(
                context,
                AddEditModelDialog(
                  name: text,
                  onAdd: (name) {
                    final ingredient = Ingredient()..name = name;

                    PersistenceUtils.transaction(
                      PersistenceOperation.insertUpdate,
                      [ingredient],
                    );

                    return ingredient;
                  },
                ),
              );
              if (ingredient != null) {
                setState(() => this
                    .widget
                    .meal
                    .ingredients
                    .add(IngredientLink()..uuidIngredient = ingredient.uuid));
              }
            },
            onSuggestionTapped: (ingredient) => setState(() => this
                .widget
                .meal
                .ingredients
                .add(IngredientLink()..uuidIngredient = ingredient.uuid)),
          ),
          SizedBox(height: DesignSystem.spacing.x24),
          BaseCard(
            topPadding: 0,
            bottomPadding: 0,
            leftPadding: 0,
            rightPadding: 0,
            backgroundColor: Theme.of(context).cardColor.lighten(2),
            child: this.widget.meal.ingredients.isNotEmpty
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: DesignSystem.spacing.x12,
                      children: this
                          .widget
                          .meal
                          .ingredients
                          .map(
                            (mealIngredient) => BaseChip(
                              text: ingredients
                                  .firstWhereOrNull((ingredient) =>
                                      mealIngredient.uuidIngredient ==
                                      ingredient.uuid)
                                  ?.name,
                              onDeleted: () => setState(
                                () => this
                                    .widget
                                    .meal
                                    .ingredients
                                    .remove(mealIngredient),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                : const Center(
                    child: BasePlaceholder(text: 'No ingredients added yet'),
                  ),
          ),
        ],
      ),
    );
  }
}
