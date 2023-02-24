import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/tag/tag.dart';
import 'package:mealo/types/extensions/string.dart';
import 'package:mealo/widgets/base/ui/chip.dart';
import 'package:mealo/widgets/shared/dialog/add_edit_tag/add_edit_tag.dart';

import '../../../../utils/modal.dart';
import '../../../../widgets/base/functional/async_value_builder.dart';
import '../../../../widgets/base/ui/card.dart';

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
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 12.0,
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
