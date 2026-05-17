import 'package:freezed_annotation/freezed_annotation.dart';

part 'rating_link.freezed.dart';
part 'rating_link.g.dart';

/// Pivot data linking a [Meal] to a [Rating] with a specific value.
@freezed
abstract class RatingLink with _$RatingLink {
  const factory RatingLink({
    required String ratingUuid,
    @Default(RatingValue.three) RatingValue value,
  }) = _RatingLink;

  factory RatingLink.fromJson(Map<String, Object?> json) =>
      _$RatingLinkFromJson(json);
}

@JsonEnum(valueField: 'number')
enum RatingValue {
  one(1),
  two(2),
  three(3),
  four(4),
  five(5);

  const RatingValue(this.number);
  final int number;
}
