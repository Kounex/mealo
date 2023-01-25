import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/stores/shared/theme.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool? darkMode = ref.watch(darkModeProvider);

    return ListTile(
      title: const Text('Dark Mode'),
      trailing: Switch.adaptive(
        value: darkMode ??
            MediaQuery.of(context).platformBrightness == Brightness.dark,
        onChanged: (mode) =>
            ref.read(darkModeProvider.notifier).setDarkMode(mode),
      ),
    );
  }
}
