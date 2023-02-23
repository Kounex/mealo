import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mealo/widgets/base/functional/suggestion_text_field/suggestion_list_tile.dart';

import '../../ui/card.dart';

class SuggestionOverlay<T> extends StatefulWidget {
  final LayerLink link;
  final TextEditingController controller;
  final FocusNode focus;
  final List<T> currentSuggestions;
  final List<T> Function(String text) suggestions;
  final String Function(T item)? suggestionText;
  final Widget Function(T item)? suggestionBuilder;
  final void Function(T item)? onSuggestionTapped;
  final void Function(String text)? onCreateNew;

  const SuggestionOverlay({
    super.key,
    required this.link,
    required this.currentSuggestions,
    required this.controller,
    required this.focus,
    required this.suggestions,
    this.suggestionText,
    this.suggestionBuilder,
    this.onSuggestionTapped,
    this.onCreateNew,
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
    if (mounted) {
      setState(
        () {
          this.widget.currentSuggestions.clear();
          this.widget.currentSuggestions.addAll(
                this.widget.suggestions(this.widget.controller.text.trim()),
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
    return Positioned(
      width: this.widget.link.leaderSize!.width + 32,
      child: CompositedTransformFollower(
        link: this.widget.link,
        followerAnchor: Alignment.bottomLeft,
        offset: const Offset(-16, 12),
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
                              suggestionBuilder: this.widget.suggestionBuilder,
                              onSuggestionTapped:
                                  this.widget.onSuggestionTapped,
                            ),
                            if (index <
                                    this.widget.currentSuggestions.length - 1 ||
                                this.widget.controller.text.isNotEmpty)
                              const Divider(thickness: 0),
                          ],
                        ),
                    if (this.widget.controller.text.isNotEmpty)
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
    );
  }
}
