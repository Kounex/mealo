import 'package:base_components/base_components.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/embeddings/rating_link/rating_link.dart';
import '../../models/rating/rating.dart';

class MealRatings extends StatelessWidget {
  final List<Rating> ratings;
  final List<RatingLink> ratingLinks;
  final void Function(Rating rating, RatingValue ratingValue)?
      onSelectionChanged;
  final void Function(Rating rating)? onRemove;

  const MealRatings({
    super.key,
    required this.ratings,
    required this.ratingLinks,
    this.onRemove,
    this.onSelectionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...this.ratings.mapIndexed(
              (index, rating) => SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: BaseDivider(),
                        ),
                        Flexible(
                          child: Text(
                            rating.name,
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              const Expanded(
                                child: BaseDivider(),
                              ),
                              if (this.onRemove case final onRemove?) ...[
                                SizedBox(width: DesignSystem.spacing.x8),
                                IconButton(
                                  onPressed: () => onRemove(rating),
                                  icon: const Icon(CupertinoIcons.clear),
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (rating.description != null &&
                        rating.description!.trim().isNotEmpty) ...[
                      SizedBox(height: DesignSystem.spacing.x4),
                      Text(
                        rating.description!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                    SizedBox(height: DesignSystem.spacing.x12),
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoSlidingSegmentedControl<RatingValue>(
                        groupValue: this
                            .ratingLinks
                            .firstWhereOrNull(
                                (value) => value.ratingUuid == rating.uuid)!
                            .value,
                        padding: const EdgeInsets.all(0),
                        children: {}..addEntries(
                            RatingValue.values
                                .map(
                                  (ratingValue) => MapEntry(
                                    ratingValue,
                                    Text(
                                      ratingValue.number.toString(),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        onValueChanged: (value) =>
                            this.onSelectionChanged != null
                                ? this.onSelectionChanged!(rating, value!)
                                : {},
                      ),
                      // SegmentedButton<RatingValue?>(
                      //   emptySelectionAllowed: true,
                      //   showSelectedIcon: false,
                      //   segments: RatingValue.values
                      //       .map(
                      //         (ratingValue) => ButtonSegment(
                      //           value: ratingValue,
                      //           label: Text(
                      //             ratingValue.number.toString(),
                      //           ),
                      //         ),
                      //       )
                      //       .toList(),
                      //   selected: {
                      //     this
                      //         .valueMap
                      //         .firstWhereOrNull((value) =>
                      //             value.uuid == this.ratings[index].uuid)!
                      //         .value
                      //   },
                      //   onSelectionChanged: this.onSelectionChanged != null
                      //       ? (value) => this.onSelectionChanged!(index, value)
                      //       : (_) {},
                      // ),
                    ),
                    SizedBox(height: DesignSystem.spacing.x24),
                  ],
                ),
              ),
            ),
      ],
    );
  }
}
