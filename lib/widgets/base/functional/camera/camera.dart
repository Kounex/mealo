import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mealo/widgets/base/functional/future_builder.dart';

import 'ui.dart';

class BaseCamera extends StatelessWidget {
  const BaseCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseFutureBuilder(
      future: availableCameras(),
      loading: 'Accessing cameras...',
      data: (cameras) => BaseCameraUI(
        cameras: cameras,
      ),
    );
  }
}
