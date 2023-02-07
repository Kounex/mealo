import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/models.dart';

import '../../../../widgets/base/text_form_field.dart';

class AddEditBaseModelDialog<T extends BaseModel>
    extends ConsumerStatefulWidget {
  final T? editingModel;

  final String? Function(String?)? validator;

  final Future<int>? Function(String name)? onAdd;
  final Future<int>? Function(String name)? onEdit;

  const AddEditBaseModelDialog({
    super.key,
    this.editingModel,
    this.validator,
    this.onAdd,
    this.onEdit,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddEditBaseModelDialogState();
}

class _AddEditBaseModelDialogState<T extends BaseModel>
    extends ConsumerState<AddEditBaseModelDialog> {
  final GlobalKey<FormState> _form = GlobalKey();
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
        text: this.widget.editingModel != null
            ? this.widget.editingModel!.name
            : '');
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
      title: Text(
        _getTitle(),
        style: Theme.of(context).textTheme.headlineSmall,
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
          onPressed: _controller.text.isNotEmpty &&
                  (this.widget.editingModel == null ||
                      this.widget.editingModel!.name != _controller.text.trim())
              ? () {
                  if (_form.currentState!.validate()) {
                    if (this.widget.editingModel != null) {
                      this.widget.onEdit?.call(_controller.text.trim());
                    } else {
                      this.widget.onAdd?.call(_controller.text.trim());
                    }

                    Navigator.of(context).pop();
                  }
                }
              : null,
          child: Text(this.widget.editingModel != null ? 'Save' : 'Add'),
        ),
      ],
    );
  }
}
