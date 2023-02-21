import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/tag/tag.dart';
import 'package:mealo/widgets/base/functional/async_value_builder.dart';
import 'package:mealo/widgets/base/functional/suggestion_text_field.dart';

class TagsStep extends ConsumerStatefulWidget {
  final List<Tag> tags;

  const TagsStep({
    super.key,
    required this.tags,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TagsStepState();
}

class _TagsStepState extends ConsumerState<TagsStep> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Tag>> asyncTags = ref.watch(tagsProvider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncTags,
      data: (tags) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Tags',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 24.0),
          BaseSuggestionTextField(
            suggestions: (text) => tags
                .where(
                  (tag) =>
                      !this.widget.tags.contains(tag) &&
                      (text.trim().isEmpty
                          ? true
                          : tag.name.toLowerCase().contains(
                                text.toLowerCase().trim(),
                              )),
                )
                .toList(),
            suggestionText: (tag) => tag.name,
            onSuggestionTapped: (tag) =>
                setState(() => this.widget.tags.add(tag)),
          ),
          const SizedBox(height: 12.0),
          this.widget.tags.isNotEmpty
              ? Wrap(
                  spacing: 12.0,
                  children: this
                      .widget
                      .tags
                      .map(
                        (tag) => Chip(label: Text(tag.name)),
                      )
                      .toList(),
                )
              : Text(
                  'No tags yet',
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
        ],
      ),
    );
  }
}
