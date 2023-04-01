import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/models.dart';
import '../../../utils/modal.dart';
import '../../base/functional/text_form_field.dart';
import '../../dialog/confirmation.dart';

class AddEditModelDialog<T extends Model> extends ConsumerStatefulWidget {
  final T? editingModel;
  final String? name;

  final String? Function(String?)? validator;

  final Future<T?>? Function(String name)? onAdd;
  final Future<int?>? Function(String name)? onEdit;
  final Future<bool?>? Function(String uuid)? onDelete;

  const AddEditModelDialog({
    super.key,
    this.editingModel,
    this.name,
    this.validator,
    this.onAdd,
    this.onEdit,
    this.onDelete,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddEditModelDialogState();
}

class _AddEditModelDialogState<T extends Model>
    extends ConsumerState<AddEditModelDialog<T>> {
  final GlobalKey<FormState> _form = GlobalKey();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
        text: this.widget.editingModel != null
            ? this.widget.editingModel!.name
            : this.widget.name ?? '');
  }

  String _getGenericBaseModelType() =>
      this.widget.runtimeType.toString().split('<')[1].split('>')[0];

  String _getTitle() {
    String title = this.widget.editingModel != null ? 'Edit ' : 'Add ';

    title += _getGenericBaseModelType();

    return title;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _getTitle(),
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (this.widget.editingModel != null)
            TextButton(
              onPressed: () => ModalUtils.showBaseDialog(
                context,
                ConfirmationDialog(
                  title: 'Delete ${_getGenericBaseModelType()}',
                  text:
                      'Aure you sure you want to delete ${this.widget.editingModel!.name}? This action can\'t be undone!',
                  isYesDestructive: true,
                  onYes: () {
                    this.widget.onDelete?.call(this.widget.editingModel!.uuid);
                    Navigator.of(context).pop();
                  },
                ),
              ),
              style: ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.error),
              ),
              child: const Text('Delete'),
            ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Enter the name for the ${_getGenericBaseModelType()} entity:'),
          const SizedBox(height: 12.0),
          Form(
            key: _form,
            child: BaseTextFormField(
              controller: _controller..addListener(() => setState(() {})),
              hintText: '${_getGenericBaseModelType()}...',
              validator: this.widget.validator,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _controller.text.trim().isNotEmpty &&
                  (this.widget.editingModel == null ||
                      this.widget.editingModel!.name != _controller.text.trim())
              ? () async {
                  if (_form.currentState!.validate()) {
                    T? model = this.widget.editingModel;
                    if (this.widget.editingModel != null) {
                      this.widget.onEdit?.call(_controller.text.trim());
                    } else {
                      model = await this
                          .widget
                          .onAdd
                          ?.call(_controller.text.trim());
                    }
                    if (mounted) {
                      Navigator.of(context).pop(model);
                    }
                  }
                }
              : null,
          child: Text(this.widget.editingModel != null ? 'Save' : 'Add'),
        ),
      ],
    );
  }
}
