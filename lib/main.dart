import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:mealo/models/rating/rating.dart';
import 'package:mealo/models/tag/tag.dart';
import 'package:uuid/uuid.dart';

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
  /// otherwise
  if (await IsarUtils.instance.settings.count() == 0) {
    await IsarUtils.crud(
        (isar) => isar.settings.put(Settings()..uuid = const Uuid().v4()));

    /// Since one of our singletons (in this case [Settings]) was
    /// not present, this was the first launch of the app and we
    /// will add the default [Rating]s and [Tag]s

    await IsarUtils.crud((isar) => isar.ratings.putAll([
          Rating()..name = 'Effort',
          Rating()..name = 'Time',
          Rating()..name = 'Tastyness',
        ]));
    await IsarUtils.crud((isar) => isar.tags.putAll([
          Tag()..name = 'Noodles',
          Tag()..name = 'Rice',
          Tag()..name = 'Potato',
        ]));
  }

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
