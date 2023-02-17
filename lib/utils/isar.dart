import 'package:isar/isar.dart';
import 'package:mealo/models/rating/rating.dart';
import 'package:mealo/models/tag/tag.dart';
import 'package:uuid/uuid.dart';

import '../models/settings/settings.dart';

class IsarUtils {
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

  static Future<void> init() async {
    await IsarUtils.crud(
        (isar) => isar.settings.put(Settings()..uuid = const Uuid().v4()));

    /// Since one of our singletons (in this case [Settings]) was
    /// not present, this was the first launch of the app and we
    /// will add the default [Rating]s and [Tag]s

    await IsarUtils.crud(
      (isar) => isar.ratings.putAll(_ratingDefaults),
    );
    await IsarUtils.crud(
      (isar) => isar.tags.putAll(_tagDefaults),
    );
  }

  static Future<T>? crud<T>(Future<T> Function(Isar isar) callback) async {
    return IsarUtils.instance.writeTxn(
      () async => callback(IsarUtils.instance),
    );
  }
}
