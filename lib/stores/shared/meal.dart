import 'package:mealo/models/meal.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
