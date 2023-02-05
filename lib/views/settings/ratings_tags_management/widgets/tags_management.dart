import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/tag/tag.dart';
import 'package:mealo/stores/shared/tags/tags.dart';

class TagsManagement extends ConsumerWidget {
  const TagsManagement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Tag>> asyncTags = ref.watch(tagsProvider);

    return Column(
      children: [
        const Text('Tags'),
        ...asyncTags.when(
          data: (tags) => tags.map((tag) => Text(tag.name)).toList(),
          error: (error, stackTrace) => [
            Text(error.toString()),
          ],
          loading: () => [
            const CircularProgressIndicator(),
          ],
        )
      ],
    );
  }
}
