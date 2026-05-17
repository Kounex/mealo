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
mixin _$MealDTO {

 String get uuid; DateTime get createdAt; String get name; String? get thumbnailBase64; List<String>? get imagesBase64;
/// Create a copy of MealDTO
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MealDTOCopyWith<MealDTO> get copyWith => _$MealDTOCopyWithImpl<MealDTO>(this as MealDTO, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MealDTO&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnailBase64, thumbnailBase64) || other.thumbnailBase64 == thumbnailBase64)&&const DeepCollectionEquality().equals(other.imagesBase64, imagesBase64));
}


@override
int get hashCode => Object.hash(runtimeType,uuid,createdAt,name,thumbnailBase64,const DeepCollectionEquality().hash(imagesBase64));

@override
String toString() {
  return 'MealDTO(uuid: $uuid, createdAt: $createdAt, name: $name, thumbnailBase64: $thumbnailBase64, imagesBase64: $imagesBase64)';
}


}

/// @nodoc
abstract mixin class $MealDTOCopyWith<$Res>  {
  factory $MealDTOCopyWith(MealDTO value, $Res Function(MealDTO) _then) = _$MealDTOCopyWithImpl;
@useResult
$Res call({
 String uuid, DateTime createdAt, String name, String? thumbnailBase64, List<String>? imagesBase64
});




}
/// @nodoc
class _$MealDTOCopyWithImpl<$Res>
    implements $MealDTOCopyWith<$Res> {
  _$MealDTOCopyWithImpl(this._self, this._then);

  final MealDTO _self;
  final $Res Function(MealDTO) _then;

/// Create a copy of MealDTO
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? uuid = null,Object? createdAt = null,Object? name = null,Object? thumbnailBase64 = freezed,Object? imagesBase64 = freezed,}) {
  return _then(_self.copyWith(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnailBase64: freezed == thumbnailBase64 ? _self.thumbnailBase64 : thumbnailBase64 // ignore: cast_nullable_to_non_nullable
as String?,imagesBase64: freezed == imagesBase64 ? _self.imagesBase64 : imagesBase64 // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [MealDTO].
extension MealDTOPatterns on MealDTO {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MealDTO value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MealDTO() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MealDTO value)  $default,){
final _that = this;
switch (_that) {
case _MealDTO():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MealDTO value)?  $default,){
final _that = this;
switch (_that) {
case _MealDTO() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String uuid,  DateTime createdAt,  String name,  String? thumbnailBase64,  List<String>? imagesBase64)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MealDTO() when $default != null:
return $default(_that.uuid,_that.createdAt,_that.name,_that.thumbnailBase64,_that.imagesBase64);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String uuid,  DateTime createdAt,  String name,  String? thumbnailBase64,  List<String>? imagesBase64)  $default,) {final _that = this;
switch (_that) {
case _MealDTO():
return $default(_that.uuid,_that.createdAt,_that.name,_that.thumbnailBase64,_that.imagesBase64);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String uuid,  DateTime createdAt,  String name,  String? thumbnailBase64,  List<String>? imagesBase64)?  $default,) {final _that = this;
switch (_that) {
case _MealDTO() when $default != null:
return $default(_that.uuid,_that.createdAt,_that.name,_that.thumbnailBase64,_that.imagesBase64);case _:
  return null;

}
}

}

/// @nodoc


class _MealDTO implements MealDTO {
  const _MealDTO({required this.uuid, required this.createdAt, required this.name, this.thumbnailBase64, final  List<String>? imagesBase64}): _imagesBase64 = imagesBase64;
  

@override final  String uuid;
@override final  DateTime createdAt;
@override final  String name;
@override final  String? thumbnailBase64;
 final  List<String>? _imagesBase64;
@override List<String>? get imagesBase64 {
  final value = _imagesBase64;
  if (value == null) return null;
  if (_imagesBase64 is EqualUnmodifiableListView) return _imagesBase64;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of MealDTO
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MealDTOCopyWith<_MealDTO> get copyWith => __$MealDTOCopyWithImpl<_MealDTO>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MealDTO&&(identical(other.uuid, uuid) || other.uuid == uuid)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.name, name) || other.name == name)&&(identical(other.thumbnailBase64, thumbnailBase64) || other.thumbnailBase64 == thumbnailBase64)&&const DeepCollectionEquality().equals(other._imagesBase64, _imagesBase64));
}


@override
int get hashCode => Object.hash(runtimeType,uuid,createdAt,name,thumbnailBase64,const DeepCollectionEquality().hash(_imagesBase64));

@override
String toString() {
  return 'MealDTO(uuid: $uuid, createdAt: $createdAt, name: $name, thumbnailBase64: $thumbnailBase64, imagesBase64: $imagesBase64)';
}


}

/// @nodoc
abstract mixin class _$MealDTOCopyWith<$Res> implements $MealDTOCopyWith<$Res> {
  factory _$MealDTOCopyWith(_MealDTO value, $Res Function(_MealDTO) _then) = __$MealDTOCopyWithImpl;
@override @useResult
$Res call({
 String uuid, DateTime createdAt, String name, String? thumbnailBase64, List<String>? imagesBase64
});




}
/// @nodoc
class __$MealDTOCopyWithImpl<$Res>
    implements _$MealDTOCopyWith<$Res> {
  __$MealDTOCopyWithImpl(this._self, this._then);

  final _MealDTO _self;
  final $Res Function(_MealDTO) _then;

/// Create a copy of MealDTO
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? uuid = null,Object? createdAt = null,Object? name = null,Object? thumbnailBase64 = freezed,Object? imagesBase64 = freezed,}) {
  return _then(_MealDTO(
uuid: null == uuid ? _self.uuid : uuid // ignore: cast_nullable_to_non_nullable
as String,createdAt: null == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,thumbnailBase64: freezed == thumbnailBase64 ? _self.thumbnailBase64 : thumbnailBase64 // ignore: cast_nullable_to_non_nullable
as String?,imagesBase64: freezed == imagesBase64 ? _self._imagesBase64 : imagesBase64 // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
