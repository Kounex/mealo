import 'dart:math';

import 'package:collection/collection.dart';
import 'package:mealo/models/randomized_run/randomized_run.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/meal/meal.dart';

part 'home.g.dart';

@riverpod
FutureOr<Meal> selectedMeal(SelectedMealRef ref, String uuid) async {
  List<Meal> meals = await ref.watch(mealsProvider.future);

  return meals.firstWhere((meal) => meal.uuid == uuid);
}

@riverpod
class RandomizedMealUuid extends _$RandomizedMealUuid {
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
          // PersistanceUtils.crud(
          //   (isar) => isar.randomizedRuns
          //       .put(randomMeal..lastTimeRandomized = DateTime.now()),
          // );
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
  List<RandomizedRun> randomizedRuns =
      (await ref.watch(randomizedRunsProvider.future))
          .sorted((a, b) => b.created.compareTo(a.created));

  return meals
      .where((meal) => randomizedRuns
          .any((randomizedRun) => randomizedRun.mealUuid == meal.uuid))
      .toList();
}

@riverpod
FutureOr<List<Meal>> prevAteMeals(PrevAteMealsRef ref) async {
  List<Meal> meals = await ref.watch(mealsProvider.future);
  List<RandomizedRun> randomizedRuns =
      (await ref.watch(randomizedRunsProvider.future))
          .sorted((a, b) => b.created.compareTo(a.created));

  return meals
      .where((meal) => randomizedRuns.any((randomizedRun) =>
          randomizedRun.mealUuid == meal.uuid && randomizedRun.feast))
      .toList();
}
