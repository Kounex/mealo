import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../utils/router.dart';
import '../../widgets/base/ui/placeholder_text.dart';

class IntroView extends StatelessWidget {
  const IntroView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const BasePlaceholder(
              text: '',
              icon: FluentIcons.person_accounts_24_filled,
            ),
            ElevatedButton(
              child: const Text('Access'),
              onPressed: () => RouterUtils.beamTo(
                context,
                MealsRoute(),
                replace: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
