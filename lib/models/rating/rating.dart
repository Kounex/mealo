import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';
import '../persistance.dart';

part 'rating.g.dart';

@riverpod
class Ratings extends _$Ratings with Persistance<Rating> {
  @override
  FutureOr<List<Rating>> build() async => this.init();
}

@collection
class Rating extends CommonModel {
  String? description;
}
