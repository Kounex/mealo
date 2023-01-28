import 'package:flutter/material.dart';
import 'package:mealo/views/settings/widgets/theme_switcher.dart';
import 'package:mealo/widgets/base/scaffold.dart';

class SettingsView extends StatelessWidget {
  final ScrollController controller;

  const SettingsView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarProperties: AppBarProperties(
        title: const Text('Settings'),
        large: true,
      ),
      children: const [
        ThemeSwitcher(),
      ],
    );
  }
}
