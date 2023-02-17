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
        return meal;
      });
    }
  }
}
