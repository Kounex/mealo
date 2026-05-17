// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rating_link.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RatingLink {

 String get ratingUuid; RatingValue get value;
/// Create a copy of RatingLink
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RatingLinkCopyWith<RatingLink> get copyWith => _$RatingLinkCopyWithImpl<RatingLink>(this as RatingLink, _$identity);

  /// Serializes this RatingLink to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RatingLink&&(identical(other.ratingUuid, ratingUuid) || other.ratingUuid == ratingUuid)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ratingUuid,value);

@override
String toString() {
  return 'RatingLink(ratingUuid: $ratingUuid, value: $value)';
}


}

/// @nodoc
abstract mixin class $RatingLinkCopyWith<$Res>  {
  factory $RatingLinkCopyWith(RatingLink value, $Res Function(RatingLink) _then) = _$RatingLinkCopyWithImpl;
@useResult
$Res call({
 String ratingUuid, RatingValue value
});




}
/// @nodoc
class _$RatingLinkCopyWithImpl<$Res>
    implements $RatingLinkCopyWith<$Res> {
  _$RatingLinkCopyWithImpl(this._self, this._then);

  final RatingLink _self;
  final $Res Function(RatingLink) _then;

/// Create a copy of RatingLink
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ratingUuid = null,Object? value = null,}) {
  return _then(_self.copyWith(
ratingUuid: null == ratingUuid ? _self.ratingUuid : ratingUuid // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as RatingValue,
  ));
}

}


/// Adds pattern-matching-related methods to [RatingLink].
extension RatingLinkPatterns on RatingLink {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RatingLink value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RatingLink() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RatingLink value)  $default,){
final _that = this;
switch (_that) {
case _RatingLink():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RatingLink value)?  $default,){
final _that = this;
switch (_that) {
case _RatingLink() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ratingUuid,  RatingValue value)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RatingLink() when $default != null:
return $default(_that.ratingUuid,_that.value);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ratingUuid,  RatingValue value)  $default,) {final _that = this;
switch (_that) {
case _RatingLink():
return $default(_that.ratingUuid,_that.value);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ratingUuid,  RatingValue value)?  $default,) {final _that = this;
switch (_that) {
case _RatingLink() when $default != null:
return $default(_that.ratingUuid,_that.value);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RatingLink implements RatingLink {
  const _RatingLink({required this.ratingUuid, this.value = RatingValue.three});
  factory _RatingLink.fromJson(Map<String, dynamic> json) => _$RatingLinkFromJson(json);

@override final  String ratingUuid;
@override@JsonKey() final  RatingValue value;

/// Create a copy of RatingLink
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RatingLinkCopyWith<_RatingLink> get copyWith => __$RatingLinkCopyWithImpl<_RatingLink>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RatingLinkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RatingLink&&(identical(other.ratingUuid, ratingUuid) || other.ratingUuid == ratingUuid)&&(identical(other.value, value) || other.value == value));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ratingUuid,value);

@override
String toString() {
  return 'RatingLink(ratingUuid: $ratingUuid, value: $value)';
}


}

/// @nodoc
abstract mixin class _$RatingLinkCopyWith<$Res> implements $RatingLinkCopyWith<$Res> {
  factory _$RatingLinkCopyWith(_RatingLink value, $Res Function(_RatingLink) _then) = __$RatingLinkCopyWithImpl;
@override @useResult
$Res call({
 String ratingUuid, RatingValue value
});




}
/// @nodoc
class __$RatingLinkCopyWithImpl<$Res>
    implements _$RatingLinkCopyWith<$Res> {
  __$RatingLinkCopyWithImpl(this._self, this._then);

  final _RatingLink _self;
  final $Res Function(_RatingLink) _then;

/// Create a copy of RatingLink
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ratingUuid = null,Object? value = null,}) {
  return _then(_RatingLink(
ratingUuid: null == ratingUuid ? _self.ratingUuid : ratingUuid // ignore: cast_nullable_to_non_nullable
as String,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as RatingValue,
  ));
}


}

// dart format on
