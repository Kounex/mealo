// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ingredient_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IngredientLink {

 String get ingredientUuid; String? get unitUuid; double? get amount;
/// Create a copy of IngredientLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IngredientLinkCopyWith<IngredientLink> get copyWith => _$IngredientLinkCopyWithImpl<IngredientLink>(this as IngredientLink, _$identity);

  /// Serializes this IngredientLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IngredientLink&&(identical(other.ingredientUuid, ingredientUuid) || other.ingredientUuid == ingredientUuid)&&(identical(other.unitUuid, unitUuid) || other.unitUuid == unitUuid)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredientUuid,unitUuid,amount);

@override
String toString() {
  return 'IngredientLink(ingredientUuid: $ingredientUuid, unitUuid: $unitUuid, amount: $amount)';
}


}

/// @nodoc
abstract mixin class $IngredientLinkCopyWith<$Res>  {
  factory $IngredientLinkCopyWith(IngredientLink value, $Res Function(IngredientLink) _then) = _$IngredientLinkCopyWithImpl;
@useResult
$Res call({
 String ingredientUuid, String? unitUuid, double? amount
});




}
/// @nodoc
class _$IngredientLinkCopyWithImpl<$Res>
    implements $IngredientLinkCopyWith<$Res> {
  _$IngredientLinkCopyWithImpl(this._self, this._then);

  final IngredientLink _self;
  final $Res Function(IngredientLink) _then;

/// Create a copy of IngredientLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ingredientUuid = null,Object? unitUuid = freezed,Object? amount = freezed,}) {
  return _then(_self.copyWith(
ingredientUuid: null == ingredientUuid ? _self.ingredientUuid : ingredientUuid // ignore: cast_nullable_to_non_nullable
as String,unitUuid: freezed == unitUuid ? _self.unitUuid : unitUuid // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}

}


/// Adds pattern-matching-related methods to [IngredientLink].
extension IngredientLinkPatterns on IngredientLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IngredientLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IngredientLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IngredientLink value)  $default,){
final _that = this;
switch (_that) {
case _IngredientLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IngredientLink value)?  $default,){
final _that = this;
switch (_that) {
case _IngredientLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ingredientUuid,  String? unitUuid,  double? amount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IngredientLink() when $default != null:
return $default(_that.ingredientUuid,_that.unitUuid,_that.amount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ingredientUuid,  String? unitUuid,  double? amount)  $default,) {final _that = this;
switch (_that) {
case _IngredientLink():
return $default(_that.ingredientUuid,_that.unitUuid,_that.amount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ingredientUuid,  String? unitUuid,  double? amount)?  $default,) {final _that = this;
switch (_that) {
case _IngredientLink() when $default != null:
return $default(_that.ingredientUuid,_that.unitUuid,_that.amount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IngredientLink implements IngredientLink {
  const _IngredientLink({required this.ingredientUuid, this.unitUuid, this.amount});
  factory _IngredientLink.fromJson(Map<String, dynamic> json) => _$IngredientLinkFromJson(json);

@override final  String ingredientUuid;
@override final  String? unitUuid;
@override final  double? amount;

/// Create a copy of IngredientLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IngredientLinkCopyWith<_IngredientLink> get copyWith => __$IngredientLinkCopyWithImpl<_IngredientLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IngredientLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IngredientLink&&(identical(other.ingredientUuid, ingredientUuid) || other.ingredientUuid == ingredientUuid)&&(identical(other.unitUuid, unitUuid) || other.unitUuid == unitUuid)&&(identical(other.amount, amount) || other.amount == amount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ingredientUuid,unitUuid,amount);

@override
String toString() {
  return 'IngredientLink(ingredientUuid: $ingredientUuid, unitUuid: $unitUuid, amount: $amount)';
}


}

/// @nodoc
abstract mixin class _$IngredientLinkCopyWith<$Res> implements $IngredientLinkCopyWith<$Res> {
  factory _$IngredientLinkCopyWith(_IngredientLink value, $Res Function(_IngredientLink) _then) = __$IngredientLinkCopyWithImpl;
@override @useResult
$Res call({
 String ingredientUuid, String? unitUuid, double? amount
});




}
/// @nodoc
class __$IngredientLinkCopyWithImpl<$Res>
    implements _$IngredientLinkCopyWith<$Res> {
  __$IngredientLinkCopyWithImpl(this._self, this._then);

  final _IngredientLink _self;
  final $Res Function(_IngredientLink) _then;

/// Create a copy of IngredientLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ingredientUuid = null,Object? unitUuid = freezed,Object? amount = freezed,}) {
  return _then(_IngredientLink(
ingredientUuid: null == ingredientUuid ? _self.ingredientUuid : ingredientUuid // ignore: cast_nullable_to_non_nullable
as String,unitUuid: freezed == unitUuid ? _self.unitUuid : unitUuid // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double?,
  ));
}


}

// dart format on
