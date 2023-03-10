import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:mealo/widgets/base/functional/suggestion_text_field/suggestion_list_tile.dart';

import '../../ui/card.dart';
import 'suggestion_text_field.dart';

class SuggestionOverlay<T> extends StatefulWidget {
  final GlobalKey textFieldKey;
  final LayerLink link;
  final TextEditingController controller;
  final FocusNode focus;
  final List<T> currentSuggestions;
  final List<T> Function(String text) suggestions;
  final String Function(T item)? suggestionText;
  final Widget Function(T item)? suggestionBuilder;
  final void Function(T item)? onSuggestionTapped;
  final void Function(String text)? onCreateNew;
  final int Function(T a, T b)? sort;
  final ExpandType expandType;
  final double? minWidth;

  const SuggestionOverlay({
    super.key,
    required this.textFieldKey,
    required this.link,
    required this.currentSuggestions,
    required this.controller,
    required this.focus,
    required this.suggestions,
    this.suggestionText,
    this.suggestionBuilder,
    this.onSuggestionTapped,
    this.onCreateNew,
    this.sort,
    required this.expandType,
    this.minWidth,
  });

  @override
  State<SuggestionOverlay<T>> createState() => _SuggestionOverlayState();
}

class _SuggestionOverlayState<T> extends State<SuggestionOverlay<T>> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();

    _handleControllerChange();

    this.widget.controller.addListener(_handleControllerChange);
  }

  void _handleControllerChange() {
    if (mounted) {
      setState(
        () {
          this.widget.currentSuggestions.clear();
          this.widget.currentSuggestions.addAll(
                this.widget.suggestions(this.widget.controller.text.trim())
                  ..sort(this.widget.sort),
              );
        },
      );
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_handleControllerChange);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = this.widget.link.leaderSize!.width + 32;
    Offset baseOffset = const Offset(-16, 12);

    double width = baseWidth;
    Offset offset = baseOffset.copyWith();

    if (this.widget.minWidth != null) {
      final box = this.widget.textFieldKey.currentContext!.findRenderObject()
          as RenderBox;
      final pos = box.localToGlobal(Offset.zero);

      double screenWidth = MediaQuery.of(context).size.width;
      width = min(screenWidth, max(width, this.widget.minWidth!));

      switch (this.widget.expandType) {
        case ExpandType.left:
          width = width > (screenWidth - (pos.dx + baseOffset.dx))
              ? (screenWidth - (pos.dx + baseOffset.dx))
              : width;
          break;
        case ExpandType.right:
          width = width > ((pos.dx + baseOffset.dx) + baseWidth)
              ? ((pos.dx + baseOffset.dx) + baseWidth)
              : width;
          offset = offset.copyWith(dx: offset.dx + baseWidth);
          break;
        case ExpandType.center:
          width = width > (pos.dx + baseOffset.dx + baseWidth / 2)
              ? (pos.dx + baseOffset.dx + baseWidth / 2)
              : width;
          offset = offset.copyWith(dx: offset.dx + baseWidth / 2);
          break;
      }
    }

    return Positioned(
      width: width,
      child: CompositedTransformFollower(
        link: this.widget.link,
        followerAnchor: () {
          switch (this.widget.expandType) {
            case ExpandType.left:
              return Alignment.bottomLeft;
            case ExpandType.center:
              return Alignment.bottomCenter;
            case ExpandType.right:
              return Alignment.bottomRight;
          }
        }(),
        offset: offset,
        child: TextFieldTapRegion(
          child: BaseCard(
            paddingChild: const EdgeInsets.all(0),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                removeBottom: true,
                removeRight: true,
                removeLeft: true,
                child: Scrollbar(
                  controller: _controller,
                  thumbVisibility: true,
                  child: ListView(
                    controller: _controller,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shrinkWrap: true,
                    children: [
                      ...this.widget.currentSuggestions.expandIndexed(
                            (index, suggestion) => [
                              SuggestionListTile(
                                suggestion: suggestion,
                                controller: this.widget.controller,
                                focus: this.widget.focus,
                                currentSuggestions:
                                    this.widget.currentSuggestions,
                                suggestionText: this.widget.suggestionText,
                                suggestionBuilder:
                                    this.widget.suggestionBuilder,
                                onSuggestionTapped:
                                    this.widget.onSuggestionTapped,
                              ),
                              if (index <
                                      this.widget.currentSuggestions.length -
                                          1 ||
                                  (this.widget.controller.text.isNotEmpty &&
                                      (this.widget.onCreateNew != null ||
                                          this
                                              .widget
                                              .currentSuggestions
                                              .isEmpty)))
                                const Divider(thickness: 0),
                            ],
                          ),
                      if (this.widget.onCreateNew != null &&
                          (this.widget.controller.text.isNotEmpty ||
                              this.widget.currentSuggestions.isEmpty))
                        // if (this.widget.controller.text.isNotEmpty &&
                        //     (this.widget.onCreateNew != null ||
                        //         this.widget.currentSuggestions.isEmpty))
                        SuggestionListTile(
                          controller: this.widget.controller,
                          focus: this.widget.focus,
                          currentSuggestions: this.widget.currentSuggestions,
                          onCreateNew: this.widget.onCreateNew,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
