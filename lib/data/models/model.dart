import 'package:uuid/uuid.dart';

import '../../utils/date.dart';

/// Abstract interface defining the base fields all models must have.
/// Freezed classes implement this by including these fields in their
/// factory constructor with appropriate defaults.
abstract class BaseModel {
  String? get uuid;
  DateTime? get created;

  /// Distinguishes new models (null) from existing ones.
  /// Set during persistence transactions.
  DateTime? get updated;
}

/// Extension of [BaseModel] for models that have a name.
abstract class CommonModel extends BaseModel {
  String get name;
}

/// Provides default value generators for use in model `.create()` factories.
class ModelDefaults {
  static String generateUuid() => const Uuid().v4();
  static DateTime now() => DateTime.now();
  static DateTime zero() => DateUtils.zero;
}
