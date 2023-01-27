import 'package:flutter/material.dart';
import 'package:mealo/views/settings/widgets/theme_switcher.dart';
import 'package:mealo/widgets/flutter_modified/translucent_sliver_app_bar.dart';

class SettingsView extends StatelessWidget {
  final ScrollController controller;

  const SettingsView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: this.controller,
        slivers: [
          TransculentSliverAppBar.large(
            title: const Text('Settings'),
          ),
          const SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                ThemeSwitcher(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
