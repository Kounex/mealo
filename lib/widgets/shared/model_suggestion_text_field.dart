import 'dart:async';

import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';

import '../../models/model.dart';

class ModelSuggestionTextField<T extends CommonModel> extends StatelessWidget {
  final T? value;
  final List<T> values;

  final String? hintText;

  final AnchorType? anchorType;
  final double? minWidth;

  final bool isSortCaseSensitive;
  final bool isSearchCaseSensitive;

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
    this.isSortCaseSensitive = false,
    this.isSearchCaseSensitive = false,
    required this.setValue,
    required this.onAdd,
    required this.onDeleteSelection,
  });

  List<T> _filterSuggestions(String text) {
    return this.values.where(
      (model) {
        if (this.isSearchCaseSensitive) {
          return model.name.contains(text);
        }

        return model.name.toLowerCase().contains(text.toLowerCase());
      },
    ).toList();
  }

  int _sortSuggestions(T value1, T value2) {
    if (this.isSortCaseSensitive) {
      return value1.name.compareTo(value2.name);
    }

    return value1.name.toLowerCase().compareTo(value2.name.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return BaseSuggestionTextField<T>(
      selection: this.value?.name,
      suggestions: _filterSuggestions,
      hintText: this.hintText ?? 'Value',
      sort: _sortSuggestions,
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
