import 'package:flutter/material.dart';
import 'package:mealo/stores/views/home.dart';
import 'package:mealo/utils/router.dart';
import 'package:mealo/widgets/base/ui/card.dart';
import 'package:mealo/widgets/shared/meal_grid.dart';

class PrevAteMeals extends StatelessWidget {
  const PrevAteMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      title: 'Previous meals',
      child: MealGrid(
        provider: prevAteMealsProvider,
        empty: const Text('No meals have been marked as eaten yet!'),
        skipLoadingOnReload: true,
        onTap: (meal) => RouterUtils.goTo(
          context,
          HomeMealDetailRoute(meal.uuid),
        ),
      ),
    );
  }
}
