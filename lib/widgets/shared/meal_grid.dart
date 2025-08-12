import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import '../../../models/meal/meal.dart';
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
                  mainAxisSpacing: DesignSystem.spacing.x24,
                  crossAxisSpacing: DesignSystem.spacing.x24,
                ),
                itemCount: meals.length,
                itemBuilder: (context, index) =>
                    AnimationConfiguration.staggeredGrid(
                  position: index,
                  duration: DesignSystem.animation.defaultDurationMS250,
                  columnCount: columnCount,
                  child: FadeInAnimation(
                    child: MealCard(
                      meal: meals[index],
                      height: this.itemCrossAxisExtent * 3 / 4,
                      width: this.itemCrossAxisExtent,
                      onTap: () => this.onTap?.call(meals[index]),
                    ),
                  ),
                ),
              ),
            )
          : this.empty ??
              Padding(
                padding: EdgeInsets.only(top: DesignSystem.spacing.x4),
                child: const BasePlaceholder(
                    text:
                        'It\'s quite empty in here.\nLet\'s start by adding some meals!'),
              ),
    );
  }
}
