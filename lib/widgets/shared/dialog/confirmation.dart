import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';

class MealoConfirmationDialog extends StatelessWidget {
  final String? title;
  final String? body;

  final bool isYesDestructive;

  final void Function(bool isDontShowAgainChecked) onYes;

  const MealoConfirmationDialog({
    super.key,
    this.title,
    this.body,
    this.isYesDestructive = false,
    required this.onYes,
  });

  @override
  Widget build(BuildContext context) {
    return BaseConfirmationDialog(
      title: this.title,
      body: this.body,
      platform: TargetPlatform.android,
      isYesDestructive: this.isYesDestructive,
      onYes: this.onYes,
    );
  }
}
