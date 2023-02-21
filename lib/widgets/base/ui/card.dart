import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/utils/styling.dart';

import 'divider.dart';

const double kBaseCardMaxWidth = 772.0;
const double kBaseCardBorderRadius = 12.0;

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

  final double topPadding;
  final double rightPadding;
  final double bottomPadding;
  final double leftPadding;

  final EdgeInsetsGeometry paddingChild;
  final EdgeInsetsGeometry titlePadding;

  final CrossAxisAlignment titleCrossAlignment;

  final double elevation;

  final double borderRadius;

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
    this.paddingChild = const EdgeInsets.all(18.0),
    this.topPadding = 18.0,
    this.rightPadding = 16.0,
    this.bottomPadding = 18.0,
    this.leftPadding = 16.0,
    this.titlePadding =
        const EdgeInsets.only(left: 24.0, right: 24.0, top: 12.0, bottom: 12.0),
    this.titleCrossAlignment = CrossAxisAlignment.center,
    this.elevation = 1.0,
    this.borderRadius = kBaseCardBorderRadius,
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
    Widget card = Padding(
      padding: EdgeInsets.only(
        top: this.widget.topPadding,
        right: this.widget.rightPadding,
        bottom: this.widget.bottomPadding,
        left: this.widget.leftPadding,
      ),
      child: Card(
        clipBehavior: Clip.hardEdge,
        shadowColor: this.widget.backgroundColor != null &&
                this.widget.backgroundColor!.value == Colors.transparent.value
            ? Colors.transparent
            : null,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.widget.borderRadius),
          side: this.widget.paintBorder
              ? BorderSide(color: this.widget.borderColor ?? Colors.transparent)
              : BorderSide.none,
        ),
        color: this.widget.backgroundColor ?? Theme.of(context).cardColor,
        elevation: this.widget.elevation,
        margin: const EdgeInsets.all(0),
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
                padding: this.widget.titlePadding,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: this.widget.titleWidget == null
                            ? Text(
                                this.widget.title!,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              )
                            : this.widget.titleWidget!),
                    if (this.widget.expandable ||
                        this.widget.trailingTitleWidget != null)
                      this.widget.expandable
                          ? AnimatedRotation(
                              duration: StylingUtils.kBaseAnimationDuration,
                              turns: _expandedTurn / 2,
                              curve: Curves.easeInCubic,
                              child: GestureDetector(
                                onTap: () => setState(() => _expandedTurn++),
                                behavior: HitTestBehavior.opaque,
                                child: const SizedBox(
                                  height: 32.0,
                                  width: 32.0,
                                  child: Icon(
                                    CupertinoIcons.chevron_up,
                                  ),
                                ),
                              ),
                            )
                          : this.widget.trailingTitleWidget!
                  ],
                ),
              ),
            AnimatedAlign(
              duration: StylingUtils.kBaseAnimationDuration,
              heightFactor: _expandedTurn % 2 == 0 ? 1.0 : 0.0,
              alignment: const Alignment(0, -1),
              curve: Curves.easeInCubic,
              child: Column(
                children: [
                  if (this.widget.titleWidget != null ||
                      this.widget.title != null)
                    const BaseDivider(),
                  Padding(
                    padding: this.widget.paddingChild,
                    child: this.widget.child,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    if (!this.widget.constrained) return card;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: kBaseCardMaxWidth),
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
