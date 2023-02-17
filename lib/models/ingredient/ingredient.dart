import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../persistance.dart';
import '../models.dart';

part 'ingredient.g.dart';

@riverpod
class Ingredients extends _$Ingredients with Persistance<Ingredient> {
  @override
  FutureOr<List<Ingredient>> build() async => this.init();
}

@collection
class Ingredient implements BaseModel {
  @override
  @Index(unique: true, replace: true)
  String uuid = const Uuid().v4();

  Id get isarId => Models.fastHash(uuid);

  @override
  @Index(unique: true)
  late String name;
}
