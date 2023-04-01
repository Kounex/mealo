import 'package:flutter/material.dart';

class BaseDivider extends StatelessWidget {
  final double? height;
  final double opacity;

  const BaseDivider({
    Key? key,
    this.height,
    this.opacity = 0.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Theme.of(context).dividerColor.withOpacity(this.opacity),
      height: this.height ?? 1.0,
      thickness: 0.0,
    );
  }
}
