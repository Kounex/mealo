import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mealo/stores/shared/meal.dart';

import '../../../types/api/meal.dart';
import 'meal_card.dart';

const double kMealGridCrossAxisExtent = 200.0;

class MealGrid extends ConsumerWidget {
  const MealGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Meal>> asyncMeals = ref.watch(mealsProvider);

    final int columnCount =
        MediaQuery.of(context).size.width ~/ kMealGridCrossAxisExtent;

    return asyncMeals.when(
      loading: () => const SliverToBoxAdapter(
        child: Center(
          child: RefreshProgressIndicator(),
        ),
      ),
      error: (error, stackTrace) => const Center(
        child: SliverToBoxAdapter(
          child: Text('ERROR'),
        ),
      ),
      data: (meals) => meals.isNotEmpty
          ? AnimationLimiter(
              child: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200.0,
                  mainAxisExtent: 150.0,
                  mainAxisSpacing: 24.0,
                  crossAxisSpacing: 24.0,
                ),
                itemCount: meals.length,
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  columnCount: columnCount,
                  child: ScaleAnimation(
                    child: FadeInAnimation(
                      child: MealCard(
                        meal: meals[index],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : const SliverToBoxAdapter(
              child: Text('No meals yet! ò.ó'),
            ),
    );
  }
}
