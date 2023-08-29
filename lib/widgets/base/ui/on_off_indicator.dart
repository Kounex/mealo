import 'package:flutter/material.dart';

import '../../../utils/design_system.dart';

class OnOffIndicator extends StatelessWidget {
  final bool? on;

  const OnOffIndicator({
    super.key,
    this.on,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: DesignSystem.animation.defaultDurationMS250,
      width: DesignSystem.size.x48,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: this.on != null && this.on!
            ? Theme.of(context).colorScheme.primaryContainer
            : Theme.of(context).disabledColor,
        borderRadius: BorderRadius.circular(DesignSystem.border.radius6),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: DesignSystem.spacing.x8,
        vertical: DesignSystem.spacing.x4,
      ),
      child: Text(this.on != null && this.on! ? 'ON' : 'OFF'),
    );
  }
}
