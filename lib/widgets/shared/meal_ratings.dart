import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/meal/meal.dart';
import '../../models/rating/rating.dart';
import '../base/ui/divider.dart';

class MealRatings extends StatelessWidget {
  final List<Rating> ratings;
  final List<RatingLink> ratingLinks;
  final void Function(int index, RatingValue ratingValue)? onSelectionChanged;

  const MealRatings({
    super.key,
    required this.ratings,
    required this.ratingLinks,
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
                        const Expanded(
                          child: BaseDivider(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
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
                                ? this.onSelectionChanged!(index, value!)
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
                    const SizedBox(height: 24.0),
                  ],
                ),
              ),
            )
            .toList(),
      ],
    );
  }
}
