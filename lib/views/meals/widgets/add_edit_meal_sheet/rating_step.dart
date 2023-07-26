import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/meal/meal.dart';
import '../../../../models/rating/rating.dart';
import '../../../../widgets/base/functional/async_value_builder.dart';
import '../../../../widgets/base/ui/card.dart';
import '../../../../widgets/shared/meal_ratings.dart';

class RatingStep extends ConsumerStatefulWidget {
  final Meal meal;

  const RatingStep({
    super.key,
    required this.meal,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RatingStepState();
}

class _RatingStepState extends ConsumerState<RatingStep> {
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Rating>> asyncRatings = ref.watch(ratingsProvider);

    return Column(
      children: [
        const BaseCard(
          topPadding: 0,
          bottomPadding: 0,
          leftPadding: 0,
          rightPadding: 0,
          child: Text(
              'Ratings are meant to be positive so that \'5\' is the best outcome while \'1\' is the worst. This will enable to correctly filter and sort meals later on.'),
        ),
        const SizedBox(height: 24.0),
        BaseCard(
          topPadding: 0,
          bottomPadding: 0,
          leftPadding: 0,
          rightPadding: 0,
          paddingChild: const EdgeInsets.only(
            top: 18,
            left: 18,
            right: 18,
            bottom: 0.0,
          ),
          child: BaseAsyncValueBuilder(
            asyncValue: asyncRatings,
            data: (ratings) => MealRatings(
              ratings: ratings,
              ratingLinks: this.widget.meal.ratings,
              onSelectionChanged: (index, ratingValue) => setState(
                  () => this.widget.meal.ratings[index].value = ratingValue),
            ),
          ),
        ),

        /// Initially planned to be able to add new ratings here as well but
        /// ratings apply to all meals - all existing meals will need this
        /// new rating to be added without a value and the user *needs* to
        /// update all -> big impact. Should not be done that easily
        // const SizedBox(height: 24.0),
        // SizedBox(
        //   width: double.infinity,
        //   child: ElevatedButton(
        //     onPressed: () => ModalUtils.showBaseDialog(
        //       context,
        //       const AddEditRatingDialog(),
        //     ),
        //     child: const Text('Add rating'),
        //   ),
        // ),
      ],
    );
  }
}
