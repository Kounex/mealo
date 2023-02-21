import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mealo/widgets/base/functional/text_form_field.dart';

import '../ui/card.dart';

class BaseSuggestionTextField<T> extends StatefulWidget {
  final List<T> Function(String text) suggestions;
  final String Function(T item)? suggestionText;
  final Widget Function(T item)? suggestionBuilder;
  final void Function(T item)? onSuggestionTapped;

  const BaseSuggestionTextField({
    super.key,
    required this.suggestions,
    this.suggestionText,
    this.suggestionBuilder,
    this.onSuggestionTapped,
  }) : assert(suggestionText != null || suggestionBuilder != null);

  @override
  State<BaseSuggestionTextField<T>> createState() =>
      _BaseSuggestionTextField<T>();
}

class _BaseSuggestionTextField<T> extends State<BaseSuggestionTextField<T>> {
  late GlobalObjectKey _key;
  final FocusNode _focus = FocusNode();
  final TextEditingController _controller = TextEditingController();

  final List<T> _suggestions = [];

  late OverlayEntry _entry;

  @override
  void initState() {
    super.initState();

    _key = GlobalObjectKey(this.widget.suggestions);

    _entry = OverlayEntry(
      builder: (context) {
        RenderBox box = _key.currentContext!.findRenderObject() as RenderBox;
        Offset position = box.localToGlobal(Offset.zero);
        return Positioned(
          bottom: window.physicalSize.height / window.devicePixelRatio -
              (position.dy + 12),
          left: position.dx - 12,
          width: box.size.width + 24,
          child: SuggestionOverlay(
            controller: _controller,
            focus: _focus,
            currentSuggestions: _suggestions,
            suggestions: this.widget.suggestions,
            suggestionText: this.widget.suggestionText,
            suggestionBuilder: this.widget.suggestionBuilder,
            onSuggestionTapped: this.widget.onSuggestionTapped,
          ),
        );
      },
    );
    _focus.addListener(() {
      if (_focus.hasFocus && !_entry.mounted) {
        Overlay.of(context).insert(_entry);
      } else if (!_focus.hasFocus && _entry.mounted) {
        _entry.remove();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      key: _key,
      focusNode: _focus,
      controller: _controller,
      loseFocusOnTapOutside: false,
      onFieldSubmitted: (text) {
        if (_suggestions.length == 1) {
          this.widget.onSuggestionTapped?.call(_suggestions.first);
        }
        _controller.clear();
      },
    );
  }
}

class SuggestionOverlay<T> extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode focus;
  final List<T> currentSuggestions;
  final List<T> Function(String text) suggestions;
  final String Function(T item)? suggestionText;
  final Widget Function(T item)? suggestionBuilder;
  final void Function(T item)? onSuggestionTapped;

  const SuggestionOverlay({
    super.key,
    required this.currentSuggestions,
    required this.controller,
    required this.focus,
    required this.suggestions,
    this.suggestionText,
    this.suggestionBuilder,
    this.onSuggestionTapped,
  });

  @override
  State<SuggestionOverlay<T>> createState() => _SuggestionOverlayState();
}

class _SuggestionOverlayState<T> extends State<SuggestionOverlay<T>> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    this.widget.currentSuggestions.clear();
    this.widget.currentSuggestions.addAll(this.widget.suggestions(''));

    this.widget.controller.addListener(_handleControllerChange);
  }

  void _handleControllerChange() {
    setState(
      () {
        this.widget.currentSuggestions.clear();
        this.widget.currentSuggestions.addAll(
            this.widget.suggestions(this.widget.controller.text.trim()));
      },
    );
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerChange);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      paddingChild: const EdgeInsets.all(0),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 200),
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: Scrollbar(
            controller: _controller,
            thumbVisibility: true,
            child: ListView.separated(
              controller: _controller,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shrinkWrap: true,
              itemCount: this.widget.currentSuggestions.length,
              itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    this
                        .widget
                        .onSuggestionTapped
                        ?.call(this.widget.currentSuggestions[index]);
                    this.widget.focus.unfocus();
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: this.widget.suggestionText != null
                            ? ListTile(
                                title: Text(
                                  this.widget.suggestionText!(
                                      this.widget.currentSuggestions[index]),
                                ),
                                dense: true,
                              )
                            : this.widget.suggestionBuilder!(
                                this.widget.currentSuggestions[index],
                              ),
                      ),
                      if (this.widget.currentSuggestions.length == 1)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Container(
                            height: 24.0,
                            width: 92.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              'Press Enter',
                              style: Theme.of(context).textTheme.labelSmall,
                            ),
                          ),
                        )
                    ],
                  )),
              separatorBuilder: (context, index) => const Divider(thickness: 0),
            ),
          ),
        ),
      ),
    );
  }
}
