import 'package:flutter/material.dart';

import '../../../../../models/unit/unit.dart';
import '../../../../../utils/isar.dart';
import '../../../../../utils/modal.dart';
import '../../../../../widgets/base/functional/suggestion_text_field/suggestion_text_field.dart';
import '../../../../../widgets/shared/dialog/add_edit_model.dart';

class UnitSuggestField extends StatelessWidget {
  final Unit? unit;
  final List<Unit> units;

  final void Function(Unit? unit) setUnit;
  final VoidCallback onDeleteSelection;

  const UnitSuggestField({
    super.key,
    required this.unit,
    required this.units,
    required this.setUnit,
    required this.onDeleteSelection,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSuggestionTextField<Unit>(
      selection: this.unit?.name,
      suggestions: (text) => this
          .units
          .where(
            (unit) =>
                unit.name.toLowerCase().contains(text.toLowerCase().trim()),
          )
          .toList(),
      hintText: 'Unit',
      sort: (unit1, unit2) =>
          unit1.name.toLowerCase().compareTo(unit2.name.toLowerCase()),
      suggestionText: (unit) => unit.name,
      onSuggestionTapped: (unit) => this.setUnit(unit),
      anchorType: AnchorType.right,
      minWidth: 150,
      onCreateNew: (text) async {
        Unit? unit = await ModalUtils.showBaseDialog(
          context,
          AddEditModelDialog<Unit>(
            name: text,
            onAdd: (name) => IsarUtils.crud(
              (isar) async =>
                  isar.units.get(await isar.units.put(Unit()..name = name)),
            ),
          ),
        );
        this.setUnit(unit);
      },
      onDeleteSelection: this.onDeleteSelection,
    );
  }
}
