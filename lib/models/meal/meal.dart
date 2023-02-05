import 'package:isar/isar.dart';
import 'package:mealo/models/tag/tag.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/uuid.dart';

import '../persistance.dart';
import '../models.dart';

part 'meal.g.dart';

@riverpod
class Meals extends _$Meals with Persistance<Meal> {
  @override
  FutureOr<List<Meal>> build() async => this.init();

  void fetch() async {
    /// Here we will add the API call to fetch the latest [MealDTO] from
    /// the backend and sync it with our persistance layer. This might trigger
    /// additional CRUD operations to sync potentially offline created
    /// entities with the backend
    throw UnimplementedError();
  }
}

@collection
class Meal implements BaseModel {
  @override
  @Index(unique: true, replace: true)
  String uuid = const Uuid().v4();

  Id get isarId => Models.fastHash(uuid);

  DateTime createdAt = DateTime.now();
  @override
  late String name;
  String? thumbnailBase64;
  List<String>? imagesBase64;

  late List<RatingValueMap> ratings;

  IsarLinks<Tag> tags = IsarLinks();
}

@embedded
class RatingValueMap {
  String? uuid;

  @Enumerated(EnumType.name)
  RatingValue? value;
}

enum RatingValue {
  one,
  two,
  three,
  four,
  five;

  int get number {
    switch (this) {
      case RatingValue.one:
        return 1;
      case RatingValue.two:
        return 2;
      case RatingValue.three:
        return 3;
      case RatingValue.four:
        return 4;
      case RatingValue.five:
        return 5;
    }
  }
}
