import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../../stores/persistance.dart';
import '../models.dart';

part 'rating.g.dart';
part 'ratings.g.dart';

@riverpod
class Ratings extends _$Ratings with Persistance<Rating> {
  @override
  FutureOr<List<Rating>> build() async => this.init();
}

@collection
class Rating implements BaseModel {
  @override
  @Index(unique: true, replace: true)
  String uuid = const Uuid().v4();

  Id get isarId => Models.fastHash(uuid);

  @override
  @Index(unique: true)
  late String name;

  String? description;
}
