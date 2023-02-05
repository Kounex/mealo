import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/widgets/base/async_value_builder.dart';

import '../../../../models/models.dart';
import '../../../../widgets/base/text_form_field.dart';

class BaseModelManagement<T extends BaseModel> extends ConsumerStatefulWidget {
  final ProviderListenable<AsyncValue<List<T>>> provider;

  final Future<int>? Function(String name) onAdd;
  final Future<bool>? Function(String uuid) onDelete;
  final String? Function(String?)? validator;

  const BaseModelManagement({
    super.key,
    required this.provider,
    required this.onAdd,
    required this.onDelete,
    this.validator,
  });

  @override
  ConsumerState<BaseModelManagement> createState() =>
      _BaseModelManagementState<T>();
}

class _BaseModelManagementState<T extends BaseModel>
    extends ConsumerState<BaseModelManagement<T>> {
  final GlobalKey<FormState> _form = GlobalKey();
  final TextEditingController _controller = TextEditingController();

  void _addEntity() async {
    await this.widget.onAdd(_controller.text);

    _controller.clear();
  }

  List<Widget> _entityTiles(List<T> entities) {
    entities.sort(
      (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
    );
    return entities
        .map(
          (entity) => ListTile(
            title: Text(entity.name),
            trailing: IconButton(
              onPressed: () => this.widget.onDelete(entity.uuid),
              icon: const Icon(CupertinoIcons.delete),
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
      data: (entities) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ..._entityTiles(entities),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Form(
                    key: _form,
                    child: BaseTextFormField(
                      controller: _controller,
                      hintText: 'New ${T.toString()}',
                      validator: this.widget.validator,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      _addEntity();
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
