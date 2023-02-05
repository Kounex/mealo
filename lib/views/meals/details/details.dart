import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/meal/meal.dart';
import 'package:mealo/stores/shared/ratings/ratings.dart';
import 'package:mealo/utils/isar.dart';
import 'package:mealo/widgets/custom/meal_ratings.dart';
import 'package:mealo/widgets/base/scaffold.dart';

import '../../../models/rating/rating.dart';

class MealDetailsView extends ConsumerWidget {
  final Meal? meal;

  const MealDetailsView({
    super.key,
    this.meal,
  });

  void _deleteMeal(BuildContext context) async {
    await IsarUtils.crud(
      (isar) => isar.meals.deleteByUuid(this.meal!.uuid),
      // schemas: [MealSchema],
    );
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Rating>> asyncRatings = ref.watch(ratingsProvider);

    return BaseScaffold(
      hasBottomTabBarSpacing: true,
      appBarProperties: AppBarProperties(
        title: Text(this.meal?.name ?? 'Unnamed'),
      ),
      children: [
        Hero(
          tag: this.meal?.uuid ?? 'placeholder',
          child: this.meal?.thumbnailBase64 != null
              ? Image.memory(base64Decode(this.meal!.thumbnailBase64!))
              : Image.asset('assets/images/meal-placeholder.png'),
        ),
        asyncRatings.when(
          loading: () => const CircularProgressIndicator(),
          error: (error, stackTrace) => Text(error.toString()),
          data: (ratings) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: MealRatings(
              ratings: ratings,
              valueMap: this.meal!.ratings,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ElevatedButton(
            onPressed: () => _deleteMeal(context),
            child: const Text('Remove'),
          ),
        ),
      ],
    );
  }
}
