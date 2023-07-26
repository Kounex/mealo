import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../embeddings/rating_link/rating_link.dart';
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
class Meal extends CommonModel {
  DateTime createdAt = DateTime.now();

  String? instructions;
  String? thumbnailUuid;
  List<String> imagesUuids = [];

  List<RatingLink> ratings = [];
  List<String> tagUuids = [];
  List<IngredientLink> ingredients = [];
}

@embedded
class IngredientLink {
  String? uuidIngredient;
  String? uuidUnit;

  double? amount;
}
