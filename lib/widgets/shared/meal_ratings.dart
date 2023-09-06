import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/embeddings/rating_link/rating_link.dart';
import '../../models/rating/rating.dart';
import '../../utils/design_system.dart';
import '../base/ui/divider.dart';

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
        ...this
            .ratings
            .mapIndexed(
              (index, rating) => SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          child: BaseDivider(),
                        ),
                        Flexible(
                          child: Text(
                            this.ratings[index].name,
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
                    SizedBox(height: DesignSystem.spacing.x8),
                    SizedBox(
                      width: double.infinity,
                      child: CupertinoSlidingSegmentedControl<RatingValue?>(
                        groupValue: this
                            .ratingLinks
                            .firstWhereOrNull((value) =>
                                value.ratingUuid == this.ratings[index].uuid)!
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
            )
            .toList(),
      ],
    );
  }
}
