// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meal.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$MealDTO {
  String get uuid => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get thumbnailBase64 => throw _privateConstructorUsedError;
  List<String>? get imagesBase64 => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MealDTOCopyWith<MealDTO> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MealDTOCopyWith<$Res> {
  factory $MealDTOCopyWith(MealDTO value, $Res Function(MealDTO) then) =
      _$MealDTOCopyWithImpl<$Res, MealDTO>;
  @useResult
  $Res call(
      {String uuid,
      DateTime createdAt,
      String name,
      String? thumbnailBase64,
      List<String>? imagesBase64});
}

/// @nodoc
class _$MealDTOCopyWithImpl<$Res, $Val extends MealDTO>
    implements $MealDTOCopyWith<$Res> {
  _$MealDTOCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? createdAt = null,
    Object? name = null,
    Object? thumbnailBase64 = freezed,
    Object? imagesBase64 = freezed,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailBase64: freezed == thumbnailBase64
          ? _value.thumbnailBase64
          : thumbnailBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesBase64: freezed == imagesBase64
          ? _value.imagesBase64
          : imagesBase64 // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MealDTOCopyWith<$Res> implements $MealDTOCopyWith<$Res> {
  factory _$$_MealDTOCopyWith(
          _$_MealDTO value, $Res Function(_$_MealDTO) then) =
      __$$_MealDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uuid,
      DateTime createdAt,
      String name,
      String? thumbnailBase64,
      List<String>? imagesBase64});
}

/// @nodoc
class __$$_MealDTOCopyWithImpl<$Res>
    extends _$MealDTOCopyWithImpl<$Res, _$_MealDTO>
    implements _$$_MealDTOCopyWith<$Res> {
  __$$_MealDTOCopyWithImpl(_$_MealDTO _value, $Res Function(_$_MealDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? createdAt = null,
    Object? name = null,
    Object? thumbnailBase64 = freezed,
    Object? imagesBase64 = freezed,
  }) {
    return _then(_$_MealDTO(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailBase64: freezed == thumbnailBase64
          ? _value.thumbnailBase64
          : thumbnailBase64 // ignore: cast_nullable_to_non_nullable
              as String?,
      imagesBase64: freezed == imagesBase64
          ? _value._imagesBase64
          : imagesBase64 // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc

class _$_MealDTO implements _MealDTO {
  const _$_MealDTO(
      {required this.uuid,
      required this.createdAt,
      required this.name,
      this.thumbnailBase64,
      final List<String>? imagesBase64})
      : _imagesBase64 = imagesBase64;

  @override
  final String uuid;
  @override
  final DateTime createdAt;
  @override
  final String name;
  @override
  final String? thumbnailBase64;
  final List<String>? _imagesBase64;
  @override
  List<String>? get imagesBase64 {
    final value = _imagesBase64;
    if (value == null) return null;
    if (_imagesBase64 is EqualUnmodifiableListView) return _imagesBase64;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MealDTO(uuid: $uuid, createdAt: $createdAt, name: $name, thumbnailBase64: $thumbnailBase64, imagesBase64: $imagesBase64)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MealDTO &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.thumbnailBase64, thumbnailBase64) ||
                other.thumbnailBase64 == thumbnailBase64) &&
            const DeepCollectionEquality()
                .equals(other._imagesBase64, _imagesBase64));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uuid, createdAt, name,
      thumbnailBase64, const DeepCollectionEquality().hash(_imagesBase64));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MealDTOCopyWith<_$_MealDTO> get copyWith =>
      __$$_MealDTOCopyWithImpl<_$_MealDTO>(this, _$identity);
}

abstract class _MealDTO implements MealDTO {
  const factory _MealDTO(
      {required final String uuid,
      required final DateTime createdAt,
      required final String name,
      final String? thumbnailBase64,
      final List<String>? imagesBase64}) = _$_MealDTO;

  @override
  String get uuid;
  @override
  DateTime get createdAt;
  @override
  String get name;
  @override
  String? get thumbnailBase64;
  @override
  List<String>? get imagesBase64;
  @override
  @JsonKey(ignore: true)
  _$$_MealDTOCopyWith<_$_MealDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
