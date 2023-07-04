import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'widgets/ratings_overview.dart';
import 'widgets/tags_overview.dart';
import '../../../widgets/base/functional/scaffold.dart';
import '../../../widgets/shared/dialog/add_edit_rating.dart';
import '../../../widgets/shared/dialog/add_edit_tag/add_edit_tag.dart';

class RatingsTagsManagementView extends ConsumerStatefulWidget {
  const RatingsTagsManagementView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RatingsTagsManagementViewState();
}

class _RatingsTagsManagementViewState
    extends ConsumerState<RatingsTagsManagementView> {
  final bool _editMode = false;

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
          // IconButton(
          //   onPressed: () => setState(() => _editMode = !_editMode),
          //   icon: Icon(
          //     _editMode ? CupertinoIcons.checkmark_alt : CupertinoIcons.pencil,
          //   ),
          // ),
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
