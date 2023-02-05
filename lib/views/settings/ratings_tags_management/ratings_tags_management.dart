import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/rating/rating.dart';
import 'package:mealo/models/tag/tag.dart';
import 'package:mealo/utils/isar.dart';
import 'package:mealo/views/settings/ratings_tags_management/widgets/base_model_management.dart';
import 'package:mealo/widgets/base/scaffold.dart';

class RatingsTagsManagementView extends ConsumerWidget {
  const RatingsTagsManagementView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 2,
      child: BaseScaffold(
          appBarProperties: AppBarProperties(
              title: const Text('Ratings & Tags'),
              bottom: const TabBar(tabs: [
                Tab(
                  text: 'Ratings',
                ),
                Tab(
                  text: 'Tags',
                ),
              ])),
          hasBottomTabBarSpacing: true,
          slivers: [
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  BaseModelManagement(
                    provider: ratingsProvider,
                    onAdd: (name) => IsarUtils.crud(
                      (isar) => isar.ratings.put(Rating()..name = name),
                    ),
                    onDelete: (uuid) => IsarUtils.crud(
                      (isar) => isar.ratings.deleteByUuid(uuid),
                    ),
                  ),
                  BaseModelManagement(
                    provider: tagsProvider,
                    onAdd: (name) => IsarUtils.crud(
                      (isar) => isar.tags.put(Tag()..name = name),
                    ),
                    onDelete: (uuid) => IsarUtils.crud(
                      (isar) => isar.tags.deleteByUuid(uuid),
                    ),
                  ),
                ],
              ),
            ),
          ]),
    );
  }
}
