import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../utils/persistance.dart';
import '../model.dart';
import '../persistance.dart';

part 'settings.g.dart';

@riverpod
class SettingsSingleton extends _$SettingsSingleton
    with SingletonPersistance<Settings> {
  @override
  FutureOr<Settings> build() async => this.init();

  void setDarkMode(bool darkMode) {
    PersistanceUtils.transaction(
      PersistanceOperation.insertUpdate,
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
