import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/widgets/base/functional/async_value_builder.dart';

import '../../../../models/meal/meal.dart';
import '../../../../models/rating/rating.dart';
import '../../../../models/tag/tag.dart';
import '../../../../utils/isar.dart';
import '../../../../widgets/shared/meal_ratings.dart';

class AddMealSheet extends ConsumerStatefulWidget {
  const AddMealSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddMealSheetState();
}

class _AddMealSheetState extends ConsumerState<AddMealSheet> {
  final GlobalKey<FormState> _form = GlobalKey();

  final _name = TextEditingController();

  final List<RatingValueMap> _valueMap = [];

  void _updateValueMap(List<Rating> ratings) {
    for (var rating in ratings) {
      if (!_valueMap.any((value) => value.uuid == rating.uuid)) {
        _valueMap.add(
          RatingValueMap()
            ..uuid = rating.uuid
            ..value = RatingValue.three,
        );
      }
    }
  }

  String? _validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      return 'Name is required';
    }
    if (name.trim().length < 3) {
      return 'Too short';
    }
    return null;
  }

  void _saveMeal(List<Rating> ratings) async {
    await IsarUtils.crud(
      (isar) {
        return isar.meals.put(
          Meal()
            ..name = _name.text.trim()
            ..ratings = _valueMap,
        );
      },
    );
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Rating>> asyncRatings = ref.watch(ratingsProvider);
    final AsyncValue<List<Tag>> asyncTags = ref.watch(tagsProvider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncRatings,
      data: (ratings) =>
          asyncTags.whenOrNull(
            data: (tags) {
              _updateValueMap(ratings);

              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'New Meal',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        IconButton(
                          icon: const Icon(CupertinoIcons.clear),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Form(
                        key: _form,
                        child: ListView(
                          children: [
                            const SizedBox(height: 24.0),
                            TextFormField(
                              controller: _name,
                              validator: _validateName,
                              decoration: const InputDecoration(
                                hintText: 'Name',
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            MealRatings(
                              ratings: ratings,
                              valueMap: _valueMap,
                              onSelectionChanged: (index, ratingValue) =>
                                  setState(
                                () {
                                  final value = _valueMap.firstWhereOrNull(
                                      (value) =>
                                          value.uuid == ratings[index].uuid);
                                  value?.value = ratingValue != value.value
                                      ? ratingValue
                                      : null;
                                },
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            ElevatedButton(
                              onPressed: () {
                                if (_form.currentState!.validate()) {
                                  _saveMeal(ratings);
                                }
                              },
                              child: const Text('Save'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ) ??
          const SizedBox(),
    );
  }
}
