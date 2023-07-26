import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/meal/meal.dart';
import '../../../../stores/views/home.dart';
import '../../../../utils/styling.dart';
import '../../../../widgets/animation/text_shimmer.dart';
import '../../../../widgets/base/functional/async_value_builder.dart';
import '../../../../widgets/base/ui/card.dart';
import '../../../../widgets/base/ui/divider.dart';
import '../../../../widgets/base/ui/progress_indicator.dart';
import 'meal_shuffle.dart';
import 'suggested_meal.dart';

class MealRandomizer extends ConsumerStatefulWidget {
  const MealRandomizer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MealRandomizerState();
}

class _MealRandomizerState extends ConsumerState<MealRandomizer> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Meal>> asyncMeals = ref.watch(mealsProvider);
    AsyncValue<String?> asyncRandomizedMeal =
        ref.watch(randomizedMealUuidProvider);

    return BaseCard(
      child: Column(
        children: [
          BaseAsyncValueBuilder(
            asyncValue: asyncMeals,
            loading: () => const TextShimmer(),
            data: (meals) => AnimatedSwitcher(
                duration: StylingUtils.kBaseAnimationDuration * 4,
                child: () {
                  if (asyncRandomizedMeal.isLoading) {
                    return const MealShuffle(
                      duration: Duration(seconds: 3),
                    );
                  }
                  if (asyncRandomizedMeal.valueOrNull != null) {
                    Meal? randomizedMeal = meals.firstWhereOrNull(
                        (meal) => meal.uuid == asyncRandomizedMeal.value);
                    if (randomizedMeal != null) {
                      return SuggestedMeal(meal: randomizedMeal);
                    }
                  }
                  if (meals.isNotEmpty) {
                    return const Text(
                        'Hungy? Don\'t know what to eat next? Let the app decide what you are going to eat next - you can make use of some filters to make it less random!');
                  }
                  return const Text('You don\'t have any meals yet.');
                }()),
          ),
          const SizedBox(height: 12.0),
          const BaseDivider(),
          const SizedBox(height: 12.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: !asyncRandomizedMeal.isLoading &&
                      asyncMeals.asData != null &&
                      asyncMeals.value!.isNotEmpty
                  ? () {
                      ref.read(randomizedMealUuidProvider.notifier).start();
                    }
                  : null,
              child: asyncRandomizedMeal.isLoading
                  ? BaseProgressIndicator(size: 18.0)
                  : const Text('Randomize!'),
            ),
          ),
        ],
      ),
    );
  }
}
