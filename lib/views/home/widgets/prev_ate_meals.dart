import 'package:flutter/material.dart';
import 'package:mealo/utils/design_system.dart';

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
      bottomPadding: DesignSystem.spacing.x8,
      child: MealGrid(
        provider: prevAteMealsProvider,
        skipLoadingOnReload: true,
        empty: const Text('No meals have been marked as eaten yet!'),
        onTap: (meal) => RouterUtils.beamTo(
          context,
          HomeMealDetailRoute(meal.uuid),
        ),
      ),
    );
  }
}
