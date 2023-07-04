import 'package:flutter/material.dart';
import '../../../utils/styling.dart';

class BaseChip extends StatelessWidget {
  final String? text;
  final Widget? label;

  final Color? color;

  final void Function()? onDeleted;

  const BaseChip({
    super.key,
    this.text,
    this.label,
    this.color,
    this.onDeleted,
  });

  @override
  Widget build(BuildContext context) {
    Color? foregroundColor = this.color != null
        ? StylingUtils.surroundingAwareAccent(surroundingColor: this.color)
        : null;

    return Chip(
      label: this.label ??
          Text(
            this.text ?? '',
            style: TextStyle(color: foregroundColor),
          ),
      backgroundColor: this.color,
      deleteIconColor: foregroundColor,
      side: BorderSide(
        color: StylingUtils.lightDisabledColor(context),
      ),
      onDeleted: this.onDeleted,
    );
  }
}
