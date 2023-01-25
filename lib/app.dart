import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/stores/shared/theme.dart';
import 'package:mealo/utils/router.dart';
import 'package:mealo/utils/theme.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool? darkMode = ref.watch(darkModeProvider);

    return MaterialApp.router(
      routerConfig: RouterUtils.router,
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
