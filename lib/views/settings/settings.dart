import 'package:flutter/material.dart';
import 'package:mealo/views/settings/widgets/theme_switcher.dart';
import 'package:mealo/widgets/flutter_modified/translucent_sliver_app_bar.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
