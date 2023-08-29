import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils/design_system.dart';
import 'divider.dart';

class BaseCard extends StatefulWidget {
  final Widget child;
  final bool centerChild;

  final bool expandable;
  final bool expanded;

  final Widget? above;
  final Widget? below;

  final bool constrained;

  final Color? backgroundColor;
  final bool paintBorder;
  final Color? borderColor;

  final String? title;
  final Widget? titleWidget;

  final Widget? trailingTitleWidget;

  final double? topPadding;
  final double? rightPadding;
  final double? bottomPadding;
  final double? leftPadding;

  final EdgeInsetsGeometry? paddingChild;
  final EdgeInsetsGeometry? titlePadding;

  final CrossAxisAlignment titleCrossAlignment;

  final double elevation;

  final double? borderRadius;

  const BaseCard({
    Key? key,
    required this.child,
    this.expandable = false,
    this.expanded = true,
    this.above,
    this.below,
    this.centerChild = true,
    this.constrained = true,
    this.backgroundColor,
    this.paintBorder = false,
    this.borderColor,
    this.title,
    this.titleWidget,
    this.trailingTitleWidget,
    this.paddingChild,
    this.topPadding,
    this.rightPadding,
    this.bottomPadding,
    this.leftPadding,
    this.titlePadding,
    this.titleCrossAlignment = CrossAxisAlignment.center,
    this.elevation = 1.0,
    this.borderRadius,
  }) : super(key: key);

  @override
  State<BaseCard> createState() => _BaseCardState();
}

class _BaseCardState extends State<BaseCard> {
  int _expandedTurn = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    if ((this.widget.expanded && _expandedTurn % 2 != 0) ||
        (!this.widget.expanded && _expandedTurn % 2 == 0)) {
      setState(() => _expandedTurn++);
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget card = Card(
      clipBehavior: Clip.antiAlias,
      shadowColor: this.widget.backgroundColor != null &&
              this.widget.backgroundColor!.value == Colors.transparent.value
          ? Colors.transparent
          : null,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            this.widget.borderRadius ?? DesignSystem.border.radius12),
        side: this.widget.paintBorder
            ? BorderSide(color: this.widget.borderColor ?? Colors.transparent)
            : BorderSide.none,
      ),
      color: this.widget.backgroundColor ?? Theme.of(context).cardColor,
      elevation: this.widget.elevation,
      margin: EdgeInsets.only(
        top: this.widget.topPadding ?? DesignSystem.spacing.x18,
        right: this.widget.rightPadding ?? DesignSystem.spacing.x16,
        bottom: this.widget.bottomPadding ?? DesignSystem.spacing.x18,
        left: this.widget.leftPadding ?? DesignSystem.spacing.x16,
      ),
      child: Column(
        mainAxisAlignment: this.widget.centerChild
            ? MainAxisAlignment.center
            : MainAxisAlignment.start,
        crossAxisAlignment: this.widget.centerChild
            ? CrossAxisAlignment.center
            : CrossAxisAlignment.start,
        children: [
          if (this.widget.titleWidget != null || this.widget.title != null)
            Padding(
              padding: this.widget.titlePadding ??
                  EdgeInsets.only(
                    left: DesignSystem.spacing.x24,
                    right: DesignSystem.spacing.x24,
                    top: DesignSystem.spacing.x12,
                    bottom: DesignSystem.spacing.x12,
                  ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: this.widget.titleWidget == null
                          ? Text(
                              this.widget.title!,
                              style: Theme.of(context).textTheme.headlineSmall,
                            )
                          : this.widget.titleWidget!),
                  if (this.widget.expandable ||
                      this.widget.trailingTitleWidget != null)
                    Row(
                      children: [
                        if (this.widget.trailingTitleWidget
                            case var trailingTitleWidget?)
                          trailingTitleWidget,
                        if (this.widget.expandable)
                          AnimatedRotation(
                            duration:
                                DesignSystem.animation.defaultDurationMS250,
                            turns: _expandedTurn / 2,
                            curve: Curves.easeInCubic,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(32),
                              onTap: () => setState(() => _expandedTurn++),
                              // behavior: HitTestBehavior.opaque,
                              child: const SizedBox(
                                height: 32.0,
                                width: 32.0,
                                child: Icon(
                                  CupertinoIcons.chevron_up,
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                ],
              ),
            ),
          AnimatedAlign(
            duration: DesignSystem.animation.defaultDurationMS250,
            heightFactor: _expandedTurn % 2 == 0 ? 1.0 : 0.0,
            alignment: const Alignment(0, -1),
            curve: Curves.easeInCubic,
            child: AnimatedOpacity(
              duration: DesignSystem.animation.defaultDurationMS250,
              opacity: _expandedTurn % 2 == 0 ? 1.0 : 0.0,
              curve: Curves.easeInCubic,
              child: Column(
                children: [
                  if (this.widget.titleWidget != null ||
                      this.widget.title != null)
                    const BaseDivider(),
                  Padding(
                    padding: this.widget.paddingChild ??
                        EdgeInsets.all(DesignSystem.spacing.x18),
                    child: this.widget.child,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );

    if (!this.widget.constrained) return card;

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: Breakpoint.sm.width),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (this.widget.above != null) this.widget.above!,
            card,
            if (this.widget.below != null) this.widget.below!,
          ],
        ),
      ),
    );
  }
}
