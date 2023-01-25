import 'package:crimson/crimson.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meal.freezed.dart';
part 'meal.g.dart';

@freezed
class Meal with _$Meal {
  @jsonSnakeCase
  const factory Meal({
    required DateTime createdAt,
    required String name,
    String? thumbnailBase64,
    List<String>? imagesBase64,
  }) = _Meal;
}
