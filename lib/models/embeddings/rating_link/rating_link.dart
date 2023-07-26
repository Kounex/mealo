import 'package:isar/isar.dart';

part 'rating_link.g.dart';

@embedded
class RatingLink {
  String? ratingUuid;

  RatingValue value = RatingValue.three;
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
