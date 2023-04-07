import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:mealo/widgets/base/functional/text_form_field.dart';

import 'suggestion_overlay.dart';

enum ExpandType {
  left,
  right,
  center,
}

class BaseSuggestionTextField<T> extends StatefulWidget {
  final List<T> Function(String text) suggestions;
  final String Function(T item)? suggestionText;
  final Widget Function(T item)? suggestionBuilder;
  final void Function(T item)? onSuggestionTapped;
  final void Function(String text)? onCreateNew;

  final int Function(T a, T b)? sort;

  final String? hintText;

  final ExpandType expandType;
  final double? minWidth;

  const BaseSuggestionTextField({
    super.key,
    required this.suggestions,
    this.suggestionText,
    this.suggestionBuilder,
    this.onSuggestionTapped,
    this.onCreateNew,
    this.sort,
    this.hintText,
    this.expandType = ExpandType.left,
    this.minWidth,
  }) : assert(suggestionText != null || suggestionBuilder != null);

  @override
  State<BaseSuggestionTextField<T>> createState() =>
      _BaseSuggestionTextField<T>();
}

class _BaseSuggestionTextField<T> extends State<BaseSuggestionTextField<T>> {
  final FocusNode _focus = FocusNode();
  final TextEditingController _controller = TextEditingController();

  final GlobalKey _key = GlobalKey();
  final LayerLink _link = LayerLink();

  final List<T> _suggestions = [];

  late OverlayEntry _entry;

  @override
  void initState() {
    super.initState();

    _entry = OverlayEntry(
      builder: (context) => SuggestionOverlay(
        textFieldKey: _key,
        link: _link,
        controller: _controller,
        focus: _focus,
        currentSuggestions: _suggestions,
        suggestions: this.widget.suggestions,
        suggestionText: this.widget.suggestionText,
        suggestionBuilder: this.widget.suggestionBuilder,
        onSuggestionTapped: this.widget.onSuggestionTapped,
        onCreateNew: this.widget.onCreateNew,
        sort: this.widget.sort,
        expandType: this.widget.expandType,
        minWidth: this.widget.minWidth,
      ),
    );

    _focus.addListener(_handleFocusChange);
  }

  void _handleFocusChange() {
    if (_focus.hasFocus && !_entry.mounted) {
      Overlay.of(context).insert(_entry);
    } else if (!_focus.hasFocus && _entry.mounted) {
      _entry.remove();
      _controller.clear();
    }
  }

  @override
  void dispose() {
    _focus.removeListener(_handleFocusChange);
    // if (_entry.mounted) {
    //   _entry.remove();
    // }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _link,
      child: NotificationListener<SizeChangedLayoutNotification>(
        onNotification: (notification) {
          if (_entry.mounted) {
            SchedulerBinding.instance.addPostFrameCallback((_) {
              _entry.markNeedsBuild();
            });
          }
          return true;
        },
        child: SizeChangedLayoutNotifier(
          child: BaseTextFormField(
            key: _key,
            focusNode: _focus,
            controller: _controller,
            autocorrect: false,
            loseFocusOnTapOutside: true,
            maxLines: 1,
            hintText: this.widget.hintText,
            onFieldSubmitted: (text) {
              if (_suggestions.length == 1) {
                this.widget.onSuggestionTapped?.call(_suggestions.first);
              } else if (_suggestions.isEmpty) {
                this.widget.onCreateNew?.call(_controller.text);
              }
            },
          ),
        ),
      ),
    );
  }
}
