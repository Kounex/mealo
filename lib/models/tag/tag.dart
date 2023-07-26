import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';
import '../persistance.dart';

part 'tag.g.dart';

@riverpod
class Tags extends _$Tags with Persistance<Tag> {
  @override
  FutureOr<List<Tag>> build() async => this.init();
}

@collection
class Tag extends CommonModel {
  String? colorHex;
}
