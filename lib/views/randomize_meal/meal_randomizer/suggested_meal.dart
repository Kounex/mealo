import 'package:base_components/base_components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../models/meal/meal.dart';
import '../../../../../models/randomized_run/randomized_run.dart';
import '../../../../../stores/views/home.dart';
import '../../../../../utils/router.dart';
import '../../../../../widgets/shared/meal_card.dart';
import '../../../utils/persistence.dart';

class SuggestedMeal extends ConsumerWidget {
  final Meal meal;
  final RandomizedRun randomizedRun;

  const SuggestedMeal({
    super.key,
    required this.meal,
    required this.randomizedRun,
  });

  Future<void> _feast(BuildContext context, WidgetRef ref) async {
    PersistenceUtils.transaction(
      PersistenceOperation.insertUpdate,
      [this.randomizedRun..eaten = true],
    );
    ref.invalidate(currentRandomizedRunProvider);
    if (context.mounted) {
      RouterUtils.goTo(
        context,
        HomeRandomizedMealDetailRoute(meal.uuid),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 250.0,
      child: Column(
        children: [
          MealCard(
            meal: this.meal,
            height: 200.0,
            width: 250.0,
            onTap: () => RouterUtils.goTo(
              context,
              HomeRandomizedMealDetailRoute(this.meal.uuid),
              data: this.meal,
            ),
          ),
          SizedBox(height: DesignSystem.spacing.x4),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _feast(context, ref),
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.green)),
              icon: const Icon(CupertinoIcons.checkmark_alt_circle),
              label: const Text('Let\'s feast!'),
            ),
          )
        ],
      ),
    );
  }
}
