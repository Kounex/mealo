import 'dart:convert';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/meal/meal.dart';
import 'package:mealo/stores/views/home.dart';
import 'package:mealo/utils/isar.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/add_edit_meal_sheet.dart';
import 'package:mealo/widgets/base/functional/async_value_builder.dart';
import 'package:mealo/widgets/base/functional/scaffold.dart';
import 'package:mealo/widgets/shared/meal_ratings.dart';

import '../../../models/rating/rating.dart';

class MealDetailsView extends ConsumerWidget {
  final String uuid;

  const MealDetailsView({
    super.key,
    required this.uuid,
  });

  void _deleteMeal(BuildContext context) async {
    await IsarUtils.crud(
      (isar) => isar.meals.deleteByUuid(this.uuid),
    );
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Rating>> asyncRatings = ref.watch(ratingsProvider);
    final AsyncValue<Meal> asyncSelectedMeal =
        ref.watch(selectedMealProvider(this.uuid));

    return BaseAsyncValueBuilder(
        asyncValue: asyncSelectedMeal,
        data: (meal) {
          return BaseScaffold(
            hasBottomTabBarSpacing: true,
            appBarProperties: AppBarProperties(
              title: Text(meal.name),
              actions: [
                IconButton(
                  onPressed: () => ModalUtils.showExpandedModalBottomSheet(
                    context,
                    AddEditMealSheet(
                      meal: meal,
                    ),
                  ),
                  icon: const Icon(FluentIcons.document_edit_24_regular),
                ),
              ],
            ),
            children: [
              // Hero(
              //   tag: meal.uuid ?? 'placeholder',
              //   child: meal.thumbnailBase64 != null
              //       ? Image.memory(base64Decode(this.meal!.thumbnailBase64!))
              //       : Image.asset('assets/images/meal-placeholder.png'),
              // ),
              meal.thumbnailBase64 != null
                  ? Image.memory(base64Decode(meal.thumbnailBase64!))
                  : Image.asset('assets/images/meal-placeholder.png'),
              BaseAsyncValueBuilder(
                asyncValue: asyncRatings,
                data: (ratings) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: MealRatings(
                    ratings: ratings,
                    valueMap: meal.ratings,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: ElevatedButton(
                  onPressed: () => _deleteMeal(context),
                  child: const Text('Remove'),
                ),
              ),
            ],
          );
        });
  }
}
