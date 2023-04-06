import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tabs.g.dart';

@riverpod
class CurrentTabIndex extends _$CurrentTabIndex {
  @override
  int build() => 0;

  void setTabIndex(int index) => state = index;
}
