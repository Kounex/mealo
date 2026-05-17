import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/experimental/json_persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';
import '../../storage.dart';

part 'settings.freezed.dart';
part 'settings.g.dart';

@riverpod
@JsonPersist()
class SettingsSingleton extends _$SettingsSingleton {
  @override
  FutureOr<Settings> build() async {
    await persist(
      ref.watch(storageProvider.future),
      options: const StorageOptions(cacheTime: StorageCacheTime.unsafe_forever),
    ).future;

    /// If nothing persisted yet (first launch), return defaults
    return state.value ?? Settings.defaults();
  }

  void setDarkMode(bool darkMode) {
    state = AsyncData(state.value!.copyWith(darkMode: darkMode));
  }
}

@freezed
abstract class Settings with _$Settings implements BaseModel {
  Settings._();

  factory Settings({
    // BaseModel fields
    String? uuid,
    DateTime? created,
    DateTime? updated,

    /// User controllable settings
    bool? darkMode,

    /// Internal settings to check certain states
    @Default(false) bool firstLaunch,
  }) = _Settings;

  /// Default settings for first launch
  factory Settings.defaults() => Settings(
    uuid: ModelDefaults.generateUuid(),
    created: ModelDefaults.now(),
    firstLaunch: true,
  );

  factory Settings.fromJson(Map<String, Object?> json) =>
      _$SettingsFromJson(json);
}
