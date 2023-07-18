import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

import '../../models/models.dart';
import '../../utils/isar.dart';
import '../../utils/modal.dart';
import '../base/functional/suggestion_text_field/suggestion_text_field.dart';
import 'dialog/add_edit_model.dart';

class ModelSuggestionTextField<T extends Model> extends StatelessWidget {
  final T? value;
  final List<T> values;

  final String? hintText;

  final AnchorType? anchorType;
  final double? minWidth;

  final void Function(T? value) setValue;
  final Future<T?> Function(Isar isar, String name) onAdd;
  final VoidCallback onDeleteSelection;

  const ModelSuggestionTextField({
    super.key,
    required this.value,
    required this.values,
    this.hintText,
    this.anchorType,
    this.minWidth,
    required this.setValue,
    required this.onAdd,
    required this.onDeleteSelection,
  });

  @override
  Widget build(BuildContext context) {
    return BaseSuggestionTextField<T>(
      selection: this.value?.name,
      suggestions: (text) => this
          .values
          .where(
            (value) =>
                value.name.toLowerCase().contains(text.toLowerCase().trim()),
          )
          .toList(),
      hintText: this.hintText ?? 'Value',
      sort: (value1, value2) =>
          value1.name.toLowerCase().compareTo(value2.name.toLowerCase()),
      suggestionText: (value) => value.name,
      onSuggestionTapped: (value) => this.setValue(value),
      anchorType: this.anchorType ?? AnchorType.left,
      minWidth: this.minWidth,
      onCreateNew: (text) async {
        T? value = await ModalUtils.showBaseDialog(
          context,
          AddEditModelDialog<T>(
            name: text,
            onAdd: (name) => IsarUtils.crud(
              (isar) async => this.onAdd(isar, name),
            ),
          ),
        );
        this.setValue(value);
      },
      onDeleteSelection: this.onDeleteSelection,
    );
  }
}