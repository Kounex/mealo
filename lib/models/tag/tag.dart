import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';
import '../persistence.dart';

part 'tag.g.dart';

@riverpod
class Tags extends _$Tags with Persistence<Tag> {
  @override
  FutureOr<List<Tag>> build() async => this.init();
}

@collection
class Tag extends CommonModel {
  String? colorHex;
}
