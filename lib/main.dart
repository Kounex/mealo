import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:mealo/models/rating/rating.dart';
import 'package:mealo/models/tag/tag.dart';

import 'app.dart';
import 'models/meal/meal.dart';
import 'models/settings/settings.dart';
import 'utils/isar.dart';

void main() async {
  /// Open our [Isar] instance which will be available in sync. We need
  /// to add and maintain all schemas here
  IsarUtils.instance = await Isar.open([
    MealSchema,
    SettingsSchema,
    RatingSchema,
    TagSchema,
  ]);

  /// Make sure our singleton [Isar] collections are present, create one
  /// otherwise and add the default data
  if (await IsarUtils.instance.settings.count() == 0) {
    await IsarUtils.init();
  }

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
