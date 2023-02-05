import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/settings/settings.dart';
import '../../../utils/isar.dart';
import '../../persistance.dart';

part 'settings.g.dart';

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
