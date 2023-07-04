import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/rating/rating.dart';
import 'package:mealo/widgets/base/ui/chip.dart';
import 'package:mealo/widgets/shared/dialog/add_edit_rating.dart';

import '../../../../utils/modal.dart';
import '../../../../widgets/base/functional/async_value_builder.dart';
import '../../../../widgets/base/ui/card.dart';

class RatingsOverview extends ConsumerWidget {
  const RatingsOverview({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Rating>> asyncRatings = ref.watch(ratingsProvider);

    return BaseCard(
      constrained: false,
      child: BaseAsyncValueBuilder(
        asyncValue: asyncRatings,
        skipLoadingOnReload: true,
        data: (ratings) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            spacing: 12.0,
            children: [
              ...ratings.map(
                (rating) => GestureDetector(
                  child: BaseChip(
                    label: Text(rating.name),
                  ),
                  onTap: () => ModalUtils.showBaseDialog(
                    context,
                    AddEditRatingDialog(
                      rating: rating,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
