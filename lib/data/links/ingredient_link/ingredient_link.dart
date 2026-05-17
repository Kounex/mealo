import 'package:freezed_annotation/freezed_annotation.dart';

part 'ingredient_link.freezed.dart';
part 'ingredient_link.g.dart';

/// Pivot data linking a [Meal] to an [Ingredient] with amount and unit.
@freezed
abstract class IngredientLink with _$IngredientLink {
  const factory IngredientLink({
    required String ingredientUuid,
    String? unitUuid,
    double? amount,
  }) = _IngredientLink;

  factory IngredientLink.fromJson(Map<String, Object?> json) =>
      _$IngredientLinkFromJson(json);
}
