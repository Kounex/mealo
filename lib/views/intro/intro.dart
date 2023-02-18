import 'package:flutter/material.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/utils/router.dart';
import 'package:mealo/widgets/base/functional/camera/camera.dart';

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
              onPressed: () => RouterUtils.goTo(
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
