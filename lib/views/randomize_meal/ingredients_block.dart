import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/ingredient/ingredient.dart';

class IngredientsBlock extends ConsumerWidget {
  final String text;

  final List<Ingredient> selectedIngredients;

  final void Function(Ingredient tag) onAdd;
  final void Function(Ingredient tag) onRemove;

  const IngredientsBlock({
    super.key,
    required this.text,
    required this.selectedIngredients,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncIngredients = ref.watch(ingredientsProvider);

    return BaseAsyncValueBuilder(
        asyncValue: asyncIngredients,
        data: (ingredients) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.text,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: DesignSystem.spacing.x12),
              BaseSuggestionTextField<Ingredient>(
                suggestions: (text) => ingredients
                    .where((ingredient) =>
                        !this.selectedIngredients.contains(ingredient) &&
                        ingredient.name
                            .toLowerCase()
                            .contains(text.toLowerCase()))
                    .toList(),
                hintText: 'Search for ingredients...',
                suggestionText: (ingredient) => ingredient.name,
                sort: (ingredient1, ingredient2) => ingredient1.name
                    .toLowerCase()
                    .compareTo(ingredient2.name.toLowerCase()),
                onSuggestionTapped: this.onAdd,
              ),
              SizedBox(height: DesignSystem.spacing.x12),
              Wrap(
                direction: Axis.horizontal,
                spacing: DesignSystem.spacing.x8,
                children: this
                    .selectedIngredients
                    .map(
                      (ingredient) => BaseChip(
                        text: ingredient.name,
                        onDeleted: () => this.onRemove(ingredient),
                      ),
                    )
                    .toList(),
              ),
            ],
          );
        });
  }
}
