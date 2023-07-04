import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import '../../../../../models/ingredient/ingredient.dart';
import '../../../../../models/meal/meal.dart';
import 'amount_text_field.dart';
import 'ingredient_suggest_field%20copy.dart';
import 'unit_suggest_field.dart';
import '../../../../../widgets/base/ui/chip.dart';

import '../../../../../models/unit/unit.dart';
import '../../../../../utils/validation.dart';

class IngredientRow extends StatefulWidget {
  final IngredientMap ingredient;
  final List<IngredientMap> ingredientMap;
  final List<Ingredient> ingredients;
  final List<Unit> units;

  final void Function() onDelete;

  const IngredientRow({
    super.key,
    required this.ingredient,
    required this.ingredientMap,
    required this.ingredients,
    required this.units,
    required this.onDelete,
  });

  @override
  State<IngredientRow> createState() => _IngredientRowState();
}

class _IngredientRowState extends State<IngredientRow> {
  late TextEditingController _amount;
  late Unit? _unit;
  late Ingredient? _ingredient;

  bool _editing = true;
  bool _saveable = false;

  @override
  void initState() {
    super.initState();

    double? amount = this.widget.ingredient.amount;
    if (amount != null) {
      _amount = TextEditingController(
          text: amount.truncateToDouble() == amount
              ? amount.toStringAsFixed(0)
              : amount.toString());
    } else {
      _amount = TextEditingController();
    }
    _unit = this.widget.units.firstWhereOrNull(
        (unit) => unit.uuid == (this.widget.ingredient.uuidUnit ?? ''));
    _ingredient = this.widget.ingredients.firstWhereOrNull((ingredient) =>
        ingredient.uuid == (this.widget.ingredient.uuidIngredient ?? ''));

    _checkSaveable();

    if (_saveable) {
      _editing = false;
    }
  }

  void _checkSaveable() {
    _saveable = ValidationUtils.number(_amount.text) == null &&
        _unit != null &&
        _ingredient != null;
  }

  void _setUnit(Unit? unit) {
    setState(() {
      _unit = unit;
    });
  }

  void _setIngredient(Ingredient? ingredient) {
    setState(() {
      _ingredient = ingredient;
    });
  }

  void _save() {
    this.widget.ingredient.amount = double.tryParse(_amount.text);
    this.widget.ingredient.uuidIngredient = _ingredient?.uuid;
    this.widget.ingredient.uuidUnit = _unit?.uuid;
  }

  @override
  Widget build(BuildContext context) {
    double availableWidth = MediaQuery.of(context).size.width;

    _checkSaveable();

    Widget amountTextField = AmountTextField(controller: _amount);

    Widget unitSuggestField = UnitSuggestField(
      unit: _unit,
      units: this.widget.units,
      setUnit: _setUnit,
      onDeleteSelection: () => setState(() => _unit = null),
    );

    Widget ingredientSuggestField = IngredientSuggestField(
      ingredient: _ingredient,
      ingredients: this.widget.ingredients,
      setIngredient: _setIngredient,
      onDeleteSelection: () => setState(() => _ingredient = null),
    );

    return !_editing
        ? GestureDetector(
            onTap: () => setState(() => _editing = true),
            child: BaseChip(
              label: Text(
                  '${_amount.text} ${_unit?.name ?? ""} ${_ingredient?.name ?? ""}'),
            ),
          )
        : Column(
            children: [
              availableWidth >= 700
                  ? Row(
                      children: [
                        SizedBox(
                          width: 144.0,
                          child: amountTextField,
                        ),
                        const SizedBox(width: 12.0),
                        SizedBox(
                          width: 108.0,
                          child: unitSuggestField,
                        ),
                        const SizedBox(width: 12.0),
                        Expanded(
                          child: ingredientSuggestField,
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 144.0,
                              child: amountTextField,
                            ),
                            const SizedBox(width: 12.0),
                            Expanded(
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: unitSuggestField,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12.0),
                        ingredientSuggestField,
                      ],
                    ),
              const SizedBox(height: 8.0),
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
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: this.widget.onDelete,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        foregroundColor: Theme.of(context).colorScheme.onError,
                      ),
                      child: const Text('Delete'),
                    ),
                  ),
                ],
              )
            ],
          );
  }
}
