import 'package:flutter/material.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/views/home/widgets/meal_randomizer_sheet/meal_randomizer_sheet.dart';
import 'package:mealo/widgets/base/ui/card.dart';

import '../../utils/design_system.dart';
import '../../widgets/animation/fader.dart';
import '../../widgets/base/functional/scaffold.dart';
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
                        color: Theme.of(context).colorScheme.onBackground,
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
        BaseCard(
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => ModalUtils.showExpandedModalBottomSheet(
                context,
                const MealRandomizerSheet(),
              ),
              child: const Text('Next Meal!'),
            ),
          ),
        ),
        const PrevAteMeals(),
        const PrevRandomMeals(),
      ],
    );
  }
}
