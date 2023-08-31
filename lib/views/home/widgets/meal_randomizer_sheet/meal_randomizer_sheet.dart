import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/embeddings/rating_link/rating_link.dart';
import 'package:mealo/models/ingredient/ingredient.dart';
import 'package:mealo/models/rating/rating.dart';
import 'package:mealo/models/tag/tag.dart';
import 'package:mealo/utils/design_system.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/views/home/widgets/meal_randomizer_sheet/days_dropdown.dart';
import 'package:mealo/views/home/widgets/meal_randomizer_sheet/ingredients_block.dart';
import 'package:mealo/views/home/widgets/meal_randomizer_sheet/ratings_block.dart';
import 'package:mealo/views/home/widgets/meal_randomizer_sheet/tags_block.dart';
import 'package:mealo/widgets/base/functional/async_value_builder.dart';
import 'package:mealo/widgets/base/ui/card.dart';
import 'package:mealo/widgets/base/ui/on_off_indicator.dart';
import 'package:mealo/widgets/base/ui/text_button.dart';
import 'package:mealo/widgets/dialog/confirmation.dart';

class MealRandomizerSheet extends ConsumerStatefulWidget {
  const MealRandomizerSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MealRandomizerSheetState();
}

class _MealRandomizerSheetState extends ConsumerState<MealRandomizerSheet> {
  final bool _filtersExpanded = false;

  final List<Tag> _includedTags = [];
  final List<Tag> _excludedTags = [];
  final List<Ingredient> _selectedIngredients = [];
  final List<RatingLink> _selectedRatings = [];

  final TextEditingController _controller = TextEditingController();
  final List<int?> _daysNotEaten = [7, 30, 60, 180, null];

  int? _selectedDay;

  bool _areFiltersActive() {
    return _includedTags.isNotEmpty ||
        _excludedTags.isNotEmpty ||
        _controller.text.isNotEmpty ||
        _selectedRatings.isNotEmpty ||
        _selectedIngredients.isNotEmpty;
  }

  void _setFiltersDefault() {
    setState(() {
      _includedTags.clear();
      _excludedTags.clear();
      _controller.clear();
      _selectedRatings.clear();
      _selectedIngredients.clear();
      _selectedDay = null;
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
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Randomize Next Meal',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          'Filter to your liking and let the app decide!',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      BaseCard(
                        topPadding: 0,
                        title: 'Filters',
                        expandable: true,
                        expanded: _filtersExpanded,
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
                              tags: [...tags]..removeWhere(
                                  (tag) => _excludedTags.contains(tag)),
                              selectedTags: _includedTags,
                              title: 'Which tags should be included?',
                              onAdd: (tag) =>
                                  setState(() => _includedTags.add(tag)),
                              onRemove: (tag) =>
                                  setState(() => _includedTags.remove(tag)),
                            ),
                            SizedBox(height: DesignSystem.spacing.x24),
                            TagsBlock(
                              tags: [...tags]..removeWhere(
                                  (tag) => _includedTags.contains(tag)),
                              selectedTags: _excludedTags,
                              title: 'Which tags should NOT be included?',
                              onAdd: (tag) =>
                                  setState(() => _excludedTags.add(tag)),
                              onRemove: (tag) =>
                                  setState(() => _excludedTags.remove(tag)),
                            ),
                            SizedBox(height: DesignSystem.spacing.x24),
                            IngredientsBlock(
                              selectedIngredients: _selectedIngredients,
                              title:
                                  'Which ingredients would you like to have in the meal?',
                              onAdd: (ingredient) => setState(
                                  () => _selectedIngredients.add(ingredient)),
                              onRemove: (ingredient) => setState(() =>
                                  _selectedIngredients.remove(ingredient)),
                            ),
                            SizedBox(height: DesignSystem.spacing.x24),
                            Text(
                              'Which ratings should be considered for the meal selection? (including which value it should have at least)',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            RatingsBlock(
                              selectedRatings: _selectedRatings,
                              onAdd: (rating) => setState(
                                () => _selectedRatings.add(
                                  RatingLink()
                                    ..ratingUuid = rating.uuid
                                    ..value = RatingValue.three,
                                ),
                              ),
                              onRemove: (ratingLink) => setState(
                                  () => _selectedRatings.remove(ratingLink)),
                              onValueChanged: (index, ratingValue) => setState(
                                  () => _selectedRatings[index].value =
                                      ratingValue),
                            ),
                            SizedBox(height: DesignSystem.spacing.x24),
                            Text(
                              'How long should it at least be since you last ate the meal we\'ll select?',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            SizedBox(height: DesignSystem.spacing.x12),
                            DaysDropdown(
                              controller: _controller,
                              daysNotEaten: _daysNotEaten,
                              onSelected: (day) =>
                                  setState(() => _selectedDay = day),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
