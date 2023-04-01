import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

class Models {
  /// FNV-1a 64bit hash algorithm optimized for Dart Strings
  static int fastHash(String string) {
    var hash = 0xcbf29ce484222325;

    var i = 0;
    while (i < string.length) {
      final codeUnit = string.codeUnitAt(i++);
      hash ^= codeUnit >> 8;
      hash *= 0x100000001b3;
      hash ^= codeUnit & 0xFF;
      hash *= 0x100000001b3;
    }

    return hash;
  }
}

/// Used as an interface for basic models which will have the following basic
/// properties
abstract class BaseModel {
  @Index(unique: true, replace: true)
  String uuid = const Uuid().v4();

  Id get isarId => Models.fastHash(uuid);
}

abstract class Model extends BaseModel {
  late String name;
}
