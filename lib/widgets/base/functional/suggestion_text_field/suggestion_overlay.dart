import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../utils/design_system.dart';
import '../../ui/card.dart';
import '../../ui/divider.dart';
import 'suggestion_list_tile.dart';
import 'suggestion_text_field.dart';

class SuggestionOverlay<T> extends StatefulWidget {
  final GlobalKey textFieldKey;
  final LayerLink link;
  final AnimationController animController;
  final TextEditingController controller;
  final FocusNode focus;
  final List<T> currentSuggestions;
  final List<T> Function(String text) suggestions;
  final String Function(T item)? suggestionText;
  final Widget Function(T item)? suggestionBuilder;
  final void Function(T item)? onSuggestionTapped;
  final void Function(String text)? onCreateNew;
  final int Function(T a, T b)? sort;
  final AnchorType expandType;
  final double? minWidth;
  final bool paintBorder;
  final Color? borderColor;

  const SuggestionOverlay({
    super.key,
    required this.textFieldKey,
    required this.link,
    required this.currentSuggestions,
    required this.animController,
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
    this.paintBorder = false,
    this.borderColor,
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
    this.widget.controller.removeListener(_handleControllerChange);

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
        case AnchorType.left:
          width = width > (screenWidth - (pos.dx + baseOffset.dx))
              ? (screenWidth - (pos.dx + baseOffset.dx))
              : width;
          break;
        case AnchorType.right:
          width = width > ((pos.dx + baseOffset.dx) + baseWidth)
              ? ((pos.dx + baseOffset.dx) + baseWidth)
              : width;
          offset = offset.copyWith(dx: offset.dx + baseWidth);
          break;
        case AnchorType.center:
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
        showWhenUnlinked: false,
        followerAnchor: () {
          switch (this.widget.expandType) {
            case AnchorType.left:
              return Alignment.bottomLeft;
            case AnchorType.center:
              return Alignment.bottomCenter;
            case AnchorType.right:
              return Alignment.bottomRight;
          }
        }(),
        offset: offset + const Offset(0, -10),
        child: TextFieldTapRegion(
          child: BaseCard(
            paintBorder: this.widget.paintBorder,
            borderColor: this.widget.borderColor ??
                DesignSystem.lightDisabledColor(context),
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
                    padding: const EdgeInsets.symmetric(vertical: 0),
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
                                const BaseDivider(),
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
        )
            .animate(controller: this.widget.animController)
            .moveY(
              begin: 10.0,
              end: 10.0,
              duration: Duration.zero,
            )
            .moveY(
              begin: 10.0,
              end: 0.0,
              duration: DesignSystem.animation.defaultDurationMS250,
            )
            .fadeIn(
              duration: DesignSystem.animation.defaultDurationMS250,
            ),
      ),
    );
  }
}
