import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'app.dart';
import 'models/ingredient/ingredient.dart';
import 'models/meal/meal.dart';
import 'models/rating/rating.dart';
import 'models/settings/settings.dart';
import 'models/tag/tag.dart';
import 'models/unit/unit.dart';
import 'utils/persistance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Open our [Isar] instance which will be available in sync. We need
  /// to add and maintain all schemas here
  PersistanceUtils.instance = Isar.open(
    directory: (await getApplicationDocumentsDirectory()).path,
    schemas: [
      MealSchema,
      SettingsSchema,
      RatingSchema,
      TagSchema,
      IngredientSchema,
      UnitSchema,
    ],
  );

  /// Make sure our singleton [Isar] collections are present, create one
  /// otherwise and add the default data
  if (PersistanceUtils.instance.settings.count() == 0) {
    await PersistanceUtils.init();
  }

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
