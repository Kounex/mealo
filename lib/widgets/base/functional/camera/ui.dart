import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:mealo/widgets/base/ui/progress_indicator.dart';

class BaseCameraUI extends StatefulWidget {
  final List<CameraDescription> cameras;

  const BaseCameraUI({
    super.key,
    required this.cameras,
  });

  @override
  State<BaseCameraUI> createState() => _BaseCameraUIState();
}

class _BaseCameraUIState extends State<BaseCameraUI> {
  late CameraController controller;

  Map<String, Object>? _exceptionMap;

  @override
  void initState() {
    super.initState();
    controller = CameraController(this.widget.cameras[0], ResolutionPreset.max);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      setState(() {
        if (e is CameraException) {
          switch (e.code) {
            case 'CameraAccessDenied':
              _exceptionMap = {
                'Camera access has been denied! Please grant camera access to the app to use this feature. To do so, go to your system settings, to your list of apps, select "Mealo" and enable camera access.':
                    e,
              };
              break;
            default:
              _exceptionMap = {
                'An unknown camera related error has occured. Make sure you granted permission to access the camera and that your camera is working properly in general!':
                    e,
              };
              break;
          }
          _exceptionMap = {
            'An unknown error has occured! Please restart the app and try again.':
                e,
          };
        }
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return Center(
        child: BaseProgressIndicator(
          text: 'Camera is initializing...',
        ),
      );
    }
    return CameraPreview(controller);
  }
}
