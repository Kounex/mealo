import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/widgets/base/functional/async_value_builder.dart';

import '../../../../models/meal/meal.dart';
import '../../../../models/rating/rating.dart';
import '../../../../widgets/shared/meal_ratings.dart';

class RatingStep extends ConsumerStatefulWidget {
  final List<RatingMap> valueMap;

  const RatingStep({
    super.key,
    required this.valueMap,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RatingStepState();
}

class _RatingStepState extends ConsumerState<RatingStep> {
  void _updateRatingMap(List<Rating> ratings) {
    for (var rating in ratings) {
      if (!this.widget.valueMap.any((value) => value.uuid == rating.uuid)) {
        this.widget.valueMap.add(
              RatingMap()
                ..uuid = rating.uuid
                ..value = RatingValue.three,
            );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Rating>> asyncRatings = ref.watch(ratingsProvider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncRatings,
      data: (ratings) {
        _updateRatingMap(ratings);

        return MealRatings(
          ratings: ratings,
          valueMap: this.widget.valueMap,
          onSelectionChanged: (index, ratingValue) => setState(
            () {
              final value = this.widget.valueMap.firstWhereOrNull(
                  (value) => value.uuid == ratings[index].uuid);
              value?.value = ratingValue != value.value ? ratingValue : null;
            },
          ),
        );
      },
    );
  }
}
