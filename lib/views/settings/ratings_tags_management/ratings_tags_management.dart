import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/views/settings/ratings_tags_management/widgets/ratings_management.dart';
import 'package:mealo/views/settings/ratings_tags_management/widgets/tags_management.dart';
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
          slivers: const [
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  RatingsManagement(),
                  TagsManagement(),
                ],
              ),
            ),
          ]),
    );
  }
}
