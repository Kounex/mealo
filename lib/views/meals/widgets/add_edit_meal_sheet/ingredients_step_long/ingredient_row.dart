import 'package:base_components/base_components.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../../../../models/ingredient/ingredient.dart';
import '../../../../../models/meal/meal.dart';
import '../../../../../utils/persistence.dart';
import '../../../../../widgets/shared/dialog/add_edit_model.dart';
import '../../../../../widgets/shared/model_suggestion_text_field.dart';

class IngredientRow extends StatefulWidget {
  final IngredientLink ingredient;
  final List<Ingredient> ingredients;

  final void Function() onDelete;

  const IngredientRow({
    super.key,
    required this.ingredient,
    required this.ingredients,
    required this.onDelete,
  });

  @override
  State<IngredientRow> createState() => _IngredientRowState();
}

class _IngredientRowState extends State<IngredientRow> {
  late Ingredient? _ingredient;

  bool _editing = true;
  bool _saveable = false;

  @override
  void initState() {
    super.initState();

    _ingredient = this.widget.ingredients.firstWhereOrNull((ingredient) =>
        ingredient.uuid == (this.widget.ingredient.uuidIngredient ?? ''));

    _checkSaveable();

    if (_saveable) {
      _editing = false;
    }
  }

  void _checkSaveable() {
    _saveable = _ingredient != null;
  }

  void _setIngredient(Ingredient? ingredient) {
    setState(() {
      _ingredient = ingredient;
    });
  }

  void _save() {
    this.widget.ingredient.uuidIngredient = _ingredient?.uuid;
  }

  @override
  Widget build(BuildContext context) {
    _checkSaveable();

    return !_editing
        ? GestureDetector(
            onTap: () => setState(() => _editing = true),
            child: BaseChip(
              label: Text(_ingredient?.name ?? ''),
            ),
          )

        /// TODO: check why the outer card loses its left and right elevation
        /// if this is shown
        : BaseCard(
            topPadding: 12,
            bottomPadding: 12,
            leftPadding: 0,
            rightPadding: 0,
            backgroundColor: Theme.of(context).cardColor.lighten(5),
            child: Column(
              children: [
                ModelSuggestionTextField<Ingredient>(
                  value: _ingredient,
                  values: this.widget.ingredients,
                  setValue: _setIngredient,
                  hintText: 'Ingredient',
                  onAdd: (name) => ModalUtils.showBaseDialog<Ingredient>(
                    context,
                    AddEditModelDialog(
                      name: name,
                      onAdd: (name) {
                        final ingredient = Ingredient()..name = name;

                        PersistenceUtils.transaction(
                          PersistenceOperation.insertUpdate,
                          [ingredient],
                        );

                        return ingredient;
                      },
                    ),
                  ),
                  onDeleteSelection: () => setState(() => _ingredient = null),
                ),
                SizedBox(height: DesignSystem.spacing.x8),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: _saveable
                            ? () {
                                _save();
                                setState(() => _editing = false);
                              }
                            : null,
                        child: const Text('Save'),
                      ),
                    ),
                    SizedBox(width: DesignSystem.spacing.x12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: this.widget.onDelete,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).colorScheme.error,
                          foregroundColor:
                              Theme.of(context).colorScheme.onError,
                        ),
                        child: const Text('Delete'),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}
