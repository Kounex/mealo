import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme.g.dart';

class ThemeStore {}

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool? build() => null;

  void setDarkMode(bool darkMode) {
    this.state = darkMode;
  }
}
