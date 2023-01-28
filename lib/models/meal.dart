import 'package:isar/isar.dart';

import 'models.dart';

part 'meal.g.dart';

@collection
class IMeal {
  @Index(unique: true, replace: true)
  late String uuid;

  Id get isarId => Models.fastHash(uuid);

  late DateTime createdAt;
  late String name;
  String? thumbnailBase64;
  List<String>? imagesBase64;
}
