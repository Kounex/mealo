import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../text_form_field.dart';
import 'suggestion_overlay.dart';

enum AnchorType {
  left,
  right,
  center,
}

class BaseSuggestionTextField<T> extends StatefulWidget {
  final String? selection;
  final List<T> Function(String text) suggestions;
  final String Function(T item)? suggestionText;
  final Widget Function(T item)? suggestionBuilder;
  final void Function(T item)? onSuggestionTapped;
  final void Function(String text)? onCreateNew;
  final VoidCallback? onDeleteSelection;

  final int Function(T a, T b)? sort;

  final String? hintText;

  /// Sets the anchor where the overlay will stay and therefore
  /// align. Example: [anchorType] is [AnchorType.left] which means
  /// if the [BaseSuggestionTextField] is shorter than the overlay
  /// then the overlay will stay left and expand right (bigger then
  /// the [BaseSuggestionTextField])
  final AnchorType anchorType;
  final double? minWidth;

  const BaseSuggestionTextField({
    super.key,
    this.selection,
    required this.suggestions,
    this.suggestionText,
    this.suggestionBuilder,
    this.onSuggestionTapped,
    this.onCreateNew,
    this.onDeleteSelection,
    this.sort,
    this.hintText,
    this.anchorType = AnchorType.left,
    this.minWidth,
  }) : assert(suggestionText != null || suggestionBuilder != null);

  @override
  State<BaseSuggestionTextField<T>> createState() =>
      _BaseSuggestionTextField<T>();
}

class _BaseSuggestionTextField<T> extends State<BaseSuggestionTextField<T>> {
  final FocusNode _focus = FocusNode();
  late TextEditingController _controller;

  final GlobalKey _key = GlobalKey();
  final LayerLink _link = LayerLink();

  final List<T> _suggestions = [];

  late OverlayEntry _entry;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(text: this.widget.selection);

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
        expandType: this.widget.anchorType,
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
  void didUpdateWidget(covariant BaseSuggestionTextField<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if ((this.widget.selection ?? '') != _controller.text) {
      SchedulerBinding.instance.addPostFrameCallback(
          (timeStamp) => _controller.text = this.widget.selection ?? '');
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
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              BaseTextFormField(
                key: _key,
                focusNode: _focus,
                controller: _controller,
                enabled: this.widget.selection == null,
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
              if (this.widget.selection != null)
                Positioned(
                  right: 1.0,
                  child: IconButton(
                    onPressed: this.widget.onDeleteSelection,
                    icon: const Icon(CupertinoIcons.clear_circled_solid),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
