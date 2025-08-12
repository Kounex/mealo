import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';

import '../../utils/router.dart';
import 'widgets/prev_ate_meals.dart';
import 'widgets/prev_random_meals.dart';

class HomeView extends StatelessWidget {
  final ScrollController controller;

  const HomeView({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      controller: this.controller,
      hasBottomTabBarSpacing: true,
      appBarProperties: AppBarProperties(
        stretch: true,
        expandedHeight: 200,
        flexibleSpace: FlexibleSpaceBar(
          titlePadding: const EdgeInsetsDirectional.only(start: 0, bottom: 14),
          title: LayoutBuilder(
            builder: (context, constraints) => constraints.maxHeight <=
                    kToolbarHeight + MediaQuery.of(context).viewPadding.top - 14
                ? Fader(
                    child: Text(
                      'Mealo',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  )
                : const SizedBox(),
          ),
          background: Container(
            alignment: Alignment.bottomCenter,
            padding: EdgeInsets.only(bottom: DesignSystem.spacing.x24),
            child: Image.asset(
              'assets/images/app-icon.png',
              height: 164,
            ),
          ),
        ),
      ),
      children: [
        // MealRandomizer(),
        Padding(
          padding: EdgeInsets.all(DesignSystem.spacing.x18),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => RouterUtils.goTo(
                context,
                HomeRandomizeMealRoute(),
              ),
              child: const Text('Next Meal'),
            ),
          ),
        ),
        const PrevAteMeals(),
        const PrevRandomMeals(),
      ],
    );
  }
}
