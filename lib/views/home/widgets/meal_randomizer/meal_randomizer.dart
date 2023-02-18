import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/meal/meal.dart';
import 'package:mealo/stores/views/home.dart';
import 'package:mealo/utils/styling.dart';
import 'package:mealo/views/home/widgets/meal_randomizer/meal_shuffle.dart';
import 'package:mealo/views/home/widgets/meal_randomizer/suggested_meal.dart';
import 'package:mealo/widgets/animation/text_shimmer.dart';
import 'package:mealo/widgets/base/functional/async_value_builder.dart';
import 'package:mealo/widgets/base/ui/divider.dart';
import 'package:mealo/widgets/base/ui/progress_indicator.dart';

import '../../../../widgets/base/ui/card.dart';

class MealRandomizer extends ConsumerStatefulWidget {
  const MealRandomizer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MealRandomizerState();
}

class _MealRandomizerState extends ConsumerState<MealRandomizer> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Meal>> asyncMeals = ref.watch(mealsProvider);
    AsyncValue<Meal?> asyncRandomizedMeal = ref.watch(randomizedMealProvider);

    return BaseCard(
      constrained: false,
      child: Column(
        children: [
          BaseAsyncValueBuilder(
            asyncValue: asyncMeals,
            loading: () => const TextShimmer(),
            data: (meals) => AnimatedSwitcher(
              duration: StylingUtils.kBaseAnimationDuration * 4,
              child: asyncRandomizedMeal.isLoading
                  ? const MealShuffle(
                      duration: Duration(seconds: 3),
                    )
                  : asyncRandomizedMeal.valueOrNull != null
                      ? SuggestedMeal(meal: asyncRandomizedMeal.value!)
                      : meals.isNotEmpty
                          ? const Text(
                              'Hungy? Don\'t know what to eat next? Let the app decide what you are going to eat next - you can make use of some filters to make it less random!')
                          : const Text('You don\'t have any meals yet.'),
            ),
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
                      ref.read(randomizedMealProvider.notifier).start(
                            asyncMeals.value!.elementAt(
                              Random().nextInt(asyncMeals.value!.length),
                            ),
                          );
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
