// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Meal _$MealFromJson(Map<String, dynamic> json) => _Meal(
  uuid: json['uuid'] as String?,
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  updated: json['updated'] == null
      ? null
      : DateTime.parse(json['updated'] as String),
  name: json['name'] as String,
  instructions: json['instructions'] as String?,
  thumbnailUuid: json['thumbnailUuid'] as String?,
  imagesUuids:
      (json['imagesUuids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  ratings:
      (json['ratings'] as List<dynamic>?)
          ?.map((e) => RatingLink.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
  tagUuids:
      (json['tagUuids'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  ingredients:
      (json['ingredients'] as List<dynamic>?)
          ?.map((e) => IngredientLink.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const [],
);

Map<String, dynamic> _$MealToJson(_Meal instance) => <String, dynamic>{
  'uuid': instance.uuid,
  'created': instance.created?.toIso8601String(),
  'updated': instance.updated?.toIso8601String(),
  'name': instance.name,
  'instructions': instance.instructions,
  'thumbnailUuid': instance.thumbnailUuid,
  'imagesUuids': instance.imagesUuids,
  'ratings': instance.ratings,
  'tagUuids': instance.tagUuids,
  'ingredients': instance.ingredients,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Meals)
@JsonPersist()
final mealsProvider = MealsProvider._();

@JsonPersist()
final class MealsProvider extends $AsyncNotifierProvider<Meals, List<Meal>> {
  MealsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'mealsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$mealsHash();

  @$internal
  @override
  Meals create() => Meals();
}

String _$mealsHash() => r'9bd1269621a3fc5efd8bd57bccdfff4738054460';

@JsonPersist()
abstract class _$MealsBase extends $AsyncNotifier<List<Meal>> {
  FutureOr<List<Meal>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Meal>>, List<Meal>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Meal>>, List<Meal>>,
              AsyncValue<List<Meal>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

// **************************************************************************
// JsonGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
abstract class _$Meals extends _$MealsBase {
  /// The default key used by [persist].
  String get key {
    const resolvedKey = "Meals";
    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  PersistResult persist(
    FutureOr<Storage<String, String>> storage, {
    String? key,
    String Function(List<Meal> state)? encode,
    List<Meal> Function(String encoded)? decode,
    StorageOptions options = const StorageOptions(),
  }) {
    return NotifierPersistX(this).persist<String, String>(
      storage,
      key: key ?? this.key,
      encode: encode ?? $jsonCodex.encode,
      decode:
          decode ??
          (encoded) {
            final e = $jsonCodex.decode(encoded);
            return (e as List)
                .map((e) => Meal.fromJson(e as Map<String, Object?>))
                .toList();
          },
      options: options,
    );
  }
}
