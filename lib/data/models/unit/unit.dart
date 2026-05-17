import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';
import '../../storage.dart';

part 'unit.freezed.dart';
part 'unit.g.dart';

@riverpod
@JsonPersist()
class Units extends _$Units {
  @override
  FutureOr<List<Unit>> build() async {
    await persist(
      ref.watch(storageProvider.future),
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    ).future;

    return state.value ?? [];
  }
}

@freezed
abstract class Unit with _$Unit implements CommonModel {
  Unit._();

  factory Unit({
    // BaseModel fields
    String? uuid,
    DateTime? created,
    DateTime? updated,

    // CommonModel fields
    required String name,
  }) = _Unit;

  /// Creates a new Unit with auto-generated uuid and timestamp.
  factory Unit.create({required String name}) => Unit(
    uuid: ModelDefaults.generateUuid(),
    created: ModelDefaults.now(),
    name: name,
  );

  factory Unit.fromJson(Map<String, Object?> json) => _$UnitFromJson(json);
}
