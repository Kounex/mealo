import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mealo/data/links/rating_link/rating_link.dart';
import 'package:mealo/data/storage.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';

part 'randomized_run.freezed.dart';
part 'randomized_run.g.dart';

@riverpod
@JsonPersist()
class RandomizedRuns extends _$RandomizedRuns {
  @override
  FutureOr<List<RandomizedRun>> build() async {
    await persist(
      ref.watch(storageProvider.future),
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    ).future;

    return state.value ?? [];
  }
}

@freezed
abstract class RandomizedRun with _$RandomizedRun implements BaseModel {
  RandomizedRun._();

  factory RandomizedRun({
    // BaseModel fields
    String? uuid,
    DateTime? created,
    DateTime? updated,

    // RandomizedRun-specific fields
    /// [Tag]s which meals should have applied
    @Default([]) List<String> includedTagsUuids,

    /// [Tag]s we don't want randomized meals to have
    @Default([]) List<String> excludedTagsUuids,

    @Default([]) List<String> includedIngredientUuids,

    @Default([]) List<String> excludedIngredientUuids,

    @Default([]) List<RatingLink> ratingLinks,

    /// The amount of days how long ago we wanted to find a meal we ate the last
    /// time
    int? daysNotEaten,

    String? mealUuid,

    /// Generally we assume a randomized run does not automatically mean the
    /// user will select this meal as their next meal to eat. Once the user
    /// indicated that this meal will be eaten, we will set this to true and
    /// we can query this later
    @Default(false) bool eaten,
  }) = _RandomizedRun;

  /// Creates a new Meal with auto-generated uuid and timestamp.
  factory RandomizedRun.create() => RandomizedRun(
    uuid: ModelDefaults.generateUuid(),
    created: ModelDefaults.now(),
  );

  factory RandomizedRun.fromJson(Map<String, Object?> json) =>
      _$RandomizedRunFromJson(json);
}
