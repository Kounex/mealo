import 'dart:convert';

import 'package:base_components/base_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/data/models/ingredient/ingredient.dart';
import 'package:mealo/data/models/meal/meal.dart';
import 'package:mealo/data/models/randomized_run/randomized_run.dart';
import 'package:mealo/data/models/rating/rating.dart';
import 'package:mealo/data/models/settings/settings.dart';
import 'package:mealo/data/models/tag/tag.dart';
import 'package:mealo/data/models/unit/unit.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/persistence.dart';
import '../../utils/router.dart';
import '../../widgets/shared/dialog/confirmation.dart';
import 'widgets/theme_switcher.dart';

class SettingsView extends ConsumerWidget {
  final ScrollController controller;

  const SettingsView({super.key, required this.controller});

  Future<void> _exportModels(BuildContext context, WidgetRef ref) async {
    OverlayUtils.showStatusOverlay(
      context: context,
      content: BaseProgressIndicator(text: 'Preparing export...'),
    );

    final meals = await ref.read(mealsProvider.future);
    final tags = await ref.read(tagsProvider.future);
    final ingredients = await ref.read(ingredientsProvider.future);
    final units = await ref.read(unitsProvider.future);
    final ratings = await ref.read(ratingsProvider.future);
    final settings = await ref.read(settingsSingletonProvider.future);
    final randomizedRuns = await ref.read(randomizedRunsProvider.future);

    final mealsJson = meals.map((meal) => meal.toJson()).toList();
    final tagsJson = tags.map((tag) => tag.toJson()).toList();
    final ingredientsJson = ingredients
        .map((ingredient) => ingredient.toJson())
        .toList();
    final unitsJson = units.map((unit) => unit.toJson()).toList();
    final ratingsJson = ratings.map((rating) => rating.toJson()).toList();

    final mealoJson = jsonEncode({
      'meals': mealsJson,
      'tags': tagsJson,
      'ingredients': ingredientsJson,
      'units': unitsJson,
      'ratings': ratingsJson,
      'settings': settings,
      'randomizedRuns': randomizedRuns,
    });

    await Future.delayed(const Duration(seconds: 1));

    OverlayUtils.closeAnyOverlay();

    SharePlus.instance.share(
      ShareParams(
        title: 'Mealo export',
        previewThumbnail: XFile(
          'assets/images/splash.png',
          mimeType: 'image/png',
        ),
        files: [
          XFile.fromData(
            const Utf8Encoder().convert(mealoJson),
            name: 'mealo-export-${DateTime.now().toString()}.json',
            mimeType: 'application/json',
          ),
        ],
      ),
    );
  }

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
                title: const Text('Export data'),
                onTap: () => _exportModels(context, ref),
              ),
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
