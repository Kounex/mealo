import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/tag/tag.dart';
import '../../../../types/extensions/string.dart';
import '../../../../widgets/shared/dialog/add_edit_tag/add_edit_tag.dart';

class TagsOverview extends ConsumerWidget {
  const TagsOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Tag>> asyncTags = ref.watch(tagsProvider);

    return BaseCard(
      constrained: false,
      child: BaseAsyncValueBuilder(
        asyncValue: asyncTags,
        skipLoadingOnReload: true,
        data: (tags) => Padding(
          padding: EdgeInsets.all(DesignSystem.spacing.x8),
          child: Wrap(
            spacing: DesignSystem.spacing.x12,
            children: [
              ...tags.map(
                (tag) => GestureDetector(
                  child: BaseChip(
                    text: tag.name,
                    color: tag.colorHex?.toColor(),
                  ),
                  onTap: () => ModalUtils.showBaseDialog(
                    context,
                    AddEditTagDialog(
                      tag: tag,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
