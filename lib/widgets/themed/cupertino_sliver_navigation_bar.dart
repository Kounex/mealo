import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ThemedCupertinoSliverNavigationBar extends StatelessWidget {
  final Widget? largeTitle;
  final Widget? middle;
  final Widget? leading;
  final Widget? trailing;

  final bool stretch;

  const ThemedCupertinoSliverNavigationBar({
    super.key,
    this.largeTitle,
    this.middle,
    this.leading,
    this.trailing,
    this.stretch = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoSliverNavigationBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
      largeTitle: this.largeTitle,
      middle: this.middle,
      stretch: this.stretch,
      leading: this.leading,
      trailing: this.trailing,
    );
  }
}
