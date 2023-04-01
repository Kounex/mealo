import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../persistance.dart';
import '../models.dart';

part 'ingredient.g.dart';

@riverpod
class Ingredients extends _$Ingredients with Persistance<Ingredient> {
  @override
  FutureOr<List<Ingredient>> build() async => this.init();
}

@collection
class Ingredient extends Model {}
