import '../../models/embeddings/rating_link/rating_link.dart';
import '../../models/ingredient/ingredient.dart';
import '../../models/meal/meal.dart';
import '../../models/tag/tag.dart';

class RandomizeConfig {
  final List<Meal> filteredMeals;
  final List<Tag> includedTags;
  final List<Tag> excludedtags;
  final List<RatingLink> ratings;
  final List<Ingredient> ingredients;
  final int? daysNotEaten;

  RandomizeConfig(
    this.filteredMeals,
    this.includedTags,
    this.excludedtags,
    this.ratings,
    this.ingredients,
    this.daysNotEaten,
  );
}
