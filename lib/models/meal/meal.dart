import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../model.dart';
import '../persistance.dart';

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
class Meal extends Model {
  DateTime createdAt = DateTime.now();
  DateTime? lastTimeRandomized;
  DateTime? lastTimeAte;

  String? instructions;
  String? thumbnailUuid;
  List<String> imagesUuids = [];

  List<RatingLink> ratings = [];
  List<String> tagUuids = [];
  List<IngredientLink> ingredients = [];
}

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

@embedded
class IngredientLink {
  String? uuidIngredient;
  String? uuidUnit;

  double? amount;
}
