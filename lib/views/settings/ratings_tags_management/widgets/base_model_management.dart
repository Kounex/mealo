import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/models.dart';
import '../../../../utils/modal.dart';
import '../../../../widgets/base/async_value_builder.dart';
import '../../../../widgets/base/card.dart';
import 'add_edit_base_model_dialog.dart';

class BaseModelManagement<T extends BaseModel> extends ConsumerWidget {
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

  List<Widget> _entityWidgets(BuildContext context, List<T> entities) {
    entities.sort(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    );
    return entities
        .map(
          (entity) => GestureDetector(
            child: Chip(
              label: Text(entity.name),
            ),
            onTap: () => ModalUtils.showBaseDialog(
              context,
              AddEditBaseModelDialog<T>(
                editingModel: entity,
                onEdit: (name) => this.onEdit(entity, name),
                onDelete: this.onDelete,
              ),
            ),
          ),
          // ListTile(
          //   title: Text(entity.name),
          //   trailing: AnimatedSwitcher(
          //     duration: StylingUtils.kBaseAnimationDuration,
          //     transitionBuilder: (child, animation) => FadeTransition(
          //       opacity: animation,
          //       child: child,
          //     ),
          //     child: this.widget.editMode
          //         ? Row(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               ElevatedButton(
          //                 onPressed: () => showDialog(
          //                   context: context,
          //                   barrierDismissible: true,
          //                   builder: (context) => AddEditBaseModelDialog(
          //                     editingModel: entity,
          //                     onEdit: (name) =>
          //                         this.widget.onEdit(entity, name),
          //                   ),
          //                 ),
          //                 style: const ButtonStyle(
          //                   backgroundColor: MaterialStatePropertyAll(
          //                     CupertinoColors.activeBlue,
          //                   ),
          //                 ),
          //                 child: const Icon(
          //                   CupertinoIcons.pencil,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //               const SizedBox(width: 12.0),
          //               ElevatedButton(
          //                 onPressed: () => this.widget.onDelete(entity.uuid),
          //                 style: const ButtonStyle(
          //                   backgroundColor: MaterialStatePropertyAll(
          //                     CupertinoColors.destructiveRed,
          //                   ),
          //                 ),
          //                 child: const Icon(
          //                   CupertinoIcons.delete,
          //                   color: Colors.white,
          //                 ),
          //               ),
          //             ],
          //           )
          //         : const SizedBox(),
          //   ),
          // ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<T>> asyncEntities = ref.watch(this.provider);

    return BaseCard(
      constrained: false,
      child: BaseAsyncValueBuilder(
        asyncValue: asyncEntities,
        skipLoadingOnReload: true,
        data: (entities) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 12.0,
            children: [
              ..._entityWidgets(context, entities),
            ],
          ),
        ),
      ),
    );
  }
}
