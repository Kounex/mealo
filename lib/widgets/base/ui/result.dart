import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum BaseResultIcon {
  positive,
  negative,
  missing,
}

extension BaseResultIconFunctions on BaseResultIcon {
  IconData get data => const {
        BaseResultIcon.positive: CupertinoIcons.check_mark_circled,
        BaseResultIcon.negative: CupertinoIcons.clear_circled,
        BaseResultIcon.missing: Icons.search_off,
      }[this]!;
}

class BaseResult extends StatelessWidget {
  final BaseResultIcon icon;

  final String? text;

  final double iconSize;
  final Color? iconColor;

  const BaseResult({
    Key? key,
    this.icon = BaseResultIcon.positive,
    this.text,
    this.iconSize = 32.0,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          this.icon.data,
          size: this.iconSize,
          color: this.iconColor,
        ),
        if (this.text != null)
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: Text(
              this.text!,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          )
      ],
    );
  }
}
