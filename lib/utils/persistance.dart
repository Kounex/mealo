import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import '../models/ingredient/ingredient.dart';
import '../models/rating/rating.dart';
import '../models/settings/settings.dart';
import '../models/tag/tag.dart';
import '../models/unit/unit.dart';

class PersistanceUtils {
  static late Isar instance;

  static final List<Rating> _ratingDefaults = [
    Rating()..name = 'Effort',
    Rating()..name = 'Time',
    Rating()..name = 'Tastyness',
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
    if (PersistanceUtils.instance.settings.count() == 0) {
      PersistanceUtils.crud(
          (isar) => isar.settings.put(Settings()..uuid = const Uuid().v4()));

      /// Since one of our singletons (in this case [Settings]) was
      /// not present, this was the first launch of the app and we
      /// will add the default [Rating]s and [Tag]s

      PersistanceUtils.crud(
        (isar) => isar.ratings.putAll(_ratingDefaults),
      );
      PersistanceUtils.crud(
        (isar) => isar.tags.putAll(_tagDefaults),
      );
      PersistanceUtils.crud(
        (isar) => isar.units.putAll(_unitDefaults),
      );
      PersistanceUtils.crud(
        (isar) => isar.ingredients.putAll(_ingredientDefaults),
      );
    }
  }

  static T crud<T>(T Function(Isar isar) callback) =>
      PersistanceUtils.instance.write<T>(callback);
}
