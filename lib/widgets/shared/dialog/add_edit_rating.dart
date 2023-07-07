import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../widgets/base/functional/text_form_field.dart';
import '../../../models/rating/rating.dart';
import '../../../utils/isar.dart';
import '../../../utils/modal.dart';
import '../../../utils/validation.dart';
import '../../base/ui/text_button.dart';
import '../../dialog/confirmation.dart';

class AddEditRatingDialog extends ConsumerStatefulWidget {
  final Rating? rating;
  final String? name;

  const AddEditRatingDialog({
    super.key,
    this.rating,
    this.name,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddEditRatingState();
}

class _AddEditRatingState extends ConsumerState<AddEditRatingDialog> {
  final GlobalKey<FormState> _form = GlobalKey();
  late TextEditingController _name;
  late TextEditingController _description;

  @override
  void initState() {
    super.initState();

    _name = TextEditingController(
        text: this.widget.rating?.name ?? this.widget.name ?? '');

    _description = TextEditingController(text: this.widget.rating?.description);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${this.widget.rating != null ? "Edit" : "Add"} Rating',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          if (this.widget.rating != null)
            BaseTextButton(
              onPressed: () => ModalUtils.showBaseDialog(
                context,
                ConfirmationDialog(
                  title: 'Delete Rating',
                  text:
                      'Aure you sure you want to delete ${this.widget.rating!.name}? This action can\'t be undone!',
                  isYesDestructive: true,
                  onYes: () {
                    IsarUtils.crud(
                      (isar) =>
                          isar.ratings.deleteByUuid(this.widget.rating!.uuid),
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
          if (this.widget.rating != null)
            const Text('Enter the name and description for the Rating entity:'),
          if (this.widget.rating == null)
            const Text(
                'Ratings apply to all meals. You will need to update existing meals and set the value of the new rating.'),
          const SizedBox(height: 12.0),
          Form(
            key: _form,
            child: Column(
              children: [
                BaseTextFormField(
                  controller: _name..addListener(() => setState(() {})),
                  hintText: 'Rating...',
                  validator: (text) {
                    String? error;
                    error = ValidationUtils.name(text);
                    if (this.widget.rating == null && error == null) {
                      if (ref.read(ratingsProvider).valueOrNull?.any((rating) =>
                              rating.name.toLowerCase() ==
                              text!.toLowerCase().trim()) ??
                          true) {
                        error = 'Rating already exists!';
                      }
                    }
                    return error;
                  },
                ),
                const SizedBox(height: 12.0),
                BaseTextFormField(
                  controller: _description,
                  hintText: 'Description...',
                  minLines: 2,
                ),
              ],
            ),
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
              Rating? rating = this.widget.rating ?? Rating();

              rating = await IsarUtils.crud(
                (isar) async => isar.ratings.get(
                  await isar.ratings.put(
                    rating!..name = _name.text.trim(),
                  ),
                ),
              );

              Navigator.of(context).pop(rating);
            }
          },
          child: Text(this.widget.rating != null ? 'Save' : 'Add'),
        ),
      ],
    );
  }
}
