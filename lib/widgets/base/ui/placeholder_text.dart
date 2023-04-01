import 'package:flutter/material.dart';

class BasePlaceholderText extends StatelessWidget {
  final String text;

  final TextAlign? textAlign;

  const BasePlaceholderText({
    super.key,
    required this.text,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      this.text,
      textAlign: this.textAlign,
      style: Theme.of(context).textTheme.labelSmall!.copyWith(
            fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
            color: Theme.of(context).disabledColor,
          ),
    );
  }
}
