import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Will hold some general styling stuff like "custom" icons or some
/// app wide layout constraints (if applicable)
class StylingUtils {
  /// Taken from [CupertinoNavigationBar]
  static const double kSigmaBlur = 10.0;
  static const double kOpacityForBlur = 0.85;

  static const Duration kBaseAnimationDuration = Duration(milliseconds: 200);

  /// Bouncing scroll for all cases
  static ScrollPhysics get platformAwareScrollPhysics => Platform.isIOS
      ? const AlwaysScrollableScrollPhysics()
      : const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  static Color surroundingAwareAccent(
      {BuildContext? context, Color? surroundingColor}) {
    assert(context != null || surroundingColor != null);
    return (surroundingColor ?? Theme.of(context!).cardColor)
                .computeLuminance() <
            0.3
        ? Colors.white
        : Colors.black;
  }

  static Color lightDisabledColor(BuildContext context) =>
      Theme.of(context).disabledColor.withOpacity(0.1);
}
