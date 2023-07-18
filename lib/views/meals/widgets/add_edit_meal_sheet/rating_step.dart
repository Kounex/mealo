import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/meal/meal.dart';
import '../../../../models/rating/rating.dart';
import '../../../../utils/modal.dart';
import '../../../../widgets/base/functional/async_value_builder.dart';
import '../../../../widgets/base/ui/card.dart';
import '../../../../widgets/shared/dialog/add_edit_rating.dart';
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
  void _updateRatingMap(List<Rating> ratings) {
    for (var rating in ratings) {
      if (!this.widget.meal.ratings.any((value) => value.uuid == rating.uuid)) {
        this.widget.meal.ratings = [
          ...this.widget.meal.ratings,
          RatingMap()
            ..uuid = rating.uuid
            ..value = RatingValue.three,
        ];
      }
    }
  }

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
              'Ratings should always be phrased positively so that \'5\' is the best outcome while \'1\' is the worst. This will enable to correctly filter / sort meals later on.'),
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
            data: (ratings) {
              _updateRatingMap(ratings);

              return MealRatings(
                ratings: ratings,
                valueMap: this.widget.meal.ratings,
                onSelectionChanged: (index, ratingValue) => setState(
                  () {
                    final value = this.widget.meal.ratings.firstWhereOrNull(
                        (value) => value.uuid == ratings[index].uuid);
                    value?.value =
                        ratingValue != value.value ? ratingValue : null;
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24.0),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => ModalUtils.showBaseDialog(
              context,
              const AddEditRatingDialog(),
            ),
            child: const Text('Add rating'),
          ),
        ),
      ],
    );
  }
}
