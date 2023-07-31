import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/randomized_run/randomized_run.dart';
import 'package:mealo/utils/persistance.dart';

import '../../../../models/meal/meal.dart';
import '../../../../stores/views/home.dart';
import '../../../../utils/router.dart';
import '../../../../widgets/shared/meal_card.dart';

class SuggestedMeal extends ConsumerWidget {
  final Meal meal;
  final RandomizedRun randomizedRun;

  const SuggestedMeal({
    super.key,
    required this.meal,
    required this.randomizedRun,
  });

  Future<void> feast(BuildContext context, WidgetRef ref) async {
    PersistanceUtils.transaction(
      PersistanceOperation.insertUpdate,
      [this.randomizedRun..feast = true],
    );
    ref.invalidate(currentRandomizedRunProvider);
    if (context.mounted) {
      RouterUtils.beamTo(
        context,
        HomeMealDetailRoute(meal.uuid),
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
            onTap: () => RouterUtils.beamTo(
              context,
              HomeMealDetailRoute(this.meal.uuid),
              data: this.meal,
            ),
          ),
          const SizedBox(height: 4.0),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => feast(context, ref),
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              icon: const Icon(CupertinoIcons.checkmark_alt_circle),
              label: const Text('Let\'s feast!'),
            ),
          )
        ],
      ),
    );
  }
}
