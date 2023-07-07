import 'package:flutter/material.dart';

import '../base/ui/text_button.dart';

class ConfirmationDialog extends StatelessWidget {
  final String? title;
  final String? text;

  final String? yesText;
  final String? noText;

  final bool isYesDestructive;

  final void Function()? onYes;
  final void Function()? onNo;

  const ConfirmationDialog({
    super.key,
    this.title,
    this.text,
    this.yesText,
    this.noText,
    this.onYes,
    this.onNo,
    this.isYesDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(this.title ?? 'Warning'),
      content: Text(this.text ??
          'Are you sure you want to do this? This action can\'t be undone!'),
      actions: [
        BaseTextButton(
          onPressed: () {
            Navigator.of(context).pop();
            this.onNo?.call();
          },
          child: Text(this.noText ?? 'No'),
        ),
        BaseTextButton(
          onPressed: () {
            Navigator.of(context).pop();
            this.onYes?.call();
          },
          isDestructive: this.isYesDestructive,
          child: Text(this.yesText ?? 'Yes'),
        ),
      ],
    );
  }
}
