import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/stores/views/home.dart';
import 'package:mealo/utils/isar.dart';

import '../../../../models/meal/meal.dart';
import '../../../../utils/router.dart';
import '../../../../widgets/custom/meal_card.dart';

class SuggestedMeal extends ConsumerWidget {
  final Meal meal;

  const SuggestedMeal({
    super.key,
    required this.meal,
  });

  Future<void> feast(BuildContext context, WidgetRef ref) async {
    await IsarUtils.crud(
      (isar) => isar.meals.putByUuid(this.meal..lastTimeAte = DateTime.now()),
    );
    ref.invalidate(randomizedMealProvider);
    if (context.mounted) {
      RouterUtils.goTo(
        context,
        HomeMealDetailRoute(meal.uuid),
        data: meal,
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
            onTap: () => RouterUtils.goTo(
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
