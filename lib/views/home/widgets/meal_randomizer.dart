import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/meal/meal.dart';
import 'package:mealo/views/meals/widgets/meal_card.dart';
import 'package:mealo/widgets/base/async_value_builder.dart';
import 'package:mealo/widgets/base/divider.dart';

import '../../../widgets/base/card.dart';

class MealRandomizer extends ConsumerStatefulWidget {
  const MealRandomizer({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MealRandomizerState();
}

class _MealRandomizerState extends ConsumerState<MealRandomizer> {
  final Duration _randomizeDuration = const Duration(milliseconds: 3000);
  Meal? _randomizedMeal;

  bool _loadingRandomizedMeal = false;

  @override
  Widget build(BuildContext context) {
    AsyncValue<List<Meal>> asyncMeals = ref.watch(mealsProvider);
    // Meal? randomizedMeal = ref.watch(randomizedM)

    return BaseCard(
      constrained: false,
      child: Column(
        children: [
          BaseAsyncValueBuilder(
            asyncValue: asyncMeals,
            data: (meals) => _randomizedMeal != null
                ? MealCard(meal: _randomizedMeal!)
                : meals.isNotEmpty
                    ? const Text('Hungy? Don\'t know what to eat next? ')
                    : const Text('NO MEALS :<<<'),
          ),
          const SizedBox(height: 24.0),
          const BaseDivider(),
          const SizedBox(height: 24.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: !_loadingRandomizedMeal &&
                      asyncMeals.asData != null &&
                      asyncMeals.value!.isNotEmpty
                  ? () {
                      setState(() {
                        _loadingRandomizedMeal = true;
                        Future.delayed(_randomizeDuration, () {
                          setState(() {
                            _loadingRandomizedMeal = false;
                            _randomizedMeal = asyncMeals.value!.elementAt(
                              Random().nextInt(asyncMeals.value!.length),
                            );
                          });
                        });
                      });
                    }
                  : null,
              child: asyncMeals.isLoading || _loadingRandomizedMeal
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
