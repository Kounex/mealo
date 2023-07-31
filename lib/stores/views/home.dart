import 'dart:math';

import 'package:collection/collection.dart';
import 'package:mealo/models/randomized_run/randomized_run.dart';
import 'package:mealo/utils/persistance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../models/meal/meal.dart';

part 'home.g.dart';

@riverpod
FutureOr<Meal> selectedMeal(SelectedMealRef ref, String uuid) async {
  List<Meal> meals = await ref.watch(mealsProvider.future);

  return meals.firstWhere((meal) => meal.uuid == uuid);
}

@riverpod
class CurrentRandomizedRun extends _$CurrentRandomizedRun {
  @override
  FutureOr<RandomizedRun?> build() => null;

  void start({
    Duration? duration,

    /// TODO: here we will add the tags, ratings etc. which we want to filter
  }) async {
    AsyncValue<List<Meal>> asyncMeals = ref.read(mealsProvider);

    if (asyncMeals.valueOrNull != null) {
      final randomMeal = asyncMeals.value!.elementAt(
        Random().nextInt(asyncMeals.value!.length),
      );

      final randomizedRun = RandomizedRun()..mealUuid = randomMeal.uuid;

      this.state = const AsyncLoading();
      this.state = await AsyncValue.guard(() async {
        await Future.delayed(duration ?? const Duration(seconds: 3));

        PersistanceUtils.transaction(
          PersistanceOperation.insertUpdate,
          [randomizedRun],
        );

        return randomizedRun;
      });
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
