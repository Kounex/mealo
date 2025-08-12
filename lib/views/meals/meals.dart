import 'package:base_components/base_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/meal/meal.dart';
import '../../utils/router.dart';
import '../../widgets/shared/meal_grid.dart';
import 'widgets/add_edit_meal_sheet/add_edit_meal_sheet.dart';

class MealsView extends ConsumerWidget {
  final ScrollController controller;

  const MealsView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              onClose: () {
                /// Important step - this makes sure that all changes we made
                /// here are set back to its original value
                ref.invalidate(mealsProvider);
              },
            ),
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      children: [
        Padding(
          padding: EdgeInsets.all(DesignSystem.spacing.x24),
          child: MealGrid(
            provider: mealsProvider,
            onTap: (meal) => RouterUtils.goTo(
              context,
              MealDetailRoute(meal.uuid),
            ),
          ),
        ),
      ],
    );
  }
}
