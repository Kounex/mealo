import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../models/tag/tag.dart';
import '../../persistance.dart';

part 'tags.g.dart';

@riverpod
class Tags extends _$Tags with Persistance<Tag> {
  @override
  FutureOr<List<Tag>> build() async => this.init();
}
