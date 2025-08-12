import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../models/ingredient/ingredient.dart';
import '../models/meal/meal.dart';
import '../models/model.dart';
import '../models/randomized_run/randomized_run.dart';
import '../models/rating/rating.dart';
import '../models/settings/settings.dart';
import '../models/tag/tag.dart';
import '../models/unit/unit.dart';
import 'date.dart';

class PersistenceUtils {
  static late Isar _instance;

  static final List<IsarGeneratedSchema> _schemas = [
    MealSchema,
    RandomizedRunSchema,
    SettingsSchema,
    RatingSchema,
    TagSchema,
    IngredientSchema,
    UnitSchema,
  ];

  static final List<Rating> _ratingDefaults = [
    Rating()..name = 'Effort',
    Rating()..name = 'Time',
    Rating()..name = 'Tastiness',
  ];

  static final List<Tag> _tagDefaults = [
    Tag()..name = 'Noodles',
    Tag()..name = 'Rice',
    Tag()..name = 'Potato',
  ];

  static final List<Unit> _unitDefaults = [
    Unit()..name = 'x',
    Unit()..name = 'KG',
    Unit()..name = 'g',
    Unit()..name = 'L',
    Unit()..name = 'ml',
  ];

  static final List<Ingredient> _ingredientDefaults = [
    Ingredient()..name = 'Onions',
    Ingredient()..name = 'Potatos',
    Ingredient()..name = 'Noodles',
    Ingredient()..name = 'Sweet Pepper',
    Ingredient()..name = 'Champignons',
  ];

  static Future<void> init() async {
    String documentPath = kIsWeb
        ? Isar.sqliteInMemory
        : (await getApplicationDocumentsDirectory()).path;

    await Isar.initialize();

    /// [Isar] only supports web if we are using the SQLite Engine, so we need
    /// to check that and use the appropriate engine. Encryption is also
    /// (at least currently) only available via SQLite Engine so if we decide
    /// to make use of encryption, we can use the SQLite version for all use
    /// cases.
    ///
    /// Just to know though: the best performance of [Isar] is accomplished by
    /// using the NoSQL version (as generally intended). SQLite will still
    /// perform great overall :)
    PersistenceUtils._instance = Isar.open(
      schemas: PersistenceUtils._schemas,
      directory: documentPath,
      engine: kIsWeb ? IsarEngine.sqlite : IsarEngine.isar,
    );

    /// Make sure our singleton [Isar] collection is present, create one
    /// otherwise and add the default data
    if (PersistenceUtils._instance.settings.count() == 0) {
      PersistenceUtils._initDefaults();
    }
  }

  /// Will purge all collections and therefore data which has been persisted.
  /// Use with care!
  static void purge() {
    PersistenceUtils._instance.write((isar) => isar.clear());
    PersistenceUtils._initDefaults();
  }

  static Stream<void> watch<T extends BaseModel>() =>
      PersistenceUtils._instance.collection<String, T>().watchLazy();

  static void transaction<T extends BaseModel>(
    PersistenceOperation operation,
    List<T> models,
  ) {
    if (operation != PersistenceOperation.delete) {
      for (var model in models) {
        /// Check if updated is the default, not changed [DateUtils.zero] value
        /// and therefore a new model which has not been persisted or an
        /// existing one where we want [updated] to be the current date time
        model.updated =
            model.updated == DateUtils.zero ? model.created : DateTime.now();
      }
    }

    PersistenceUtils._instance.write((isar) {
      final collection = isar.collection<String, T>();

      return switch (operation) {
        PersistenceOperation.insertUpdate => collection.putAll(models),
        PersistenceOperation.delete =>
          collection.deleteAll(models.map((model) => model.uuid).toList()),
      };
    });
  }

  static QueryBuilder<T, T, QStart> where<T extends BaseModel>() =>
      PersistenceUtils._instance.collection<String, T>().where();

  static void _initDefaults() {
    /// Here we will add our [Settings] singleton collection and before that
    /// clear the collection itself to make sure we really only have one (just
    /// to be sure)
    PersistenceUtils._instance.write((isar) => isar.settings.clear());
    PersistenceUtils.transaction(
      PersistenceOperation.insertUpdate,
      [Settings()],
    );

    /// Since one of our singletons (in this case [Settings]) was
    /// not present, this was the first launch of the app and we
    /// will add the default elements for some collections
    PersistenceUtils.transaction(
      PersistenceOperation.insertUpdate,
      _ratingDefaults,
    );
    PersistenceUtils.transaction(
      PersistenceOperation.insertUpdate,
      _tagDefaults,
    );
    PersistenceUtils.transaction(
      PersistenceOperation.insertUpdate,
      _unitDefaults,
    );
    PersistenceUtils.transaction(
      PersistenceOperation.insertUpdate,
      _ingredientDefaults,
    );
  }
}

enum PersistenceOperation {
  insertUpdate,
  delete,
}
