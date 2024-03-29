import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/design_system.dart';
import '../../../../../utils/modal.dart';
import '../../../../../utils/validation.dart';
import '../../../../../widgets/base/functional/text_form_field.dart';
import '../../../../../widgets/base/ui/text_button.dart';
import '../../../../../widgets/dialog/info.dart';

class ImageFromURLDialog extends StatefulWidget {
  const ImageFromURLDialog({super.key});

  @override
  State<ImageFromURLDialog> createState() => _ImageFromURLDialogState();
}

class _ImageFromURLDialogState extends State<ImageFromURLDialog> {
  final GlobalKey<FormState> _form = GlobalKey();
  final TextEditingController _url = TextEditingController();

  Future<void> _fetchImageAndParse() async {
    Response response = await Dio().get(
      _url.text.trim(),
      options: Options(
        responseType: ResponseType.bytes,
      ),
    );
    if (mounted) {
      if (response.headers.value('content-type')?.startsWith('image') ??
          false) {
        Navigator.of(context).pop(response.data);
      } else {
        ModalUtils.showBaseDialog(
          context,
          const InfoDialog(
              title: 'Invalid',
              text:
                  'Even though the URL seems to be alright, it\'s not possible to retrieve an image from it. Make sure the URL is directly pointing to the image and is publicly available!'),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Image from URL'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text('Enter the URL of the image you want to use.'),
          SizedBox(height: DesignSystem.spacing.x24),
          Form(
            key: _form,
            child: BaseTextFormField(
              controller: _url,
              hintText: 'URL',
              maxLines: 5,
              validator: ValidationUtils.url,
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
          onPressed: () {
            if (_form.currentState!.validate()) {
              _fetchImageAndParse();
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
