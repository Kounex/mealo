import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/persistence.dart';
import '../model.dart';
import '../persistence.dart';

part 'settings.g.dart';

@riverpod
class SettingsSingleton extends _$SettingsSingleton
    with SingletonPersistence<Settings> {
  @override
  FutureOr<Settings> build() async => this.init();

  void setDarkMode(bool darkMode) {
    PersistenceUtils.transaction(
      PersistenceOperation.insertUpdate,
      [this.state.value!..darkMode = darkMode],
    );
  }
}

@collection
class Settings extends BaseModel {
  /// ********************************************************
  /// User controllable settings
  /// ********************************************************
  bool? darkMode;

  /// ********************************************************
  /// Internal settings to check certain states
  /// ********************************************************
  bool firstLaunch = false;
}
