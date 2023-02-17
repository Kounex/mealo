import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/stores/views/home.dart';
import 'package:mealo/utils/isar.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/utils/router.dart';
import 'package:mealo/views/settings/widgets/theme_switcher.dart';
import 'package:mealo/widgets/base/card.dart';
import 'package:mealo/widgets/base/scaffold.dart';
import 'package:mealo/widgets/dialog/confirmation.dart';

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
                  ConfirmationDialog(
                    title: 'Danger zone!',
                    text:
                        'You are about to delete all data and set the app back to its default state. This action can\'t be undone! Are you sure about that?',
                    isYesDestructive: true,
                    onYes: () async {
                      await IsarUtils.crud((isar) => isar.clear());
                      await IsarUtils.init();
                      ref.invalidate(randomizedMealProvider);
                    },
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
