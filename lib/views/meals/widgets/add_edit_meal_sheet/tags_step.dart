import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/tag/tag.dart';
import '../../../../types/extensions/string.dart';
import '../../../../utils/modal.dart';
import '../../../../widgets/base/functional/async_value_builder.dart';
import '../../../../widgets/base/functional/suggestion_text_field/suggestion_text_field.dart';
import '../../../../widgets/base/ui/card.dart';
import '../../../../widgets/base/ui/chip.dart';
import '../../../../widgets/base/ui/placeholder_text.dart';
import '../../../../widgets/shared/dialog/add_edit_tag/add_edit_tag.dart';

class TagsStep extends ConsumerStatefulWidget {
  final Set<Tag> tags;

  const TagsStep({
    super.key,
    required this.tags,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TagsStepState();
}

class _TagsStepState extends ConsumerState<TagsStep> {
  List<Tag> _suggestions(List<Tag> tags, String text) {
    /// Here we will determine the list of tags which are available in the
    /// suggestion textfield for the user to select from
    return tags.where(
      (tag) {
        /// First we check for those tags which have not been selected so far
        bool tagNotSelected = this
            .widget
            .tags
            .every((selectedTag) => selectedTag.uuid != tag.uuid);

        /// Since the user can also write into the suggestion textfield to
        /// filter the tags, we will check for those tags whose name contains
        /// the given text
        bool tagWithTextExists = text.trim().isEmpty
            ? true
            : tag.name.toLowerCase().contains(
                  text.toLowerCase().trim(),
                );

        /// Now both have to be true so we get those tags which have not been
        /// selected by the user so far and match the text given by the user
        /// (will be all non selected tags if the user has not put in any text)
        return tagNotSelected && tagWithTextExists;
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Tag>> asyncTags = ref.watch(tagsProvider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncTags,
      data: (tags) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BaseSuggestionTextField(
            suggestions: (text) => _suggestions(tags, text),
            hintText: 'Search for tags...',
            suggestionText: (tag) => tag.name,
            sort: (tag1, tag2) =>
                tag1.name.toLowerCase().compareTo(tag2.name.toLowerCase()),
            onCreateNew: (text) async {
              Tag? tag = await ModalUtils.showBaseDialog(
                context,
                AddEditTagDialog(
                  name: text,
                ),
              );
              if (tag != null) {
                setState(() => this.widget.tags.add(tag));
              }
            },
            onSuggestionTapped: (tag) =>
                setState(() => this.widget.tags.add(tag)),
          ),
          const SizedBox(height: 24.0),
          BaseCard(
            topPadding: 0,
            bottomPadding: 0,
            leftPadding: 0,
            rightPadding: 0,
            child: this.widget.tags.isNotEmpty
                ? Align(
                    alignment: Alignment.centerLeft,
                    child: Wrap(
                      spacing: 12.0,
                      children: this
                          .widget
                          .tags
                          .map(
                            (tag) => BaseChip(
                              text: tag.name,
                              color: tag.colorHex?.toColor(),
                              onDeleted: () =>
                                  setState(() => this.widget.tags.remove(tag)),
                            ),
                          )
                          .toList(),
                    ),
                  )
                : const Center(
                    child: BasePlaceholder(text: 'No tags added yet'),
                  ),
          ),
        ],
      ),
    );
  }
}
