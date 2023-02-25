import 'package:collection/collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealo/models/ingredient/ingredient.dart';
import 'package:mealo/models/meal/meal.dart';
import 'package:mealo/utils/isar.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/utils/validation.dart';
import 'package:mealo/widgets/base/functional/suggestion_text_field/suggestion_text_field.dart';
import 'package:mealo/widgets/base/functional/text_form_field.dart';
import 'package:mealo/widgets/base/ui/chip.dart';
import 'package:mealo/widgets/shared/dialog/add_edit_base_model.dart';

import '../../../../../models/unit/unit.dart';

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
  }

  void _setUnit(Unit? unit) {
    setState(() {
      _unit = unit;
      this.widget.ingredient.uuidUnit = unit?.uuid;
    });
  }

  void _setIngredient(Ingredient? ingredient) {
    setState(() {
      _ingredient = ingredient;
      this.widget.ingredient.uuidIngredient = ingredient?.uuid;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 144.0,
          child: BaseTextFormField(
            controller: _amount
              ..addListener(() => this.widget.ingredient.amount =
                  double.tryParse(_amount.text)),
            hintText: 'Amount',
            maxLines: 1,
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
              TextInputFormatter.withFunction((oldValue, newValue) {
                try {
                  final text = newValue.text;
                  if (text.isNotEmpty) double.parse(text);
                  return newValue;
                } catch (e) {}
                return oldValue;
              }),
            ],
            validator: ValidationUtils.number,
          ),
        ),
        const SizedBox(width: 12.0),
        SizedBox(
          width: 102.0,
          child: _unit == null
              ? BaseSuggestionTextField<Unit>(
                  suggestions: (text) => this
                      .widget
                      .units
                      .where(
                        (unit) => unit.name
                            .toLowerCase()
                            .contains(text.toLowerCase().trim()),
                      )
                      .toList(),
                  hintText: 'Unit',
                  sort: (unit1, unit2) => unit1.name
                      .toLowerCase()
                      .compareTo(unit2.name.toLowerCase()),
                  suggestionText: (unit) => unit.name,
                  onSuggestionTapped: (unit) => setState(() {
                    _unit = unit;
                    this.widget.ingredient.uuidUnit = unit.uuid;
                  }),
                  onCreateNew: (text) async {
                    Unit? unit = await ModalUtils.showBaseDialog(
                      context,
                      AddEditBaseModelDialog<Unit>(
                        name: text,
                        onAdd: (name) => IsarUtils.crud(
                          (isar) async => isar.units
                              .get(await isar.units.put(Unit()..name = name)),
                        ),
                      ),
                    );
                    _setUnit(unit);
                  },
                )
              : BaseChip(
                  text: _unit!.name,
                  onDeleted: () => setState(() {
                    _unit = null;
                    this.widget.ingredient.uuidUnit = null;
                  }),
                ),
        ),
        const SizedBox(width: 12.0),
        Expanded(
          child: _ingredient == null
              ? BaseSuggestionTextField<Ingredient>(
                  suggestions: (text) => this
                      .widget
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
                  onSuggestionTapped: (ingredient) => setState(() {
                    _ingredient = ingredient;
                    this.widget.ingredient.uuidIngredient = ingredient.uuid;
                  }),
                  onCreateNew: (text) async {
                    Ingredient? ingredient = await ModalUtils.showBaseDialog(
                      context,
                      AddEditBaseModelDialog<Ingredient>(
                        name: text,
                        onAdd: (name) => IsarUtils.crud(
                          (isar) async => isar.ingredients.get(await isar
                              .ingredients
                              .put(Ingredient()..name = name)),
                        ),
                      ),
                    );
                    _setIngredient(ingredient);
                  },
                )
              : Align(
                  alignment: Alignment.centerLeft,
                  child: BaseChip(
                    text: _ingredient!.name,
                    onDeleted: () => setState(() {
                      _ingredient = null;
                      this.widget.ingredient.uuidIngredient = null;
                    }),
                  ),
                ),
        ),
        IconButton(
          onPressed: this.widget.onDelete,
          icon: Icon(
            FluentIcons.delete_dismiss_24_regular,
            color: Theme.of(context).colorScheme.error,
          ),
        ),
      ],
    );
  }
}
