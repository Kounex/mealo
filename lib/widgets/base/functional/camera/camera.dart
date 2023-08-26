import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/design_system.dart';
import '../../ui/result.dart';
import '../future_builder.dart';
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
    return Material(
      color: Colors.black,
      child: Stack(
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
                    icon: BaseResultIcon.negative,
                    text: 'No camera available!',
                  ),
          ),
          Positioned(
            right: DesignSystem.spacing.x12 +
                View.of(context).viewPadding.right /
                    View.of(context).devicePixelRatio,
            top: DesignSystem.spacing.x12 +
                View.of(context).viewPadding.top /
                    View.of(context).devicePixelRatio,
            child: IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(CupertinoIcons.clear),
            ),
          ),
        ],
      ),
    );
  }
}
