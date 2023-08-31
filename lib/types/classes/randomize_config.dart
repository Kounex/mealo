import 'package:mealo/models/embeddings/rating_link/rating_link.dart';
import 'package:mealo/models/ingredient/ingredient.dart';
import 'package:mealo/models/meal/meal.dart';
import 'package:mealo/models/tag/tag.dart';

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
