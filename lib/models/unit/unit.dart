import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../persistance.dart';
import '../models.dart';

part 'unit.g.dart';

@riverpod
class Units extends _$Units with Persistance<Unit> {
  @override
  FutureOr<List<Unit>> build() async => this.init();
}

@collection
class Unit implements BaseModel {
  @override
  @Index(unique: true, replace: true)
  String uuid = const Uuid().v4();

  Id get isarId => Models.fastHash(uuid);

  @override
  @Index(unique: true)
  late String name;
}
