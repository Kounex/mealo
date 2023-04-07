import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/models/meal/meal.dart';
import 'package:mealo/utils/modal.dart';

import '../../utils/router.dart';
import '../../widgets/base/functional/scaffold.dart';
import '../../widgets/shared/meal_grid.dart';
import 'widgets/add_edit_meal_sheet/add_edit_meal_sheet.dart';

class MealsView extends StatelessWidget {
  final ScrollController controller;

  const MealsView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      controller: this.controller,
      hasBottomTabBarSpacing: true,
      appBarProperties: AppBarProperties(
        title: const Text('Meals'),
        actions: [
          IconButton(
            onPressed: () => ModalUtils.showExpandedModalBottomSheet(
              context,
              const AddEditMealSheet(),
            ),
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.all(24.0),
          child: MealGrid(
            provider: mealsProvider,
            onTap: (meal) => RouterUtils.beamTo(
              context,
              MealDetailRoute(meal.uuid),
            ),
          ),
        ),
      ],
    );
  }
}
