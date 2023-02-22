import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/rating/rating.dart';
import 'package:mealo/models/tag/tag.dart';
import 'package:mealo/utils/isar.dart';
import 'package:mealo/views/settings/ratings_tags_management/widgets/base_model_management.dart';
import 'package:mealo/widgets/base/functional/scaffold.dart';

import 'widgets/add_edit_base_model_dialog.dart';

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
                    ? (_) => AddEditBaseModelDialog<Rating>(
                          onAdd: (name) => IsarUtils.crud(
                            (isar) async => isar.ratings.get(
                                await isar.ratings.put(Rating()..name = name)),
                          ),
                        )
                    : (_) => AddEditBaseModelDialog<Tag>(
                          onAdd: (name) => IsarUtils.crud(
                            (isar) async => isar.tags
                                .get(await isar.tags.put(Tag()..name = name)),
                          ),
                        ),
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
          BaseModelManagement(
            provider: ratingsProvider,
            editMode: _editMode,
            onEdit: (rating, name) =>
                IsarUtils.crud((isar) => isar.ratings.put(rating..name = name)),
            onDelete: (uuid) => IsarUtils.crud(
              (isar) => isar.ratings.deleteByUuid(uuid),
            ),
          ),
          BaseModelManagement(
            provider: tagsProvider,
            editMode: _editMode,
            onEdit: (tag, name) =>
                IsarUtils.crud((isar) => isar.tags.put(tag..name = name)),
            onDelete: (uuid) => IsarUtils.crud(
              (isar) => isar.tags.deleteByUuid(uuid),
            ),
          ),
        ],
      ),
    );
  }
}
