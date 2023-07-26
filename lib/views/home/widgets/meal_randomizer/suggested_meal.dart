import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/meal/meal.dart';
import '../../../../stores/views/home.dart';
import '../../../../utils/router.dart';
import '../../../../widgets/shared/meal_card.dart';

class SuggestedMeal extends ConsumerWidget {
  final Meal meal;

  const SuggestedMeal({
    super.key,
    required this.meal,
  });

  Future<void> feast(BuildContext context, WidgetRef ref) async {
    // PersistanceUtils.crud(
    //   (isar) => isar.meals.put(this.meal..lastTimeAte = DateTime.now()),
    // );
    ref.invalidate(randomizedMealUuidProvider);
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
