import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';
import '../../storage.dart';

part 'ingredient.freezed.dart';
part 'ingredient.g.dart';

@riverpod
@JsonPersist()
class Ingredients extends _$Ingredients {
  @override
  FutureOr<List<Ingredient>> build() async {
    await persist(
      ref.watch(storageProvider.future),
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    ).future;

    return state.value ?? [];
  }
}

@freezed
abstract class Ingredient with _$Ingredient implements CommonModel {
  Ingredient._();

  factory Ingredient({
    // BaseModel fields
    String? uuid,
    DateTime? created,
    DateTime? updated,

    // CommonModel fields
    required String name,
  }) = _Ingredient;

  /// Creates a new Ingredient with auto-generated uuid and timestamp.
  factory Ingredient.create({required String name}) => Ingredient(
    uuid: ModelDefaults.generateUuid(),
    created: ModelDefaults.now(),
    name: name,
  );

  factory Ingredient.fromJson(Map<String, Object?> json) =>
      _$IngredientFromJson(json);
}
