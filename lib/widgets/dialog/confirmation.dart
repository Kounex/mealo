import 'package:flutter/material.dart';

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
        TextButton(
          onPressed: () {
            this.onNo?.call();
            Navigator.of(context).pop();
          },
          child: Text(this.noText ?? 'No'),
        ),
        TextButton(
          onPressed: () {
            this.onYes?.call();
            Navigator.of(context).pop();
          },
          style: this.isYesDestructive
              ? ButtonStyle(
                  foregroundColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.error,
                  ),
                  overlayColor: MaterialStatePropertyAll(
                    Theme.of(context).colorScheme.error.withOpacity(0.1),
                  ),
                )
              : null,
          child: Text(this.yesText ?? 'Yes'),
        ),
      ],
    );
  }
}
