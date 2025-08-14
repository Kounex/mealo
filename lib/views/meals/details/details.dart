import 'package:base_components/base_components.dart';
import 'package:beamer/beamer.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/meal/meal.dart';
import '../../../models/rating/rating.dart';
import '../../../stores/views/home.dart';
import '../../../widgets/shared/dialog/confirmation.dart';
import '../../../widgets/shared/image.dart';
import '../../../widgets/shared/meal_ratings.dart';
import '../widgets/add_edit_meal_sheet/add_edit_meal_sheet.dart';

class MealDetailsView extends ConsumerWidget {
  final String uuid;

  const MealDetailsView({
    super.key,
    required this.uuid,
  });

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
                  popOnClose: false,
                  onClose: () {
                    ModalUtils.showBaseDialog(
                      context,
                      Builder(builder: (context) {
                        return MealoBaseConfirmationDialog(
                          title: 'Close Sheet',
                          body:
                              'Are you sure you want to close this sheet? All your changes will not be saved!',
                          isYesDestructive: true,
                          onYes: (_) {
                            /// Important step - this makes sure that all changes we made
                            /// here are set back to its original value
                            Navigator.of(context).pop();
                            ref.invalidate(mealsProvider);
                          },
                        );
                      }),
                    );
                  },
                ).then((value) {
                  if (value != null) {
                    Beamer.of(context).beamBack();
                  }
                }),
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
            meal.thumbnailUuid != null || meal.imagesUuids.isNotEmpty
                ? Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(DesignSystem.spacing.x24),
                    child: MealoBaseImage(
                      imageUuid:
                          meal.thumbnailUuid ?? meal.imagesUuids.firstOrNull,
                      subPath: Meal.subPathForImages,
                      height: 192.0,
                      width: 192.0,
                    ),
                  )
                : Image.asset('assets/images/meal-placeholder.png'),
            BaseAsyncValueBuilder(
              asyncValue: asyncRatings,
              data: (ratings) => Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: DesignSystem.spacing.x24),
                child: MealRatings(
                  ratings: ratings,
                  ratingLinks: meal.ratings,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
