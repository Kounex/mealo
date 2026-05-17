import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../links/ingredient_link/ingredient_link.dart';
import '../../links/rating_link/rating_link.dart';
import '../model.dart';
import '../../storage.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@riverpod
@JsonPersist()
class Meals extends _$Meals {
  @override
  FutureOr<List<Meal>> build() async {
    await persist(
      ref.watch(storageProvider.future),
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    ).future;

    return state.value ?? [];
  }

  void fetch() async {
    /// Here we will add the API call to fetch the latest [MealDTO] from
    /// the backend and sync it with our persistance layer. This might trigger
    /// additional CRUD operations to sync potentially offline created
    /// entities with the backend
    throw UnimplementedError();
  }
}

@freezed
abstract class Meal with _$Meal implements CommonModel {
  Meal._();

  factory Meal({
    // BaseModel fields
    String? uuid,
    DateTime? created,
    DateTime? updated,

    // CommonModel fields
    required String name,

    // Meal-specific fields
    String? instructions,
    String? thumbnailUuid,
    @Default([]) List<String> imagesUuids,

    // Relationships — stored as nested JSON
    @Default([]) List<RatingLink> ratings,
    @Default([]) List<String> tagUuids,
    @Default([]) List<IngredientLink> ingredients,
  }) = _Meal;

  /// Creates a new Meal with auto-generated uuid and timestamp.
  factory Meal.create({required String name}) => Meal(
    uuid: ModelDefaults.generateUuid(),
    created: ModelDefaults.now(),
    name: name,
  );

  factory Meal.fromJson(Map<String, Object?> json) => _$MealFromJson(json);

  /// Image storage subdirectory
  static String subPathForImages = 'meal-images';
}
