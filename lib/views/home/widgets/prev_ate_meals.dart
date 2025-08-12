import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';

import '../../../stores/views/home.dart';
import '../../../utils/router.dart';
import '../../../widgets/shared/meal_grid.dart';

class PrevAteMeals extends StatelessWidget {
  const PrevAteMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      topPadding: 0,
      title: 'Previous meals',
      bottomPadding: DesignSystem.spacing.x8,
      child: MealGrid(
        provider: prevAteMealsProvider,
        skipLoadingOnReload: true,
        empty: const Text('No meals have been marked as eaten yet!'),
        onTap: (meal) => RouterUtils.goTo(
          context,
          HomeMealDetailRoute(meal.uuid),
        ),
      ),
    );
  }
}
