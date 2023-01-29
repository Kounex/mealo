import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:mealo/models/meal.dart';

class MealRatings extends StatelessWidget {
  final List<Rating> ratings;
  final void Function(int index, Set<RatingValue?> ratingValue)?
      onSelectionChanged;

  const MealRatings({
    super.key,
    required this.ratings,
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
                          child: Divider(
                            thickness: 0,
                          ),
                        ),
                        Flexible(
                          child: Text(
                            this.ratings[index].description ?? '',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                        ),
                        const Expanded(
                          child: Divider(
                            thickness: 0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    SegmentedButton<RatingValue?>(
                      emptySelectionAllowed: true,
                      showSelectedIcon: false,
                      segments: RatingValue.values
                          .map(
                            (ratingValue) => ButtonSegment(
                              value: ratingValue,
                              label: Text(
                                ratingValue.number.toString(),
                              ),
                            ),
                          )
                          .toList(),
                      selected: {this.ratings[index].value},
                      onSelectionChanged: this.onSelectionChanged != null
                          ? (value) => this.onSelectionChanged!(index, value)
                          : (_) {},
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
