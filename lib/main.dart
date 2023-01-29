import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:mealo/app.dart';
import 'package:mealo/models/settings.dart';
import 'package:mealo/utils/isar.dart';
import 'package:uuid/uuid.dart';

import 'models/meal.dart';

void main() async {
  /// Open our [Isar] instance which will be available in sync. We need
  /// to add and maintain all schemas here
  IsarUtils.instance = await Isar.open([
    MealSchema,
    SettingsSchema,
  ]);

  /// Make sure our singleton [Isar collections have the ]
  if (await IsarUtils.instance.settings.count() == 0) {
    await IsarUtils.crud(
        (isar) => isar.settings.put(Settings()..uuid = const Uuid().v4()));
  }

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
