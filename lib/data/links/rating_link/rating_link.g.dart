// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RatingLink _$RatingLinkFromJson(Map<String, dynamic> json) => _RatingLink(
  ratingUuid: json['ratingUuid'] as String,
  value:
      $enumDecodeNullable(_$RatingValueEnumMap, json['value']) ??
      RatingValue.three,
);

Map<String, dynamic> _$RatingLinkToJson(_RatingLink instance) =>
    <String, dynamic>{
      'ratingUuid': instance.ratingUuid,
      'value': _$RatingValueEnumMap[instance.value]!,
    };

const _$RatingValueEnumMap = {
  RatingValue.one: 1,
  RatingValue.two: 2,
  RatingValue.three: 3,
  RatingValue.four: 4,
  RatingValue.five: 5,
};
