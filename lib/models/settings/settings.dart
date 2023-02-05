import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../stores/persistance.dart';
import '../../utils/isar.dart';
import '../models.dart';

part 'settings.g.dart';
part 'settings_singleton.g.dart';

@riverpod
class SettingsSingleton extends _$SettingsSingleton
    with SingletonPersistance<Settings> {
  @override
  FutureOr<Settings> build() async => this.init();

  void setDarkMode(bool darkMode) {
    IsarUtils.crud(
      (isar) => isar.settings.put(this.state.value!..darkMode = darkMode),
    );
  }
}

@collection
class Settings {
  @Index(unique: true, replace: true)
  String uuid = const Uuid().v4();

  Id get isarId => Models.fastHash(uuid);

  /// ********************************************************
  /// User controllable settings
  /// ********************************************************
  bool? darkMode;

  /// ********************************************************
  /// Internal settings to check certain states
  /// ********************************************************
  bool firstLaunch = false;
}
