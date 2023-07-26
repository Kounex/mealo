import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';
import '../persistance.dart';

part 'unit.g.dart';

@riverpod
class Units extends _$Units with Persistance<Unit> {
  @override
  FutureOr<List<Unit>> build() async => this.init();
}

@collection
class Unit extends CommonModel {}
