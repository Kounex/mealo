import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';
import '../persistance.dart';

part 'ingredient.g.dart';

@riverpod
class Ingredients extends _$Ingredients with Persistance<Ingredient> {
  @override
  FutureOr<List<Ingredient>> build() async => this.init();
}

@collection
class Ingredient extends CommonModel {}
