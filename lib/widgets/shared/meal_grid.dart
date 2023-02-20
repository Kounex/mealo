import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:mealo/utils/styling.dart';

import '../../../models/meal/meal.dart';
import '../base/functional/async_value_builder.dart';
import 'meal_card.dart';

class MealGrid extends ConsumerWidget {
  final ProviderListenable<AsyncValue<List<Meal>>> provider;
  final double itemCrossAxisExtent;

  final Widget? empty;

  final bool skipLoadingOnReload;

  final void Function(Meal meal)? onTap;

  const MealGrid({
    super.key,
    required this.provider,
    this.itemCrossAxisExtent = 200.0,
    this.empty,
    this.skipLoadingOnReload = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Meal>> asyncMeals = ref.watch(this.provider);

    final int columnCount =
        MediaQuery.of(context).size.width ~/ this.itemCrossAxisExtent;

    return BaseAsyncValueBuilder(
      asyncValue: asyncMeals,
      skipLoadingOnReload: this.skipLoadingOnReload,
      data: (meals) => meals.isNotEmpty
          ? AnimationLimiter(
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: this.itemCrossAxisExtent,
                  mainAxisExtent: this.itemCrossAxisExtent * 3 / 4,
                  mainAxisSpacing: 24.0,
                  crossAxisSpacing: 24.0,
                ),
                itemCount: meals.length,
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: StylingUtils.kBaseAnimationDuration,
                  columnCount: columnCount,
                  child: FadeInAnimation(
                    child: MealCard(
                      meal: meals[index],
                      height: this.itemCrossAxisExtent * 3 / 4,
                      onTap: () => this.onTap?.call(meals[index]),
                    ),
                  ),
                ),
              ),
            )
          : this.empty ?? const Text('No meals yet! ò.ó'),
    );
  }
}
