import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.freezed.dart';

@freezed
class MealDTO with _$MealDTO {
  const factory MealDTO({
    required String uuid,
    required DateTime createdAt,
    required String name,
    String? thumbnailBase64,
    List<String>? imagesBase64,
  }) = _MealDTO;
}
