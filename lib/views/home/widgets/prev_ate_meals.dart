import 'package:flutter/material.dart';
import 'package:mealo/stores/views/home.dart';
import 'package:mealo/utils/router.dart';
import 'package:mealo/widgets/base/card.dart';
import 'package:mealo/widgets/custom/meal_grid.dart';

class PrevAteMeals extends StatelessWidget {
  const PrevAteMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      constrained: false,
      title: 'Previous meals',
      child: MealGrid(
        provider: prevAteMealsProvider,
        empty: const Text('No meals have been marked as eaten yet!'),
        skipLoadingOnReload: true,
        onTap: (meal) => RouterUtils.goTo(
          context,
          HomeMealDetailRoute(meal.uuid),
          data: meal,
        ),
      ),
    );
  }
}
