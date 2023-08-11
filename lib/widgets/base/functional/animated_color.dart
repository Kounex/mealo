import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../utils/design_system.dart';

class AnimatedColor extends StatefulWidget {
  final Color color;

  final Widget? child;

  final Duration? duration;

  const AnimatedColor({
    super.key,
    required this.color,
    this.child,
    this.duration,
  });

  @override
  State<AnimatedColor> createState() => _AnimatedColorState();
}

class _AnimatedColorState extends State<AnimatedColor> {
  late Color _currentColor;
  late Color _prevColor;

  @override
  void initState() {
    super.initState();

    _currentColor = _prevColor = this.widget.color;
  }

  @override
  void didUpdateWidget(covariant AnimatedColor oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (this.widget.color != oldWidget.color) {
      _prevColor = _currentColor;
      _currentColor = this.widget.color;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Color>(
      duration:
          this.widget.duration ?? DesignSystem.animation.defaultDurationMS250,
      tween: SmoothColorTween(begin: _prevColor, end: _currentColor),
      builder: (context, color, child) {
        return SizedBox.expand(
          child: Container(
            alignment: Alignment.center,
            color: color,
            child: child,
          ),
        );
      },
      child: this.widget.child,
    );
  }
}

class SmoothColorTween extends Tween<Color> {
  SmoothColorTween({required Color begin, required Color end})
      : super(begin: begin, end: end);

  @override
  Color lerp(double t) => mixColors(this.begin!, this.end!, t);

  /// From https://github.com/flutter/flutter/issues/48534#issuecomment-573408852
  /// while [Color.lerp(...)] is not correctly handling opacity for animation
  Color mixColors(Color a, Color b, double t) {
    final w1 = (1 - t) * a.opacity;
    final w2 = t * b.opacity;
    final n = w1 + w2;
    final w = n > 0.000001 ? w2 / n : 0.5;

    return Color.fromARGB(
      lerpDouble(a.alpha, b.alpha, t)!.toInt().clamp(0, 255),
      lerpDouble(a.red, b.red, w)!.toInt().clamp(0, 255),
      lerpDouble(a.green, b.green, w)!.toInt().clamp(0, 255),
      lerpDouble(a.blue, b.blue, w)!.toInt().clamp(0, 255),
    );
  }
}
