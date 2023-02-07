import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/utils/styling.dart';
import 'package:mealo/views/settings/ratings_tags_management/widgets/add_edit_base_model_dialog.dart';
import 'package:mealo/widgets/base/async_value_builder.dart';

import '../../../../models/models.dart';

class BaseModelManagement<T extends BaseModel> extends ConsumerStatefulWidget {
  final ProviderListenable<AsyncValue<List<T>>> provider;

  final String? Function(String?)? validator;

  final Future<int>? Function(T entity, String name) onEdit;
  final Future<bool>? Function(String uuid) onDelete;

  final bool editMode;

  const BaseModelManagement({
    super.key,
    required this.provider,
    this.validator,
    required this.onEdit,
    required this.onDelete,
    this.editMode = false,
  });

  @override
  ConsumerState<BaseModelManagement> createState() =>
      _BaseModelManagementState<T>();
}

class _BaseModelManagementState<T extends BaseModel>
    extends ConsumerState<BaseModelManagement<T>> {
  List<Widget> _entityTiles(List<T> entities) {
    entities.sort(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    );
    return entities
        .map(
          (entity) => ListTile(
            title: Text(entity.name),
            trailing: AnimatedSwitcher(
              duration: StylingUtils.kBaseAnimationDuration,
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: child,
              ),
              child: this.widget.editMode
                  ? Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () => showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) => AddEditBaseModelDialog(
                              editingModel: entity,
                              onEdit: (name) =>
                                  this.widget.onEdit(entity, name),
                            ),
                          ),
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              CupertinoColors.activeBlue,
                            ),
                          ),
                          child: const Icon(
                            CupertinoIcons.pencil,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 12.0),
                        ElevatedButton(
                          onPressed: () => this.widget.onDelete(entity.uuid),
                          style: const ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(
                              CupertinoColors.destructiveRed,
                            ),
                          ),
                          child: const Icon(
                            CupertinoIcons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
            ),
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<T>> asyncEntities = ref.watch(this.widget.provider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncEntities,
      skipLoadingOnReload: true,
      data: (entities) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._entityTiles(entities),
        ],
      ),
    );
  }
}
