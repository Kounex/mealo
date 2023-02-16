import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/widgets/base/scaffold.dart';

import 'widgets/add_meal_sheet/add_meal_sheet.dart';
import 'widgets/meal_grid.dart';

class MealsView extends StatelessWidget {
  final ScrollController controller;

  const MealsView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      hasBottomTabBarSpacing: true,
      appBarProperties: AppBarProperties(
        title: const Text('Meals'),
        actions: [
          IconButton(
            onPressed: () => ModalUtils.showExpandedModalBottomSheet(
              context,
              const AddMealSheet(),
            ),
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
      ),
      children: const [
        Padding(
          padding: EdgeInsets.all(24.0),
          child: MealGrid(),
        ),
      ],
    );
  }
}
