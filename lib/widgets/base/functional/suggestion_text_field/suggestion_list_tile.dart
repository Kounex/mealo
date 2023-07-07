import 'package:flutter/material.dart';

import 'press_done_tag.dart';

class SuggestionListTile<T> extends StatelessWidget {
  final T? suggestion;
  final TextEditingController controller;
  final FocusNode focus;
  final List<T> currentSuggestions;
  final String Function(T item)? suggestionText;
  final Widget Function(T item)? suggestionBuilder;
  final void Function(T item)? onSuggestionTapped;
  final void Function(String text)? onCreateNew;

  const SuggestionListTile({
    super.key,
    this.suggestion,
    required this.controller,
    required this.focus,
    required this.currentSuggestions,
    this.suggestionText,
    this.suggestionBuilder,
    this.onSuggestionTapped,
    this.onCreateNew,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.suggestion != null) {
          this.onSuggestionTapped?.call(this.suggestion as T);
        } else {
          this.onCreateNew?.call(this.controller.text);
        }
        this.focus.unfocus();
      },
      child: Row(
        children: [
          Expanded(
            child: this.suggestionBuilder == null
                ? ListTile(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12.0),
                      child: this.suggestion != null
                          ? Text(
                              this.suggestionText!(this.suggestion as T),
                            )
                          : Text(
                              this.onCreateNew != null
                                  ? 'Create and add new'
                                  : 'None matching',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .headlineLarge!
                                    .color,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                    ),
                    dense: true,
                  )
                : this.suggestionBuilder!(
                    this.suggestion as T,
                  ),
          ),
          if (this.suggestion != null && this.currentSuggestions.length == 1 ||
              this.onCreateNew != null &&
                  this.suggestion == null &&
                  this.currentSuggestions.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: PressDoneTag(),
            )
        ],
      ),
    );
  }
}
