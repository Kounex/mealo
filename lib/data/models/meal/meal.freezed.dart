// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Meal {

// BaseModel fields
 String? get uuid; DateTime? get created; DateTime? get updated;// CommonModel fields
 String get name;// Meal-specific fields
 String? get instructions; String? get thumbnailUuid; List<String> get imagesUuids;// Relationships — stored as nested JSON
 List<RatingLink> get ratings; List<String> get tagUuids; List<IngredientLink> get ingredients;
/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealCopyWith<Meal> get copyWith => _$MealCopyWithImpl<Meal>(this as Meal, _$identity);

  /// Serializes this Meal to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Meal&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.name, name) || other.name == name)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.thumbnailUuid, thumbnailUuid) || other.thumbnailUuid == thumbnailUuid)&&const DeepCollectionEquality().equals(other.imagesUuids, imagesUuids)&&const DeepCollectionEquality().equals(other.ratings, ratings)&&const DeepCollectionEquality().equals(other.tagUuids, tagUuids)&&const DeepCollectionEquality().equals(other.ingredients, ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,created,updated,name,instructions,thumbnailUuid,const DeepCollectionEquality().hash(imagesUuids),const DeepCollectionEquality().hash(ratings),const DeepCollectionEquality().hash(tagUuids),const DeepCollectionEquality().hash(ingredients));

@override
String toString() {
  return 'Meal(uuid: $uuid, created: $created, updated: $updated, name: $name, instructions: $instructions, thumbnailUuid: $thumbnailUuid, imagesUuids: $imagesUuids, ratings: $ratings, tagUuids: $tagUuids, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class $MealCopyWith<$Res>  {
  factory $MealCopyWith(Meal value, $Res Function(Meal) _then) = _$MealCopyWithImpl;
@useResult
$Res call({
 String? uuid, DateTime? created, DateTime? updated, String name, String? instructions, String? thumbnailUuid, List<String> imagesUuids, List<RatingLink> ratings, List<String> tagUuids, List<IngredientLink> ingredients
});




}
/// @nodoc
class _$MealCopyWithImpl<$Res>
    implements $MealCopyWith<$Res> {
  _$MealCopyWithImpl(this._self, this._then);

  final Meal _self;
  final $Res Function(Meal) _then;

/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = freezed,Object? created = freezed,Object? updated = freezed,Object? name = null,Object? instructions = freezed,Object? thumbnailUuid = freezed,Object? imagesUuids = null,Object? ratings = null,Object? tagUuids = null,Object? ingredients = null,}) {
  return _then(_self.copyWith(
uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUuid: freezed == thumbnailUuid ? _self.thumbnailUuid : thumbnailUuid // ignore: cast_nullable_to_non_nullable
as String?,imagesUuids: null == imagesUuids ? _self.imagesUuids : imagesUuids // ignore: cast_nullable_to_non_nullable
as List<String>,ratings: null == ratings ? _self.ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<RatingLink>,tagUuids: null == tagUuids ? _self.tagUuids : tagUuids // ignore: cast_nullable_to_non_nullable
as List<String>,ingredients: null == ingredients ? _self.ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientLink>,
  ));
}

}


/// Adds pattern-matching-related methods to [Meal].
extension MealPatterns on Meal {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Meal value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Meal() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Meal value)  $default,){
final _that = this;
switch (_that) {
case _Meal():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Meal value)?  $default,){
final _that = this;
switch (_that) {
case _Meal() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? uuid,  DateTime? created,  DateTime? updated,  String name,  String? instructions,  String? thumbnailUuid,  List<String> imagesUuids,  List<RatingLink> ratings,  List<String> tagUuids,  List<IngredientLink> ingredients)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Meal() when $default != null:
return $default(_that.uuid,_that.created,_that.updated,_that.name,_that.instructions,_that.thumbnailUuid,_that.imagesUuids,_that.ratings,_that.tagUuids,_that.ingredients);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? uuid,  DateTime? created,  DateTime? updated,  String name,  String? instructions,  String? thumbnailUuid,  List<String> imagesUuids,  List<RatingLink> ratings,  List<String> tagUuids,  List<IngredientLink> ingredients)  $default,) {final _that = this;
switch (_that) {
case _Meal():
return $default(_that.uuid,_that.created,_that.updated,_that.name,_that.instructions,_that.thumbnailUuid,_that.imagesUuids,_that.ratings,_that.tagUuids,_that.ingredients);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? uuid,  DateTime? created,  DateTime? updated,  String name,  String? instructions,  String? thumbnailUuid,  List<String> imagesUuids,  List<RatingLink> ratings,  List<String> tagUuids,  List<IngredientLink> ingredients)?  $default,) {final _that = this;
switch (_that) {
case _Meal() when $default != null:
return $default(_that.uuid,_that.created,_that.updated,_that.name,_that.instructions,_that.thumbnailUuid,_that.imagesUuids,_that.ratings,_that.tagUuids,_that.ingredients);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Meal extends Meal {
   _Meal({this.uuid, this.created, this.updated, required this.name, this.instructions, this.thumbnailUuid, final  List<String> imagesUuids = const [], final  List<RatingLink> ratings = const [], final  List<String> tagUuids = const [], final  List<IngredientLink> ingredients = const []}): _imagesUuids = imagesUuids,_ratings = ratings,_tagUuids = tagUuids,_ingredients = ingredients,super._();
  factory _Meal.fromJson(Map<String, dynamic> json) => _$MealFromJson(json);

// BaseModel fields
@override final  String? uuid;
@override final  DateTime? created;
@override final  DateTime? updated;
// CommonModel fields
@override final  String name;
// Meal-specific fields
@override final  String? instructions;
@override final  String? thumbnailUuid;
 final  List<String> _imagesUuids;
@override@JsonKey() List<String> get imagesUuids {
  if (_imagesUuids is EqualUnmodifiableListView) return _imagesUuids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_imagesUuids);
}

// Relationships — stored as nested JSON
 final  List<RatingLink> _ratings;
// Relationships — stored as nested JSON
@override@JsonKey() List<RatingLink> get ratings {
  if (_ratings is EqualUnmodifiableListView) return _ratings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ratings);
}

 final  List<String> _tagUuids;
@override@JsonKey() List<String> get tagUuids {
  if (_tagUuids is EqualUnmodifiableListView) return _tagUuids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_tagUuids);
}

 final  List<IngredientLink> _ingredients;
@override@JsonKey() List<IngredientLink> get ingredients {
  if (_ingredients is EqualUnmodifiableListView) return _ingredients;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ingredients);
}


/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealCopyWith<_Meal> get copyWith => __$MealCopyWithImpl<_Meal>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MealToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Meal&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&(identical(other.name, name) || other.name == name)&&(identical(other.instructions, instructions) || other.instructions == instructions)&&(identical(other.thumbnailUuid, thumbnailUuid) || other.thumbnailUuid == thumbnailUuid)&&const DeepCollectionEquality().equals(other._imagesUuids, _imagesUuids)&&const DeepCollectionEquality().equals(other._ratings, _ratings)&&const DeepCollectionEquality().equals(other._tagUuids, _tagUuids)&&const DeepCollectionEquality().equals(other._ingredients, _ingredients));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,created,updated,name,instructions,thumbnailUuid,const DeepCollectionEquality().hash(_imagesUuids),const DeepCollectionEquality().hash(_ratings),const DeepCollectionEquality().hash(_tagUuids),const DeepCollectionEquality().hash(_ingredients));

@override
String toString() {
  return 'Meal(uuid: $uuid, created: $created, updated: $updated, name: $name, instructions: $instructions, thumbnailUuid: $thumbnailUuid, imagesUuids: $imagesUuids, ratings: $ratings, tagUuids: $tagUuids, ingredients: $ingredients)';
}


}

/// @nodoc
abstract mixin class _$MealCopyWith<$Res> implements $MealCopyWith<$Res> {
  factory _$MealCopyWith(_Meal value, $Res Function(_Meal) _then) = __$MealCopyWithImpl;
@override @useResult
$Res call({
 String? uuid, DateTime? created, DateTime? updated, String name, String? instructions, String? thumbnailUuid, List<String> imagesUuids, List<RatingLink> ratings, List<String> tagUuids, List<IngredientLink> ingredients
});




}
/// @nodoc
class __$MealCopyWithImpl<$Res>
    implements _$MealCopyWith<$Res> {
  __$MealCopyWithImpl(this._self, this._then);

  final _Meal _self;
  final $Res Function(_Meal) _then;

/// Create a copy of Meal
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = freezed,Object? created = freezed,Object? updated = freezed,Object? name = null,Object? instructions = freezed,Object? thumbnailUuid = freezed,Object? imagesUuids = null,Object? ratings = null,Object? tagUuids = null,Object? ingredients = null,}) {
  return _then(_Meal(
uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,instructions: freezed == instructions ? _self.instructions : instructions // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUuid: freezed == thumbnailUuid ? _self.thumbnailUuid : thumbnailUuid // ignore: cast_nullable_to_non_nullable
as String?,imagesUuids: null == imagesUuids ? _self._imagesUuids : imagesUuids // ignore: cast_nullable_to_non_nullable
as List<String>,ratings: null == ratings ? _self._ratings : ratings // ignore: cast_nullable_to_non_nullable
as List<RatingLink>,tagUuids: null == tagUuids ? _self._tagUuids : tagUuids // ignore: cast_nullable_to_non_nullable
as List<String>,ingredients: null == ingredients ? _self._ingredients : ingredients // ignore: cast_nullable_to_non_nullable
as List<IngredientLink>,
  ));
}


}

// dart format on
