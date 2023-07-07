import 'package:flutter/material.dart';

import '../base/ui/text_button.dart';

class InfoDialog extends StatelessWidget {
  final String title;
  final String text;

  final String? okText;

  const InfoDialog({
    super.key,
    required this.title,
    required this.text,
    this.okText,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title),
      content: Text(this.text),
      actions: [
        BaseTextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(this.okText ?? 'Ok'),
        ),
      ],
    );
  }
}
