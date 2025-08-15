import 'dart:math';

import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';
import 'package:mealo/models/meal/meal.dart';
import 'package:mealo/widgets/shared/image.dart';

class ImagePreview extends StatefulWidget {
  final String imageUuid;

  const ImagePreview({
    super.key,
    required this.imageUuid,
  });

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview>
    with TickerProviderStateMixin {
  late final AnimationController _controllerImage;

  Offset _imageOffset = Offset.zero;
  Offset _imageRawDrag = Offset.zero;

  Animation<Offset>? _backAnim;

  bool _overdragged = false;

  @override
  void initState() {
    super.initState();

    _controllerImage = AnimationController(
      vsync: this,
      duration: DesignSystem.animation.defaultDurationMS300,
    );
  }

  double _tanh(double x) {
    final e2x = exp(2 * x);
    return (e2x - 1) / (e2x + 1);
  }

  Offset _rubberBand(Offset d, double R) {
    final r = d.distance;
    if (r == 0) return Offset.zero;
    final m = R * _tanh(r / R);
    return d / r * m;
  }

  void _dragUpdate(DragUpdateDetails details) {
    _imageRawDrag += details.delta;
    final display = _rubberBand(_imageRawDrag, 80);

    final rawLen = _imageRawDrag.distance;
    final dispLen = display.distance;
    final compression = rawLen == 0 ? 1.0 : dispLen / rawLen;

    if (!_overdragged && compression < 0.35) {
      _overdragged = true;
      _pop();
    }

    setState(() => _imageOffset = Offset(0, 0 + display.dy));
  }

  void _animBack() {
    if (!_overdragged) {
      _backAnim = Tween<Offset>(begin: _imageOffset, end: Offset.zero)
          .chain(CurveTween(curve: Curves.easeOut))
          .animate(_controllerImage);

      _controllerImage.forward(from: 0);
      _imageOffset = Offset.zero;
      _imageRawDrag = Offset.zero;
    }
  }

  void _pop() {
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _controllerImage.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onPanUpdate: _dragUpdate,
      onPanEnd: (_) => _animBack(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(onTap: _pop, child: SizedBox.expand()),
          AnimatedBuilder(
            animation: _controllerImage,
            builder: (context, child) => Transform.translate(
              offset: _controllerImage.isAnimating
                  ? _backAnim!.value
                  : _imageOffset,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: DesignSystem.spacing.x64,
                    horizontal: DesignSystem.spacing.x12,
                  ),
                  child: MealoBaseImage(
                    imageUuid: this.widget.imageUuid,
                    subPath: Meal.subPathForImages,
                    borderColor: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
