import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:uuid/uuid.dart';

import '../../../types/api/meal.dart';
import 'meal_card.dart';

const double kMealGridCrossAxisExtent = 200.0;

class MealGrid extends StatelessWidget {
  const MealGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final int columnCount =
        MediaQuery.of(context).size.width ~/ kMealGridCrossAxisExtent;

    return AnimationLimiter(
      child: SliverGrid.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200.0,
          mainAxisExtent: 150.0,
          mainAxisSpacing: 24.0,
          crossAxisSpacing: 24.0,
        ),
        itemCount: 10,
        itemBuilder: (context, index) => AnimationConfiguration.staggeredGrid(
          position: index,
          duration: const Duration(milliseconds: 375),
          columnCount: columnCount,
          child: ScaleAnimation(
            child: FadeInAnimation(
              child: MealCard(
                meal: Meal(
                  uuid: const Uuid().v4(),
                  createdAt: DateTime.now(),
                  name: 'Penne Gorgonzola mit Baguette',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
