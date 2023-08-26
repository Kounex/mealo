import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../utils/design_system.dart';

class BasePlaceholder extends StatelessWidget {
  final String text;
  final IconData? icon;
  final bool useIcon;

  final TextAlign textAlign;

  const BasePlaceholder({
    super.key,
    required this.text,
    this.icon,
    this.useIcon = true,
    this.textAlign = TextAlign.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (this.useIcon) ...[
          Icon(
            this.icon ?? FluentIcons.mail_inbox_dismiss_24_filled,
            size: DesignSystem.size.x64,
            color: Theme.of(context).disabledColor,
          ),
          SizedBox(height: DesignSystem.spacing.x12),
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
