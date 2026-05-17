// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_IngredientLink _$IngredientLinkFromJson(Map<String, dynamic> json) =>
    _IngredientLink(
      ingredientUuid: json['ingredientUuid'] as String,
      unitUuid: json['unitUuid'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$IngredientLinkToJson(_IngredientLink instance) =>
    <String, dynamic>{
      'ingredientUuid': instance.ingredientUuid,
      'unitUuid': instance.unitUuid,
      'amount': instance.amount,
    };
