import 'package:flutter/material.dart';

import '../../utils/design_system.dart';

class Fader extends StatefulWidget {
  final Widget child;
  final Duration? duration;
  final Duration delay;
  final Curve curve;
  final Duration? showDuration;

  const Fader({
    Key? key,
    required this.child,
    this.duration,
    this.delay = const Duration(milliseconds: 0),
    this.curve = Curves.linear,
    this.showDuration,
  }) : super(key: key);

  @override
  State<Fader> createState() => _FaderState();
}

class _FaderState extends State<Fader> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration:
          this.widget.duration ?? DesignSystem.animation.defaultDurationMS250,
    );
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: this.widget.curve));
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(this.widget.delay, () => _controller.forward());

    if (this.widget.showDuration != null) {
      Future.delayed(this.widget.showDuration!, () => _controller.reverse());
    }
    return FadeTransition(
      opacity: _animation,
      child: this.widget.child,
    );
  }
}
