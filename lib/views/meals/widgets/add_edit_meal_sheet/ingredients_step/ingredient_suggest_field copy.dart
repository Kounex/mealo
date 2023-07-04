import 'package:flutter/material.dart';
import '../../../../../models/ingredient/ingredient.dart';

import '../../../../../utils/isar.dart';
import '../../../../../utils/modal.dart';
import '../../../../../widgets/base/functional/suggestion_text_field/suggestion_text_field.dart';
import '../../../../../widgets/shared/dialog/add_edit_model.dart';

class IngredientSuggestField extends StatelessWidget {
  final Ingredient? ingredient;
  final List<Ingredient> ingredients;

  final void Function(Ingredient? unit) setIngredient;
  final VoidCallback onDeleteSelection;

  const IngredientSuggestField({
    super.key,
    required this.ingredient,
    required this.ingredients,
    required this.setIngredient,
    required this.onDeleteSelection,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSuggestionTextField<Ingredient>(
      selection: this.ingredient?.name,
      suggestions: (text) => this
          .ingredients
          .where(
            (ingredient) => ingredient.name
                .toLowerCase()
                .contains(text.toLowerCase().trim()),
          )
          .toList(),
      hintText: 'Search for ingredients...',
      sort: (ingredient1, ingredient2) => ingredient1.name
          .toLowerCase()
          .compareTo(ingredient2.name.toLowerCase()),
      suggestionText: (ingredient) => ingredient.name,
      onSuggestionTapped: (ingredient) => this.setIngredient(ingredient),
      onCreateNew: (text) async {
        Ingredient? ingredient = await ModalUtils.showBaseDialog(
          context,
          AddEditModelDialog<Ingredient>(
            name: text,
            onAdd: (name) => IsarUtils.crud(
              (isar) async => isar.ingredients
                  .get(await isar.ingredients.put(Ingredient()..name = name)),
            ),
          ),
        );
        this.setIngredient(ingredient);
      },
      onDeleteSelection: this.onDeleteSelection,
    );
  }
}
