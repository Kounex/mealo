import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../models/tag/tag.dart';
import '../../../../utils/modal.dart';
import '../../../../utils/validation.dart';
import '../../../dialog/confirmation.dart';

import '../../../../types/extensions/color.dart';
import '../../../../utils/isar.dart';
import '../../../../widgets/base/functional/text_form_field.dart';
import 'color_picker_tile.dart';

class AddEditTagDialog extends ConsumerStatefulWidget {
  final Tag? tag;
  final String? name;

  const AddEditTagDialog({
    super.key,
    this.tag,
    this.name,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AddEditTagDialogState();
}

class _AddEditTagDialogState extends ConsumerState<AddEditTagDialog> {
  final GlobalKey<FormState> _form = GlobalKey();
  late TextEditingController _controller;

  String? _colorHex;

  @override
  void initState() {
    super.initState();

    _controller = TextEditingController(
        text: this.widget.tag != null
            ? this.widget.tag!.name
            : this.widget.name ?? '');

    _colorHex = this.widget.tag?.colorHex;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${this.widget.tag != null ? "Edit" : "Add"} Tag',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (this.widget.tag != null)
            TextButton(
              onPressed: () => ModalUtils.showBaseDialog(
                context,
                ConfirmationDialog(
                  title: 'Delete Tag',
                  text:
                      'Aure you sure you want to delete ${this.widget.tag!.name}? This action can\'t be undone!',
                  isYesDestructive: true,
                  onYes: () {
                    IsarUtils.crud(
                      (isar) => isar.tags.deleteByUuid(this.widget.tag!.uuid),
                    );
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
          const Text('Enter the name for the Tag entity:'),
          const SizedBox(height: 12.0),
          Form(
            key: _form,
            child: BaseTextFormField(
              controller: _controller..addListener(() => setState(() {})),
              hintText: 'Tag...',
              validator: (text) {
                String? error;
                error = ValidationUtils.name(text);
                if (this.widget.tag == null && error == null) {
                  if (ref.read(tagsProvider).valueOrNull?.any((tag) =>
                          tag.name.toLowerCase() ==
                          text!.toLowerCase().trim()) ??
                      true) {
                    error = 'Tag already exists!';
                  }
                }
                return error;
              },
            ),
          ),
          const SizedBox(height: 12.0),
          ColorPickerTile(
            colorHex: _colorHex,
            onColorSet: (color) => setState(() => _colorHex = color?.toHex()),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () async {
            if (_form.currentState!.validate()) {
              Tag? tag = this.widget.tag ?? Tag();

              tag = await IsarUtils.crud(
                (isar) async => isar.tags.get(
                  await isar.tags.put(
                    tag!
                      ..name = _controller.text.trim()
                      ..colorHex = _colorHex,
                  ),
                ),
              );

              Navigator.of(context).pop(tag);
            }
          },
          child: Text(this.widget.tag != null ? 'Save' : 'Add'),
        ),
      ],
    );
  }
}
