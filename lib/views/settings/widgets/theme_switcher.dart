import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/stores/shared/settings.dart';

class ThemeSwitcher extends ConsumerWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool? darkMode = ref.watch(
      settingsSingletonProvider.select((value) => value.valueOrNull?.darkMode),
    );

    return ListTile(
      title: const Text('Dark Mode'),
      trailing: Switch.adaptive(
        value: darkMode ??
            MediaQuery.of(context).platformBrightness == Brightness.dark,
        onChanged: (mode) =>
            ref.read(settingsSingletonProvider.notifier).setDarkMode(mode),
      ),
    );
  }
}
