import 'package:isar/isar.dart';
import 'package:mealo/models/i_meal.dart';
import 'package:mealo/types/api/meal.dart';
import 'package:mealo/utils/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal.g.dart';

class MealStore {}

@riverpod
class Meals extends _$Meals {
  @override
  FutureOr<List<Meal>> build() async => _fetchMeals();

  Future<List<Meal>> _fetchMeals() async {
    //TODO: here we will add the API call once there will be a backend

    List<IMeal> iMeals = await (await IsarUtils.instance([IMealSchema]))
        .iMeals
        .where()
        .findAll();

    return iMeals
        .map(
          (iMeal) => Meal(
              uuid: iMeal.uuid, createdAt: iMeal.createdAt, name: iMeal.name),
        )
        .toList();
  }
}
