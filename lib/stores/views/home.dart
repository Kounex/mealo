import 'package:collection/collection.dart';
import 'package:mealo/utils/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/meal/meal.dart';

part 'home.g.dart';

@riverpod
class RandomizedMeal extends _$RandomizedMeal {
  @override
  FutureOr<Meal?> build() => null;

  void start(
    Meal? meal, {
    Duration? duration,
    bool immediate = false,
  }) async {
    if (immediate) {
      this.state = AsyncValue.data(meal);
    } else {
      this.state = const AsyncLoading();
      this.state = await AsyncValue.guard(() async {
        await Future.delayed(duration ?? const Duration(seconds: 3));
        if (meal != null) {
          await IsarUtils.crud(
            (isar) =>
                isar.meals.putByUuid(meal..lastTimeRandomized = DateTime.now()),
          );
        }
        return meal;
      });
    }
  }
}

@riverpod
FutureOr<List<Meal>> prevRandomizedMeals(PrevRandomizedMealsRef ref) async {
  List<Meal> meals = await ref.watch(mealsProvider.future);

  return meals.where((meal) => meal.lastTimeRandomized != null).sorted(
        (a, b) => b.lastTimeRandomized!.compareTo(a.lastTimeRandomized!),
      );
}

@riverpod
FutureOr<List<Meal>> prevAteMeals(PrevAteMealsRef ref) async {
  List<Meal> meals = await ref.watch(mealsProvider.future);

  return meals.where((meal) => meal.lastTimeAte != null).sorted(
        (a, b) => b.lastTimeAte!.compareTo(a.lastTimeAte!),
      );
}
