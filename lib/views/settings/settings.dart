import 'package:base_components/base_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../utils/persistence.dart';
import '../../utils/router.dart';
import '../../widgets/shared/dialog/confirmation.dart';
import 'widgets/theme_switcher.dart';

class SettingsView extends ConsumerWidget {
  final ScrollController controller;

  const SettingsView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseScaffold(
      controller: this.controller,
      hasBottomTabBarSpacing: true,
      appBarProperties: AppBarProperties(
        title: const Text('Settings'),
        large: true,
      ),
      children: [
        BaseCard(
          child: Column(
            children: [
              ListTile(
                title: const Text('Ratings & Tags'),
                trailing: const CupertinoListTileChevron(),
                onTap: () =>
                    RouterUtils.goTo(context, RatingsTagsManagementRoute()),
              ),
              const ThemeSwitcher(),
              ListTile(
                title: const Text('Delete all data'),
                onTap: () => ModalUtils.showBaseDialog(
                  context,
                  MealoBaseConfirmationDialog(
                    title: 'Danger zone!',
                    body:
                        'You are about to delete all data and set the app back to its default state. This action can\'t be undone! Are you sure about that?',
                    isYesDestructive: true,
                    onYes: (_) => PersistenceUtils.purge(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
