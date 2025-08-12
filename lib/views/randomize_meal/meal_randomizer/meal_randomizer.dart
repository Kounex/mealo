import 'package:base_components/base_components.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/types/classes/randomize_config.dart';

import '../../../../../models/embeddings/rating_link/rating_link.dart';
import '../../../../../models/ingredient/ingredient.dart';
import '../../../../../models/meal/meal.dart';
import '../../../../../models/randomized_run/randomized_run.dart';
import '../../../../../models/tag/tag.dart';
import '../../../../../stores/views/home.dart';
import 'meal_shuffle.dart';
import 'suggested_meal.dart';

class MealRandomizer extends ConsumerStatefulWidget {
  final List<Tag> includedTags;
  final List<Tag> excludedTags;
  final List<Ingredient> includedIngredients;
  final List<Ingredient> excludedIngredients;
  final List<RatingLink> selectedRatings;
  final int? daysNotEaten;

  const MealRandomizer({
    super.key,
    required this.includedTags,
    required this.excludedTags,
    required this.includedIngredients,
    required this.excludedIngredients,
    required this.selectedRatings,
    required this.daysNotEaten,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MealRandomizerState();
}

class _MealRandomizerState extends ConsumerState<MealRandomizer> {
  bool _hasIncludedTags(Meal meal) =>
      this.widget.includedTags.every((tag) => meal.tagUuids.contains(tag.uuid));

  bool _hasNotExcludedTags(Meal meal) => this
      .widget
      .excludedTags
      .every((tag) => !meal.tagUuids.contains(tag.uuid));

  bool _hasIncludedIngredients(Meal meal) => this
      .widget
      .includedIngredients
      .every((ingredient) => meal.ingredients.any((ingredientLink) =>
          ingredientLink.uuidIngredient == ingredient.uuid));

  bool _hasNotExcludedIngredients(Meal meal) => this
      .widget
      .excludedIngredients
      .every((ingredient) => meal.ingredients.every((ingredientLink) =>
          ingredientLink.uuidIngredient != ingredient.uuid));

  bool _hasRatingsWithValue(Meal meal) =>
      this.widget.selectedRatings.every((rating) {
        RatingLink? ratingLink = meal.ratings.firstWhereOrNull(
            (ratingLink) => ratingLink.ratingUuid == rating.ratingUuid);

        if (ratingLink case var ratingLink?) {
          return ratingLink.value.number >= rating.value.number;
        }

        return false;
      });

  bool _hasNotBeenEatenSince(Meal meal, List<RandomizedRun> randomizedRuns) {
    DateTime? hasNotBeenEatenSince = this.widget.daysNotEaten != null
        ? DateTime.now().subtract(Duration(days: this.widget.daysNotEaten!))
        : null;

    if (hasNotBeenEatenSince == null) {
      return true;
    }

    List<RandomizedRun> randomizedMealsOfGivenMeal = randomizedRuns
        .where((randomizedRun) =>
            randomizedRun.mealUuid == meal.uuid && randomizedRun.eaten)
        .toList();

    if (randomizedMealsOfGivenMeal.isEmpty) {
      return true;
    }

    return randomizedMealsOfGivenMeal.every((randomizedRun) =>
        randomizedRun.updated.isBefore(hasNotBeenEatenSince));
  }

  List<Meal> _filterMeals(
      List<Meal> meals, List<RandomizedRun> randomizedRuns) {
    return meals
        .where((meal) =>
            _hasIncludedTags(meal) &&
            _hasNotExcludedTags(meal) &&
            _hasIncludedIngredients(meal) &&
            _hasNotExcludedIngredients(meal) &&
            _hasRatingsWithValue(meal) &&
            _hasNotBeenEatenSince(meal, randomizedRuns))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final asyncRandomizedRuns = ref.watch(randomizedRunsProvider);
    final asyncCurrentRandomizedRun = ref.watch(currentRandomizedRunProvider);
    final asyncMeals = ref.watch(mealsProvider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncRandomizedRuns,
      loading: () => const TextShimmer(),
      data: (randomizedRuns) {
        return BaseAsyncValueBuilder(
          asyncValue: asyncMeals,
          loading: () => const TextShimmer(),
          data: (meals) {
            List<Meal> filteredMeals = _filterMeals(meals, randomizedRuns);

            return BaseCard(
              child: Column(
                children: [
                  AnimatedSwitcher(
                      duration: DesignSystem.animation.defaultDurationMS250 * 4,
                      child: () {
                        if (asyncCurrentRandomizedRun.isLoading) {
                          return const MealShuffle(
                            duration: Duration(seconds: 3),
                          );
                        }
                        if (asyncCurrentRandomizedRun.valueOrNull != null) {
                          Meal? randomizedMeal = filteredMeals.firstWhereOrNull(
                              (meal) =>
                                  meal.uuid ==
                                  asyncCurrentRandomizedRun.value!.mealUuid);
                          return randomizedMeal != null
                              ? SuggestedMeal(
                                  meal: randomizedMeal,
                                  randomizedRun:
                                      asyncCurrentRandomizedRun.value!,
                                )
                              : const Text('Could not resolve meal!');
                        }
                        if (meals.isEmpty) {
                          return const Text(
                              'You don\'t have any meals yet. Please create a meal first!');
                        }

                        if (filteredMeals.isEmpty) {
                          return const Text(
                              'There is no meal available which fits the given filters. Please adjust so a meal can be selected for you!');
                        }
                        return Column(
                          children: [
                            Text(
                              'There are currently',
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: DesignSystem.spacing.x12),
                            Text(
                              '${filteredMeals.length} meals',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            SizedBox(height: DesignSystem.spacing.x12),
                            Text(
                              'available for randomizing! Make sure to adjust the filters at the bottom to your liking!',
                              textAlign: TextAlign.center,
                            ),
                          ],
                        );
                      }()),
                  SizedBox(height: DesignSystem.spacing.x12),
                  const BaseDivider(),
                  SizedBox(height: DesignSystem.spacing.x12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: !asyncCurrentRandomizedRun.isLoading &&
                              filteredMeals.isNotEmpty
                          ? () {
                              ref
                                  .read(currentRandomizedRunProvider.notifier)
                                  .start(
                                    config: RandomizeConfig(
                                      filteredMeals,
                                      this.widget.includedTags,
                                      this.widget.excludedTags,
                                      this.widget.includedIngredients,
                                      this.widget.excludedIngredients,
                                      this.widget.selectedRatings,
                                      this.widget.daysNotEaten,
                                    ),
                                  );
                            }
                          : null,
                      child: asyncCurrentRandomizedRun.isLoading
                          ? BaseProgressIndicator(size: DesignSystem.size.x18)
                          : const Text('Randomize!'),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
