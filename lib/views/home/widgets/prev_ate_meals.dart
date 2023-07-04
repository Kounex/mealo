import 'package:flutter/material.dart';
import '../../../stores/views/home.dart';
import '../../../utils/router.dart';
import '../../../widgets/base/ui/card.dart';
import '../../../widgets/shared/meal_grid.dart';

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
        onTap: (meal) => RouterUtils.beamTo(
          context,
          HomeMealDetailRoute(meal.uuid),
        ),
      ),
    );
  }
}
