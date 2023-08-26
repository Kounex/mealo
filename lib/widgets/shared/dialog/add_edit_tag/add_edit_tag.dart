import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/tag/tag.dart';
import '../../../../types/extensions/color.dart';
import '../../../../utils/design_system.dart';
import '../../../../utils/modal.dart';
import '../../../../utils/persistance.dart';
import '../../../../utils/validation.dart';
import '../../../../widgets/base/functional/text_form_field.dart';
import '../../../base/ui/text_button.dart';
import '../../../dialog/confirmation.dart';
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
            BaseTextButton(
              onPressed: () => ModalUtils.showBaseDialog(
                context,
                ConfirmationDialog(
                  title: 'Delete Tag',
                  text:
                      'Aure you sure you want to delete ${this.widget.tag!.name}? This action can\'t be undone!',
                  isYesDestructive: true,
                  onYes: () {
                    PersistanceUtils.transaction(
                      PersistanceOperation.delete,
                      [this.widget.tag!],
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ),
              isDestructive: true,
              child: const Text('Delete'),
            ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Enter the name for the Tag entity:'),
          SizedBox(height: DesignSystem.spacing.x12),
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
          SizedBox(height: DesignSystem.spacing.x12),
          ColorPickerTile(
            colorHex: _colorHex,
            onColorSet: (color) => setState(() => _colorHex = color?.toHex()),
          ),
        ],
      ),
      actions: [
        BaseTextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        BaseTextButton(
          onPressed: () async {
            if (_form.currentState!.validate()) {
              Tag? tag = this.widget.tag ?? Tag();

              PersistanceUtils.transaction(
                PersistanceOperation.insertUpdate,
                [
                  tag
                    ..name = _controller.text.trim()
                    ..colorHex = _colorHex,
                ],
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
