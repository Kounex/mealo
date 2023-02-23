import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../models.dart';
import '../persistance.dart';

part 'tag.g.dart';

@riverpod
class Tags extends _$Tags with Persistance<Tag> {
  @override
  FutureOr<List<Tag>> build() async => this.init();
}

@collection
class Tag implements BaseModel {
  @override
  @Index(unique: true, replace: true)
  String uuid = const Uuid().v4();

  Id get isarId => Models.fastHash(uuid);

  @override
  @Index(unique: true)
  late String name;

  String? colorHex;
}
