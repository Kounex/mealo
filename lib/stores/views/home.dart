import 'dart:math';

import 'package:collection/collection.dart';
import '../../utils/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/meal/meal.dart';

part 'home.g.dart';

@riverpod
FutureOr<Meal> selectedMeal(SelectedMealRef ref, String uuid) async {
  List<Meal> meals = await ref.watch(mealsProvider.future);

  return meals.firstWhere((meal) => meal.uuid == uuid);
}

@riverpod
class RandomizedMealUUID extends _$RandomizedMealUUID {
  @override
  FutureOr<String?> build() => null;

  void start({
    Duration? duration,
    bool immediate = false,
  }) async {
    AsyncValue<List<Meal>> asyncMeals = ref.read(mealsProvider);

    if (asyncMeals.valueOrNull != null) {
      Meal randomMeal = asyncMeals.value!.elementAt(
        Random().nextInt(asyncMeals.value!.length),
      );
      if (immediate) {
        this.state = AsyncValue.data(randomMeal.uuid);
      } else {
        this.state = const AsyncLoading();
        this.state = await AsyncValue.guard(() async {
          await Future.delayed(duration ?? const Duration(seconds: 3));
          await IsarUtils.crud(
            (isar) => isar.meals
                .putByUuid(randomMeal..lastTimeRandomized = DateTime.now()),
          );
          return randomMeal.uuid;
        });
      }
    } else {
      this.state = const AsyncValue.data(null);
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
