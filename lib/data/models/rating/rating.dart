import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';
import '../../storage.dart';

part 'rating.freezed.dart';
part 'rating.g.dart';

@riverpod
@JsonPersist()
class Ratings extends _$Ratings {
  @override
  FutureOr<List<Rating>> build() async {
    await persist(
      ref.watch(storageProvider.future),
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    ).future;

    return state.value ?? [];
  }
}

@freezed
abstract class Rating with _$Rating implements CommonModel {
  Rating._();

  factory Rating({
    // BaseModel fields
    String? uuid,
    DateTime? created,
    DateTime? updated,

    // CommonModel fields
    required String name,

    // Rating-specific fields
    String? description,
  }) = _Rating;

  /// Creates a new Rating with auto-generated uuid and timestamp.
  factory Rating.create({required String name}) => Rating(
    uuid: ModelDefaults.generateUuid(),
    created: ModelDefaults.now(),
    name: name,
  );

  factory Rating.fromJson(Map<String, Object?> json) => _$RatingFromJson(json);
}
