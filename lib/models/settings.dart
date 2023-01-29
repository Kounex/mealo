import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import 'models.dart';

part 'settings.g.dart';

@collection
class Settings {
  @Index(unique: true, replace: true)
  String uuid = const Uuid().v4();

  Id get isarId => Models.fastHash(uuid);

  bool? darkMode;
}
