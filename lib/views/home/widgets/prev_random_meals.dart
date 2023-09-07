import 'package:flutter/material.dart';

import '../../../stores/views/home.dart';
import '../../../utils/router.dart';
import '../../../widgets/base/ui/card.dart';
import '../../../widgets/shared/meal_grid.dart';

class PrevRandomMeals extends StatelessWidget {
  const PrevRandomMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      title: 'Randomized meals',
      initialExpanded: false,
      child: MealGrid(
        provider: prevRandomizedMealsProvider,
        itemCrossAxisExtent: 150,
        skipLoadingOnReload: true,
        empty: const Text(
            'You haven\'t randomized any meals yet! Go on, let\'s see what the clearly unbiased algorithm is recommending you to eat ;)'),
        onTap: (meal) => RouterUtils.goTo(
          context,
          HomeMealDetailRoute(meal.uuid),
        ),
      ),
    );
  }
}
