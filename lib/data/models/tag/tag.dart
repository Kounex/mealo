import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mealo/data/storage.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';

part 'tag.freezed.dart';
part 'tag.g.dart';

@riverpod
@JsonPersist()
class Tags extends _$Tags {
  @override
  FutureOr<List<Tag>> build() async {
    await persist(
      ref.watch(storageProvider.future),
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    ).future;

    return state.value ?? [];
  }
}

@freezed
abstract class Tag with _$Tag implements CommonModel {
  Tag._();

  factory Tag({
    // BaseModel fields
    String? uuid,
    DateTime? created,
    DateTime? updated,

    // CommonModel fields
    required String name,

    // Tag-specific fields
    String? colorHex,
  }) = _Tag;

  /// Creates a new Tag with auto-generated uuid and timestamp.
  /// Use this for fresh instances instead of the default factory.
  factory Tag.create({required String name}) => Tag(
    uuid: ModelDefaults.generateUuid(),
    created: ModelDefaults.now(),
    name: name,
  );

  factory Tag.fromJson(Map<String, Object?> json) => _$TagFromJson(json);
}
