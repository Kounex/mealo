import 'package:flutter/material.dart';
import 'package:mealo/stores/views/home.dart';
import 'package:mealo/utils/router.dart';
import 'package:mealo/widgets/shared/meal_grid.dart';

import '../../../widgets/base/ui/card.dart';

class PrevRandomMeals extends StatelessWidget {
  const PrevRandomMeals({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      title: 'Randomized meals',
      expandable: true,
      expanded: false,
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
