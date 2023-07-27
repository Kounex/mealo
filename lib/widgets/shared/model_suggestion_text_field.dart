import 'dart:async';

import 'package:flutter/material.dart';

import '../../models/model.dart';
import '../base/functional/suggestion_text_field/suggestion_text_field.dart';

class ModelSuggestionTextField<T extends CommonModel> extends StatelessWidget {
  final T? value;
  final List<T> values;

  final String? hintText;

  final AnchorType? anchorType;
  final double? minWidth;

  final void Function(T? value) setValue;

  /// TODO: check why I can't set it to T as return type when I can do it
  /// directly on the Isar callback
  final FutureOr<T?> Function(String name) onAdd;
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
      onCreateNew: (text) async => this.setValue(
        await this.onAdd(text),
      ),
      onDeleteSelection: this.onDeleteSelection,
    );
  }
}
