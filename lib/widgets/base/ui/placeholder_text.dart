import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class BasePlaceholderText extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool useIcon;

  final TextAlign? textAlign;

  const BasePlaceholderText({
    super.key,
    required this.text,
    this.icon,
    this.useIcon = true,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (this.useIcon) ...[
          Icon(
            this.icon ?? FluentIcons.mail_inbox_dismiss_24_filled,
            size: 64.0,
            color: Theme.of(context).disabledColor,
          ),
          const SizedBox(height: 12.0),
        ],
        Text(
          this.text,
          textAlign: this.textAlign,
          style: Theme.of(context).textTheme.labelSmall!.copyWith(
                fontSize: Theme.of(context).textTheme.bodyMedium!.fontSize,
                color: Theme.of(context).disabledColor,
              ),
        ),
      ],
    );
  }
}
