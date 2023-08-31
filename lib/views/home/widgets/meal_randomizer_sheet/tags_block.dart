import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:mealo/utils/design_system.dart';
import 'package:mealo/widgets/base/ui/chip.dart';

import '../../../../models/tag/tag.dart';
import '../../../../widgets/base/functional/suggestion_text_field/suggestion_text_field.dart';

class TagsBlock extends StatelessWidget {
  final List<Tag> tags;
  final List<Tag> selectedTags;

  final String? title;

  final void Function(Tag tag) onAdd;
  final void Function(Tag tag) onRemove;

  const TagsBlock({
    super.key,
    required this.tags,
    required this.selectedTags,
    this.title,
    required this.onAdd,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (this.title case var title?)
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        SizedBox(height: DesignSystem.spacing.x12),
        BaseSuggestionTextField<Tag>(
          suggestions: (text) => this
              .tags
              .where((tag) =>
                  !this.selectedTags.contains(tag) &&
                  tag.name.toLowerCase().contains(text.toLowerCase()))
              .toList(),
          hintText: 'Search for tags...',
          suggestionText: (tag) => tag.name,
          sort: (tag1, tag2) =>
              tag1.name.toLowerCase().compareTo(tag2.name.toLowerCase()),
          onSuggestionTapped: this.onAdd,
        ),
        SizedBox(height: DesignSystem.spacing.x12),
        Wrap(
          direction: Axis.horizontal,
          spacing: DesignSystem.spacing.x8,
          children: this
              .selectedTags
              .map(
                (tag) => BaseChip(
                  text: tag.name,
                  color: tag.colorHex?.toColor,
                  onDeleted: () => this.onRemove(tag),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
