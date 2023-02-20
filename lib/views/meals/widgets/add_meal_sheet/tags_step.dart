import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/tag/tag.dart';
import 'package:mealo/widgets/base/functional/async_value_builder.dart';

class TagsStep extends ConsumerWidget {
  const TagsStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Tag>> asyncTags = ref.watch(tagsProvider);
    return BaseAsyncValueBuilder(
      asyncValue: asyncTags,
      data: (tags) => const Text('Tags'),
    );
  }
}
