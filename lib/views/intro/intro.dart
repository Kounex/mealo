import 'package:flutter/material.dart';
import '../../utils/modal.dart';
import '../../utils/router.dart';
import '../../widgets/base/functional/camera/camera.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('oof'),
              onPressed: () => RouterUtils.beamTo(
                context,
                MealsRoute(),
                replace: true,
              ),
            ),
            ElevatedButton(
              child: const Text('CAMERA LUL'),
              onPressed: () => ModalUtils.showExpandedModalBottomSheet(
                context,
                const BaseCamera(),
                fullscreen: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
