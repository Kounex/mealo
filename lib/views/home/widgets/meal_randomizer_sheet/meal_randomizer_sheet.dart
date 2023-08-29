import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/rating/rating.dart';
import 'package:mealo/models/tag/tag.dart';
import 'package:mealo/utils/design_system.dart';
import 'package:mealo/views/home/widgets/meal_randomizer_sheet/providers/tags.dart';
import 'package:mealo/views/home/widgets/meal_randomizer_sheet/tags_block.dart';
import 'package:mealo/widgets/base/functional/async_value_builder.dart';
import 'package:mealo/widgets/base/ui/card.dart';
import 'package:mealo/widgets/base/ui/on_off_indicator.dart';
import 'package:mealo/widgets/base/ui/text_button.dart';

class MealRandomizerSheet extends ConsumerStatefulWidget {
  const MealRandomizerSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MealRandomizerSheetState();
}

class _MealRandomizerSheetState extends ConsumerState<MealRandomizerSheet> {
  final bool _filtersExpanded = false;

  bool _areFiltersActive() {
    return ref.read(includedTagsProvider).isNotEmpty ||
        ref.read(excludedTagsProvider).isNotEmpty;
  }

  void _setFiltersDefault() {
    ref.read(includedTagsProvider.notifier).clear();
    ref.read(excludedTagsProvider.notifier).clear();
  }

  @override
  Widget build(BuildContext context) {
    final asyncTags = ref.watch(tagsProvider);
    final asyncRatings = ref.watch(ratingsProvider);

    final includedTags = ref.watch(includedTagsProvider);
    final excludedTags = ref.watch(excludedTagsProvider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncTags,
      data: (tags) {
        return BaseAsyncValueBuilder(
          asyncValue: asyncRatings,
          data: (ratings) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Randomize Next Meal',
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                            Text(
                              'Filter to your liking and let the app decide!',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        IconButton(
                          icon: const Icon(CupertinoIcons.clear),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      BaseCard(
                        topPadding: 0,
                        title: 'Filters',
                        expandable: true,
                        expanded: _filtersExpanded,
                        trailingTitleWidget: Row(
                          children: [
                            BaseTextButton(
                              onPressed: _areFiltersActive()
                                  ? () => _setFiltersDefault()
                                  : null,
                              isDestructive: true,
                              child: const Text('Default'),
                            ),
                            SizedBox(width: DesignSystem.spacing.x8),
                            OnOffIndicator(
                              on: _areFiltersActive(),
                            ),
                            SizedBox(width: DesignSystem.spacing.x18),
                          ],
                        ),
                        child: Column(
                          children: [
                            TagsBlock(
                              tags: [...tags]..removeWhere(
                                  (tag) => excludedTags.contains(tag)),
                              selectedTags: includedTags,
                              title: 'Which tags should be included?',
                              onAdd: (tag) => ref
                                  .read(includedTagsProvider.notifier)
                                  .addTag(tag),
                              onRemove: (tag) => ref
                                  .read(includedTagsProvider.notifier)
                                  .removeTag(tag),
                            ),
                            SizedBox(height: DesignSystem.spacing.x24),
                            TagsBlock(
                              tags: [...tags]..removeWhere(
                                  (tag) => includedTags.contains(tag)),
                              selectedTags: excludedTags,
                              title: 'Which tags should NOT be included?',
                              onAdd: (tag) => ref
                                  .read(excludedTagsProvider.notifier)
                                  .addTag(tag),
                              onRemove: (tag) => ref
                                  .read(excludedTagsProvider.notifier)
                                  .removeTag(tag),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
