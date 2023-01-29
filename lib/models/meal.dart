import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

import 'models.dart';

part 'meal.g.dart';

@collection
class Meal {
  @Index(unique: true, replace: true)
  String uuid = const Uuid().v4();

  Id get isarId => Models.fastHash(uuid);

  DateTime createdAt = DateTime.now();
  late String name;
  String? thumbnailBase64;
  List<String>? imagesBase64;

  late List<Rating> ratings;
}

/// As stated in the documentation, it's not allowed to use
/// required attributes (even not by using late) with [@embedded]
/// classes. Also to be able to have nullable [enum]s, the standard
/// [@enumerated] is not suitable (check documentation for possible
/// variations - [EnumType.name] is a good choice though)
@embedded
class Rating {
  String? description;

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
