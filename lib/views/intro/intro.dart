import 'package:flutter/material.dart';
import 'package:mealo/utils/router.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('oof'),
          onPressed: () => RouterUtils.goTo(
            context,
            MealsRoute(),
            replace: true,
          ),
        ),
      ),
    );
  }
}
