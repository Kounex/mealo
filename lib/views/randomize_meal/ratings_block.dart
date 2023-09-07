import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/embeddings/rating_link/rating_link.dart';
import '../../../../models/rating/rating.dart';
import '../../../../utils/design_system.dart';
import '../../../../widgets/base/functional/async_value_builder.dart';
import '../../../../widgets/base/functional/suggestion_text_field/suggestion_text_field.dart';
import '../../../../widgets/shared/meal_ratings.dart';

class RatingsBlock extends ConsumerWidget {
  final List<RatingLink> selectedRatings;

  final void Function(Rating rating) onAdd;
  final void Function(Rating rating) onRemove;

  final void Function(Rating rating, RatingValue ratingValue) onValueChanged;

  const RatingsBlock({
    super.key,
    required this.selectedRatings,
    required this.onAdd,
    required this.onRemove,
    required this.onValueChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncRatings = ref.watch(ratingsProvider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncRatings,
      data: (ratings) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Which ratings should be considered for the meal selection? (including which value it should have at least)',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(height: DesignSystem.spacing.x12),
            BaseSuggestionTextField<Rating>(
              suggestions: (text) => ratings
                  .where((rating) =>
                      !this.selectedRatings.any((ratingLink) =>
                          ratingLink.ratingUuid == rating.uuid) &&
                      rating.name.toLowerCase().contains(text.toLowerCase()))
                  .toList(),
              hintText: 'Search for ratings...',
              suggestionText: (rating) => rating.name,
              sort: (rating1, rating2) => rating1.name
                  .toLowerCase()
                  .compareTo(rating2.name.toLowerCase()),
              onSuggestionTapped: this.onAdd,
            ),
            SizedBox(height: DesignSystem.spacing.x12),
            MealRatings(
              onSelectionChanged: this.onValueChanged,
              ratings: ratings
                  .where((rating) => this.selectedRatings.any(
                      (ratingLink) => ratingLink.ratingUuid == rating.uuid))
                  .toList(),
              ratingLinks: this.selectedRatings,
              onRemove: this.onRemove,
            ),
            // Wrap(
            //   direction: Axis.horizontal,
            //   spacing: DesignSystem.spacing.x8,
            //   children: this.selectedRatings.map(
            //     (ratingLink) {
            //       Rating rating = ratings.firstWhere(
            //           (rating) => rating.uuid == ratingLink.ratingUuid);

            //       return BaseChip(
            //         text: rating.name,
            //         onDeleted: () => this.onRemove(ratingLink),
            //       );
            //     },
            //   ).toList(),
            // ),
          ],
        );
      },
    );
  }
}
