import 'dart:ui';

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/widgets/base/functional/future_builder.dart';
import 'package:mealo/widgets/base/ui/result.dart';

import 'ui.dart';

class BaseCamera extends StatefulWidget {
  const BaseCamera({super.key});

  @override
  State<BaseCamera> createState() => _BaseCameraState();
}

class _BaseCameraState extends State<BaseCamera> {
  late Future<List<CameraDescription>> _cameras;

  @override
  void initState() {
    super.initState();

    _cameras = availableCameras();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        BaseFutureBuilder(
          future: _cameras,
          loading: 'Accessing cameras...',
          data: (cameras) => cameras != null && cameras.isNotEmpty
              ? BaseCameraUI(
                  cameras: cameras,
                )
              : const BaseResult(
                  icon: BaseResultIcon.Negative,
                  text: 'No camera available!',
                ),
        ),
        Positioned(
          right: 12.0 + window.viewPadding.right / window.devicePixelRatio,
          top: 12.0 + window.viewPadding.top / window.devicePixelRatio,
          child: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(CupertinoIcons.clear),
          ),
        ),
      ],
    );
  }
}
