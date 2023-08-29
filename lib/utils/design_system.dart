import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class _Spacing {
  const _Spacing();

  double get x4 => 4;
  double get x6 => 6;
  double get x8 => 8;
  double get x12 => 12;
  double get x16 => 16;
  double get x18 => 18;
  double get x24 => 24;
  double get x32 => 32;
  double get x42 => 42;
  double get x48 => 48;
  double get x64 => 64;
}

class _Size {
  const _Size();

  double get x16 => 16;
  double get x18 => 18;
  double get x42 => 42;
  double get x48 => 48;
  double get x52 => 52;
  double get x64 => 64;
}

class _Border {
  const _Border();

  double get radius6 => 6;
  double get radius12 => 12;

  double get width05 => 0.5;
  double get width3 => 3;
  double get width8 => 8;
}

class _Animation {
  const _Animation();

  Duration get defaultDurationMS250 => const Duration(milliseconds: 250);
}

enum Breakpoint {
  /// 567
  xsm,

  /// 768
  sm,

  /// 992
  md,

  /// 1200
  lg,

  /// 1400
  xl,

  /// double.infinity
  xxl;

  double get width {
    return switch (this) {
      Breakpoint.xsm => 567,
      Breakpoint.sm => 768,
      Breakpoint.md => 992,
      Breakpoint.lg => 1200,
      Breakpoint.xl => 1400,
      Breakpoint.xxl => double.infinity,
    };
  }

  bool operator >(Breakpoint other) => index > other.index;
  bool operator >=(Breakpoint other) => index >= other.index;

  bool operator <(Breakpoint other) => index < other.index;
  bool operator <=(Breakpoint other) => index <= other.index;
}

final class DesignSystem {
  static const spacing = _Spacing();
  static const size = _Size();
  static const border = _Border();
  static const animation = _Animation();

  static const double opacityForBlur = 0.75;

  /// Taken from [CupertinoNavigationBar]
  static const double sigmaBlur = 10.0;

  /// Bouncing scroll for all cases
  static ScrollPhysics get platformAwareScrollPhysics => kIsWeb ||
          Platform.isIOS
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

  static Breakpoint breakpoint({double? width, BuildContext? context}) {
    assert(width != null || context != null);
    final double size = width ?? MediaQuery.of(context!).size.width;
    return switch (true) {
      _ when size < Breakpoint.xsm.width => Breakpoint.xsm,
      _ when size < Breakpoint.sm.width => Breakpoint.sm,
      _ when size < Breakpoint.md.width => Breakpoint.md,
      _ when size < Breakpoint.lg.width => Breakpoint.lg,
      _ when size < Breakpoint.xl.width => Breakpoint.xl,
      _ => Breakpoint.xxl
    };
  }
}
