import 'package:base_components/base_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../widgets/shared/dialog/add_edit_rating.dart';
import '../../../widgets/shared/dialog/add_edit_tag/add_edit_tag.dart';
import 'widgets/ratings_overview.dart';
import 'widgets/tags_overview.dart';

class RatingsTagsManagementView extends StatelessWidget {
  const RatingsTagsManagementView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      hasBottomTabBarSpacing: true,
      appBarProperties: AppBarProperties(
        title: const Text('Ratings & Tags'),
        // expandedHeight: 150,
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () => showDialog(
                context: context,
                barrierDismissible: true,
                builder: DefaultTabController.of(context).index == 0
                    ? (_) => const AddEditRatingDialog()
                    : (_) => const AddEditTagDialog(),
              ),
              icon: const Icon(CupertinoIcons.add),
            );
          }),
        ],
      ),
      tabBarProperties: TabBarProperties(
        titles: ['Ratings', 'Tags'],
        children: [
          const RatingsOverview(),
          const TagsOverview(),
        ],
      ),
    );
  }
}
