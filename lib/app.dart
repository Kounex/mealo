import 'package:beamer/beamer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'stores/shared/settings/settings.dart';
import 'utils/router.dart';
import 'utils/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool? darkMode = ref.watch(
      settingsSingletonProvider.select((value) => value.valueOrNull?.darkMode),
    );

    ThemeData light = ThemeUtils.baseLight;
    ThemeData dark = ThemeUtils.baseDark;

    CupertinoThemeData cupertino =
        CupertinoThemeData(primaryColor: light.colorScheme.primary);

    light = light.copyWith(cupertinoOverrideTheme: cupertino);
    dark = dark.copyWith(cupertinoOverrideTheme: cupertino);

    return MaterialApp.router(
      routerDelegate: RouterUtils.router,
      routeInformationParser: BeamerParser(),
      themeMode: darkMode != null
          ? darkMode
              ? ThemeMode.dark
              : ThemeMode.light
          : ThemeMode.system,
      theme: ThemeUtils.baseLight,
      darkTheme: ThemeUtils.baseDark,
    );
  }
}
