import 'package:base_components/base_components.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../models/embeddings/rating_link/rating_link.dart';
import '../../../../models/ingredient/ingredient.dart';
import '../../../../models/rating/rating.dart';
import '../../../../models/tag/tag.dart';
import '../../../../widgets/dialog/confirmation.dart';
import 'days_dropdown.dart';
import 'ingredients_block.dart';
import 'meal_randomizer/meal_randomizer.dart';
import 'ratings_block.dart';
import 'tags_block.dart';

class RandomizeMealView extends ConsumerStatefulWidget {
  final ScrollController controller;

  const RandomizeMealView({
    super.key,
    required this.controller,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RandomizeMealViewState();
}

class _RandomizeMealViewState extends ConsumerState<RandomizeMealView> {
  final ScrollController _scroll = ScrollController();
  bool _shadowForFilters = false;

  final List<Tag> _includedTags = [];
  final List<Tag> _excludedTags = [];
  final List<Ingredient> _includedIngredients = [];
  final List<Ingredient> _excludedIngredients = [];
  final List<RatingLink> _selectedRatings = [];

  final TextEditingController _controller = TextEditingController();
  final List<int> _daysNotEaten = [7, 30, 60, 180];

  int? _selectedDay;

  @override
  void initState() {
    super.initState();

    _scroll.addListener(() {
      if (!_shadowForFilters && _scroll.offset >= 24) {
        setState(() => _shadowForFilters = true);
      } else if (_shadowForFilters && _scroll.offset < 24) {
        setState(() => _shadowForFilters = false);
      }
    });
  }

  bool _areFiltersActive() {
    return _includedTags.isNotEmpty ||
        _excludedTags.isNotEmpty ||
        _includedIngredients.isNotEmpty ||
        _excludedIngredients.isNotEmpty ||
        _selectedRatings.isNotEmpty ||
        _controller.text.isNotEmpty;
  }

  void _setFiltersDefault() {
    setState(() {
      _includedTags.clear();
      _excludedTags.clear();
      _includedIngredients.clear();
      _excludedIngredients.clear();
      _selectedRatings.clear();
      _selectedDay = null;
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final asyncTags = ref.watch(tagsProvider);
    final asyncRatings = ref.watch(ratingsProvider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncTags,
      data: (tags) {
        return BaseAsyncValueBuilder(
          asyncValue: asyncRatings,
          data: (ratings) {
            return BaseScaffold(
              appBarProperties: AppBarProperties(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Randomize Next Meal'),
                    Text(
                      'Filter to your liking and let the app decide!',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              hasBottomTabBarSpacing: true,
              children: [
                // Padding(
                //   padding: const EdgeInsets.all(24.0),
                //   child: SizedBox(
                //     width: double.infinity,
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           'Randomize Next Meal',
                //           style: Theme.of(context).textTheme.headlineMedium,
                //         ),
                //         Text(
                //           'Filter to your liking and let the app decide!',
                //           style: Theme.of(context).textTheme.bodySmall,
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: DesignSystem.spacing.x12),
                MealRandomizer(
                  includedTags: _includedTags,
                  excludedTags: _excludedTags,
                  includedIngredients: _includedIngredients,
                  excludedIngredients: _excludedIngredients,
                  selectedRatings: _selectedRatings,
                  daysNotEaten: _selectedDay,
                ),
                BaseCard(
                  topPadding: DesignSystem.spacing.x12,
                  title: 'Filters',
                  expandable: true,
                  trailingTitleWidget: Row(
                    children: [
                      BaseTextButton(
                        onPressed: _areFiltersActive()
                            ? () => ModalUtils.showBaseDialog(
                                  context,
                                  ConfirmationDialog(
                                    onYes: () => _setFiltersDefault(),
                                    title: 'Reset Filters',
                                    text:
                                        'Are you sure you want to reset the filters? This action can\'t be undone!',
                                    isYesDestructive: true,
                                  ),
                                )
                            : null,
                        isDestructive: true,
                        child: const Text('Reset'),
                      ),
                      SizedBox(width: DesignSystem.spacing.x8),
                      OnOffIndicator(
                        on: _areFiltersActive(),
                      ),
                      SizedBox(width: DesignSystem.spacing.x18),
                    ],
                  ),
                  child: Column(
                    children: [
                      TagsBlock(
                        tags: [...tags]
                          ..removeWhere((tag) => _excludedTags.contains(tag)),
                        selectedTags: _includedTags,
                        title: 'Which tags should be included?',
                        onAdd: (tag) => setState(() => _includedTags.add(tag)),
                        onRemove: (tag) =>
                            setState(() => _includedTags.remove(tag)),
                      ),
                      SizedBox(height: DesignSystem.spacing.x24),
                      TagsBlock(
                        tags: [...tags]
                          ..removeWhere((tag) => _includedTags.contains(tag)),
                        selectedTags: _excludedTags,
                        title: 'Which tags should NOT be included?',
                        onAdd: (tag) => setState(() => _excludedTags.add(tag)),
                        onRemove: (tag) =>
                            setState(() => _excludedTags.remove(tag)),
                      ),
                      SizedBox(height: DesignSystem.spacing.x24),
                      IngredientsBlock(
                        selectedIngredients: _includedIngredients,
                        text:
                            'Which ingredients would you like to have in the meal?',
                        onAdd: (ingredient) => setState(
                            () => _includedIngredients.add(ingredient)),
                        onRemove: (ingredient) => setState(
                            () => _includedIngredients.remove(ingredient)),
                      ),
                      SizedBox(height: DesignSystem.spacing.x24),
                      IngredientsBlock(
                        selectedIngredients: _excludedIngredients,
                        text: 'Which ingredients should NOT be in the meal?',
                        onAdd: (ingredient) => setState(
                            () => _excludedIngredients.add(ingredient)),
                        onRemove: (ingredient) => setState(
                            () => _excludedIngredients.remove(ingredient)),
                      ),
                      SizedBox(height: DesignSystem.spacing.x24),
                      RatingsBlock(
                        selectedRatings: _selectedRatings,
                        onAdd: (rating) => setState(
                          () => _selectedRatings.add(
                            RatingLink()
                              ..ratingUuid = rating.uuid
                              ..value = RatingValue.three,
                          ),
                        ),
                        onRemove: (rating) => setState(() =>
                            _selectedRatings.removeWhere((ratingLink) =>
                                ratingLink.ratingUuid == rating.uuid)),
                        onValueChanged: (rating, ratingValue) => setState(() =>
                            _selectedRatings
                                .firstWhereOrNull((ratingLink) =>
                                    ratingLink.ratingUuid == rating.uuid)
                                ?.value = ratingValue),
                      ),
                      SizedBox(height: DesignSystem.spacing.x24),
                      DaysDropdown(
                        controller: _controller,
                        daysNotEaten: _daysNotEaten,
                        onSelected: (day) => setState(() => _selectedDay = day),
                        onClear: () => setState(() => _controller.clear()),
                      ),
                    ],
                  ),
                ),
                // Stack(
                //   alignment: Alignment.topCenter,
                //   children: [
                //     Column(
                //       // ListView(
                //       //   controller: _scroll,
                //       //   physics: const AlwaysScrollableScrollPhysics(),
                //       children: [

                //       ],
                //     ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
                //   child: ClipRRect(
                //     child: Transform.translate(
                //       offset: const Offset(0, -32),
                //       child: AnimatedContainer(
                //         duration:
                //             DesignSystem.animation.defaultDurationMS250,
                //         width: double.infinity,
                //         height: 24,
                //         alignment: Alignment.topCenter,
                //         decoration: BoxDecoration(
                //           boxShadow: _shadowForFilters
                //               ? kElevationToShadow[12]
                //               : null,
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                //   ],
                // ),
              ],
            );
          },
        );
      },
    );
  }
}
