import '../../models/embeddings/rating_link/rating_link.dart';
import '../../models/ingredient/ingredient.dart';
import '../../models/meal/meal.dart';
import '../../models/tag/tag.dart';

class RandomizeConfig {
  final List<Meal> filteredMeals;
  final List<Tag> includedTags;
  final List<Tag> excludedTags;
  final List<Ingredient> includedIngredients;
  final List<Ingredient> excludedIngredients;
  final List<RatingLink> ratings;
  final int? daysNotEaten;

  RandomizeConfig(
    this.filteredMeals,
    this.includedTags,
    this.excludedTags,
    this.includedIngredients,
    this.excludedIngredients,
    this.ratings,
    this.daysNotEaten,
  );
}
