// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'randomized_run.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RandomizedRun {

// BaseModel fields
 String? get uuid; DateTime? get created; DateTime? get updated;// RandomizedRun-specific fields
/// [Tag]s which meals should have applied
 List<String> get includedTagsUuids;/// [Tag]s we don't want randomized meals to have
 List<String> get excludedTagsUuids; List<String> get includedIngredientUuids; List<String> get excludedIngredientUuids; List<RatingLink> get ratingLinks;/// The amount of days how long ago we wanted to find a meal we ate the last
/// time
 int? get daysNotEaten; String? get mealUuid;/// Generally we assume a randomized run does not automatically mean the
/// user will select this meal as their next meal to eat. Once the user
/// indicated that this meal will be eaten, we will set this to true and
/// we can query this later
 bool get eaten;
/// Create a copy of RandomizedRun
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RandomizedRunCopyWith<RandomizedRun> get copyWith => _$RandomizedRunCopyWithImpl<RandomizedRun>(this as RandomizedRun, _$identity);

  /// Serializes this RandomizedRun to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RandomizedRun&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&const DeepCollectionEquality().equals(other.includedTagsUuids, includedTagsUuids)&&const DeepCollectionEquality().equals(other.excludedTagsUuids, excludedTagsUuids)&&const DeepCollectionEquality().equals(other.includedIngredientUuids, includedIngredientUuids)&&const DeepCollectionEquality().equals(other.excludedIngredientUuids, excludedIngredientUuids)&&const DeepCollectionEquality().equals(other.ratingLinks, ratingLinks)&&(identical(other.daysNotEaten, daysNotEaten) || other.daysNotEaten == daysNotEaten)&&(identical(other.mealUuid, mealUuid) || other.mealUuid == mealUuid)&&(identical(other.eaten, eaten) || other.eaten == eaten));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,created,updated,const DeepCollectionEquality().hash(includedTagsUuids),const DeepCollectionEquality().hash(excludedTagsUuids),const DeepCollectionEquality().hash(includedIngredientUuids),const DeepCollectionEquality().hash(excludedIngredientUuids),const DeepCollectionEquality().hash(ratingLinks),daysNotEaten,mealUuid,eaten);

@override
String toString() {
  return 'RandomizedRun(uuid: $uuid, created: $created, updated: $updated, includedTagsUuids: $includedTagsUuids, excludedTagsUuids: $excludedTagsUuids, includedIngredientUuids: $includedIngredientUuids, excludedIngredientUuids: $excludedIngredientUuids, ratingLinks: $ratingLinks, daysNotEaten: $daysNotEaten, mealUuid: $mealUuid, eaten: $eaten)';
}


}

/// @nodoc
abstract mixin class $RandomizedRunCopyWith<$Res>  {
  factory $RandomizedRunCopyWith(RandomizedRun value, $Res Function(RandomizedRun) _then) = _$RandomizedRunCopyWithImpl;
@useResult
$Res call({
 String? uuid, DateTime? created, DateTime? updated, List<String> includedTagsUuids, List<String> excludedTagsUuids, List<String> includedIngredientUuids, List<String> excludedIngredientUuids, List<RatingLink> ratingLinks, int? daysNotEaten, String? mealUuid, bool eaten
});




}
/// @nodoc
class _$RandomizedRunCopyWithImpl<$Res>
    implements $RandomizedRunCopyWith<$Res> {
  _$RandomizedRunCopyWithImpl(this._self, this._then);

  final RandomizedRun _self;
  final $Res Function(RandomizedRun) _then;

/// Create a copy of RandomizedRun
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = freezed,Object? created = freezed,Object? updated = freezed,Object? includedTagsUuids = null,Object? excludedTagsUuids = null,Object? includedIngredientUuids = null,Object? excludedIngredientUuids = null,Object? ratingLinks = null,Object? daysNotEaten = freezed,Object? mealUuid = freezed,Object? eaten = null,}) {
  return _then(_self.copyWith(
uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,includedTagsUuids: null == includedTagsUuids ? _self.includedTagsUuids : includedTagsUuids // ignore: cast_nullable_to_non_nullable
as List<String>,excludedTagsUuids: null == excludedTagsUuids ? _self.excludedTagsUuids : excludedTagsUuids // ignore: cast_nullable_to_non_nullable
as List<String>,includedIngredientUuids: null == includedIngredientUuids ? _self.includedIngredientUuids : includedIngredientUuids // ignore: cast_nullable_to_non_nullable
as List<String>,excludedIngredientUuids: null == excludedIngredientUuids ? _self.excludedIngredientUuids : excludedIngredientUuids // ignore: cast_nullable_to_non_nullable
as List<String>,ratingLinks: null == ratingLinks ? _self.ratingLinks : ratingLinks // ignore: cast_nullable_to_non_nullable
as List<RatingLink>,daysNotEaten: freezed == daysNotEaten ? _self.daysNotEaten : daysNotEaten // ignore: cast_nullable_to_non_nullable
as int?,mealUuid: freezed == mealUuid ? _self.mealUuid : mealUuid // ignore: cast_nullable_to_non_nullable
as String?,eaten: null == eaten ? _self.eaten : eaten // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [RandomizedRun].
extension RandomizedRunPatterns on RandomizedRun {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RandomizedRun value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RandomizedRun() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RandomizedRun value)  $default,){
final _that = this;
switch (_that) {
case _RandomizedRun():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RandomizedRun value)?  $default,){
final _that = this;
switch (_that) {
case _RandomizedRun() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? uuid,  DateTime? created,  DateTime? updated,  List<String> includedTagsUuids,  List<String> excludedTagsUuids,  List<String> includedIngredientUuids,  List<String> excludedIngredientUuids,  List<RatingLink> ratingLinks,  int? daysNotEaten,  String? mealUuid,  bool eaten)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RandomizedRun() when $default != null:
return $default(_that.uuid,_that.created,_that.updated,_that.includedTagsUuids,_that.excludedTagsUuids,_that.includedIngredientUuids,_that.excludedIngredientUuids,_that.ratingLinks,_that.daysNotEaten,_that.mealUuid,_that.eaten);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? uuid,  DateTime? created,  DateTime? updated,  List<String> includedTagsUuids,  List<String> excludedTagsUuids,  List<String> includedIngredientUuids,  List<String> excludedIngredientUuids,  List<RatingLink> ratingLinks,  int? daysNotEaten,  String? mealUuid,  bool eaten)  $default,) {final _that = this;
switch (_that) {
case _RandomizedRun():
return $default(_that.uuid,_that.created,_that.updated,_that.includedTagsUuids,_that.excludedTagsUuids,_that.includedIngredientUuids,_that.excludedIngredientUuids,_that.ratingLinks,_that.daysNotEaten,_that.mealUuid,_that.eaten);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? uuid,  DateTime? created,  DateTime? updated,  List<String> includedTagsUuids,  List<String> excludedTagsUuids,  List<String> includedIngredientUuids,  List<String> excludedIngredientUuids,  List<RatingLink> ratingLinks,  int? daysNotEaten,  String? mealUuid,  bool eaten)?  $default,) {final _that = this;
switch (_that) {
case _RandomizedRun() when $default != null:
return $default(_that.uuid,_that.created,_that.updated,_that.includedTagsUuids,_that.excludedTagsUuids,_that.includedIngredientUuids,_that.excludedIngredientUuids,_that.ratingLinks,_that.daysNotEaten,_that.mealUuid,_that.eaten);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RandomizedRun extends RandomizedRun {
   _RandomizedRun({this.uuid, this.created, this.updated, final  List<String> includedTagsUuids = const [], final  List<String> excludedTagsUuids = const [], final  List<String> includedIngredientUuids = const [], final  List<String> excludedIngredientUuids = const [], final  List<RatingLink> ratingLinks = const [], this.daysNotEaten, this.mealUuid, this.eaten = false}): _includedTagsUuids = includedTagsUuids,_excludedTagsUuids = excludedTagsUuids,_includedIngredientUuids = includedIngredientUuids,_excludedIngredientUuids = excludedIngredientUuids,_ratingLinks = ratingLinks,super._();
  factory _RandomizedRun.fromJson(Map<String, dynamic> json) => _$RandomizedRunFromJson(json);

// BaseModel fields
@override final  String? uuid;
@override final  DateTime? created;
@override final  DateTime? updated;
// RandomizedRun-specific fields
/// [Tag]s which meals should have applied
 final  List<String> _includedTagsUuids;
// RandomizedRun-specific fields
/// [Tag]s which meals should have applied
@override@JsonKey() List<String> get includedTagsUuids {
  if (_includedTagsUuids is EqualUnmodifiableListView) return _includedTagsUuids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_includedTagsUuids);
}

/// [Tag]s we don't want randomized meals to have
 final  List<String> _excludedTagsUuids;
/// [Tag]s we don't want randomized meals to have
@override@JsonKey() List<String> get excludedTagsUuids {
  if (_excludedTagsUuids is EqualUnmodifiableListView) return _excludedTagsUuids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_excludedTagsUuids);
}

 final  List<String> _includedIngredientUuids;
@override@JsonKey() List<String> get includedIngredientUuids {
  if (_includedIngredientUuids is EqualUnmodifiableListView) return _includedIngredientUuids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_includedIngredientUuids);
}

 final  List<String> _excludedIngredientUuids;
@override@JsonKey() List<String> get excludedIngredientUuids {
  if (_excludedIngredientUuids is EqualUnmodifiableListView) return _excludedIngredientUuids;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_excludedIngredientUuids);
}

 final  List<RatingLink> _ratingLinks;
@override@JsonKey() List<RatingLink> get ratingLinks {
  if (_ratingLinks is EqualUnmodifiableListView) return _ratingLinks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ratingLinks);
}

/// The amount of days how long ago we wanted to find a meal we ate the last
/// time
@override final  int? daysNotEaten;
@override final  String? mealUuid;
/// Generally we assume a randomized run does not automatically mean the
/// user will select this meal as their next meal to eat. Once the user
/// indicated that this meal will be eaten, we will set this to true and
/// we can query this later
@override@JsonKey() final  bool eaten;

/// Create a copy of RandomizedRun
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RandomizedRunCopyWith<_RandomizedRun> get copyWith => __$RandomizedRunCopyWithImpl<_RandomizedRun>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RandomizedRunToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RandomizedRun&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.created, created) || other.created == created)&&(identical(other.updated, updated) || other.updated == updated)&&const DeepCollectionEquality().equals(other._includedTagsUuids, _includedTagsUuids)&&const DeepCollectionEquality().equals(other._excludedTagsUuids, _excludedTagsUuids)&&const DeepCollectionEquality().equals(other._includedIngredientUuids, _includedIngredientUuids)&&const DeepCollectionEquality().equals(other._excludedIngredientUuids, _excludedIngredientUuids)&&const DeepCollectionEquality().equals(other._ratingLinks, _ratingLinks)&&(identical(other.daysNotEaten, daysNotEaten) || other.daysNotEaten == daysNotEaten)&&(identical(other.mealUuid, mealUuid) || other.mealUuid == mealUuid)&&(identical(other.eaten, eaten) || other.eaten == eaten));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,uuid,created,updated,const DeepCollectionEquality().hash(_includedTagsUuids),const DeepCollectionEquality().hash(_excludedTagsUuids),const DeepCollectionEquality().hash(_includedIngredientUuids),const DeepCollectionEquality().hash(_excludedIngredientUuids),const DeepCollectionEquality().hash(_ratingLinks),daysNotEaten,mealUuid,eaten);

@override
String toString() {
  return 'RandomizedRun(uuid: $uuid, created: $created, updated: $updated, includedTagsUuids: $includedTagsUuids, excludedTagsUuids: $excludedTagsUuids, includedIngredientUuids: $includedIngredientUuids, excludedIngredientUuids: $excludedIngredientUuids, ratingLinks: $ratingLinks, daysNotEaten: $daysNotEaten, mealUuid: $mealUuid, eaten: $eaten)';
}


}

/// @nodoc
abstract mixin class _$RandomizedRunCopyWith<$Res> implements $RandomizedRunCopyWith<$Res> {
  factory _$RandomizedRunCopyWith(_RandomizedRun value, $Res Function(_RandomizedRun) _then) = __$RandomizedRunCopyWithImpl;
@override @useResult
$Res call({
 String? uuid, DateTime? created, DateTime? updated, List<String> includedTagsUuids, List<String> excludedTagsUuids, List<String> includedIngredientUuids, List<String> excludedIngredientUuids, List<RatingLink> ratingLinks, int? daysNotEaten, String? mealUuid, bool eaten
});




}
/// @nodoc
class __$RandomizedRunCopyWithImpl<$Res>
    implements _$RandomizedRunCopyWith<$Res> {
  __$RandomizedRunCopyWithImpl(this._self, this._then);

  final _RandomizedRun _self;
  final $Res Function(_RandomizedRun) _then;

/// Create a copy of RandomizedRun
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = freezed,Object? created = freezed,Object? updated = freezed,Object? includedTagsUuids = null,Object? excludedTagsUuids = null,Object? includedIngredientUuids = null,Object? excludedIngredientUuids = null,Object? ratingLinks = null,Object? daysNotEaten = freezed,Object? mealUuid = freezed,Object? eaten = null,}) {
  return _then(_RandomizedRun(
uuid: freezed == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String?,created: freezed == created ? _self.created : created // ignore: cast_nullable_to_non_nullable
as DateTime?,updated: freezed == updated ? _self.updated : updated // ignore: cast_nullable_to_non_nullable
as DateTime?,includedTagsUuids: null == includedTagsUuids ? _self._includedTagsUuids : includedTagsUuids // ignore: cast_nullable_to_non_nullable
as List<String>,excludedTagsUuids: null == excludedTagsUuids ? _self._excludedTagsUuids : excludedTagsUuids // ignore: cast_nullable_to_non_nullable
as List<String>,includedIngredientUuids: null == includedIngredientUuids ? _self._includedIngredientUuids : includedIngredientUuids // ignore: cast_nullable_to_non_nullable
as List<String>,excludedIngredientUuids: null == excludedIngredientUuids ? _self._excludedIngredientUuids : excludedIngredientUuids // ignore: cast_nullable_to_non_nullable
as List<String>,ratingLinks: null == ratingLinks ? _self._ratingLinks : ratingLinks // ignore: cast_nullable_to_non_nullable
as List<RatingLink>,daysNotEaten: freezed == daysNotEaten ? _self.daysNotEaten : daysNotEaten // ignore: cast_nullable_to_non_nullable
as int?,mealUuid: freezed == mealUuid ? _self.mealUuid : mealUuid // ignore: cast_nullable_to_non_nullable
as String?,eaten: null == eaten ? _self.eaten : eaten // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
