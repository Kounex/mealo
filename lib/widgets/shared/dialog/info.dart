import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';

class MealoInfoDialog extends StatelessWidget {
  final String? title;
  final String body;

  const MealoInfoDialog({
    super.key,
    this.title,
    required this.body,
  });

  @override
  Widget build(BuildContext context) {
    return BaseInfoDialog(
      title: this.title,
      body: this.body,
      platform: TargetPlatform.android,
    );
  }
}
