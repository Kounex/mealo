import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/meal/meal.dart';
import 'package:mealo/stores/views/home.dart';
import 'package:mealo/utils/styling.dart';
import 'package:mealo/views/home/widgets/meal_randomizer/meal_shuffle.dart';
import 'package:mealo/views/meals/widgets/meal_card.dart';
import 'package:mealo/widgets/animation/text_shimmer.dart';
import 'package:mealo/widgets/base/async_value_builder.dart';

import '../../../../utils/router.dart';
import '../../../../widgets/base/card.dart';

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
                      ? MealCard(
                          meal: asyncRandomizedMeal.value,
                          onTap: () => RouterUtils.goTo(
                            context,
                            HomeMealDetailRoute(
                                asyncRandomizedMeal.value!.uuid),
                            data: asyncRandomizedMeal.value,
                          ),
                        )
                      : meals.isNotEmpty
                          ? const Text('Hungy? Don\'t know what to eat next? ')
                          : const Text('You don\'t have any meals yet.'),
            ),
          ),
          const SizedBox(height: 24.0),
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
                  ? const SizedBox(
                      height: 18.0,
                      width: 18.0,
                      child: CircularProgressIndicator(strokeWidth: 2.0),
                    )
                  : const Text('Randomize!'),
            ),
          ),
        ],
      ),
    );
  }
}
