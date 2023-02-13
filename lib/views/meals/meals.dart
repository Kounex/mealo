import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/widgets/animation/fader.dart';
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
        stretch: true,
        expandedHeight: 200,
        actions: [
          IconButton(
            onPressed: () => ModalUtils.showExpandedModalBottomSheet(
              context,
              const AddMealSheet(),
            ),
            icon: const Icon(CupertinoIcons.add),
          ),
        ],
        flexibleSpace: FlexibleSpaceBar(
          title: LayoutBuilder(
            builder: (context, constraints) => constraints.maxHeight <=
                    kToolbarHeight + MediaQuery.of(context).viewPadding.top - 16
                ? Fader(
                    child: Text(
                      'Mealo',
                      style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer,
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
          background: Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 24.0),
            child: Image.asset(
              'assets/images/app-icon.png',
              height: 164,
            ),
          ),
        ),
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
