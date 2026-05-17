// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Ingredient _$IngredientFromJson(Map<String, dynamic> json) => _Ingredient(
  uuid: json['uuid'] as String?,
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  updated: json['updated'] == null
      ? null
      : DateTime.parse(json['updated'] as String),
  name: json['name'] as String,
);

Map<String, dynamic> _$IngredientToJson(_Ingredient instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'name': instance.name,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Ingredients)
@JsonPersist()
final ingredientsProvider = IngredientsProvider._();

@JsonPersist()
final class IngredientsProvider
    extends $AsyncNotifierProvider<Ingredients, List<Ingredient>> {
  IngredientsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ingredientsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ingredientsHash();

  @$internal
  @override
  Ingredients create() => Ingredients();
}

String _$ingredientsHash() => r'89ed9198b82fed54ba1ccd3541382e7cfba05fc7';

@JsonPersist()
abstract class _$IngredientsBase extends $AsyncNotifier<List<Ingredient>> {
  FutureOr<List<Ingredient>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<Ingredient>>, List<Ingredient>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Ingredient>>, List<Ingredient>>,
              AsyncValue<List<Ingredient>>,
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
abstract class _$Ingredients extends _$IngredientsBase {
  /// The default key used by [persist].
  String get key {
    const resolvedKey = "Ingredients";
    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  PersistResult persist(
    FutureOr<Storage<String, String>> storage, {
    String? key,
    String Function(List<Ingredient> state)? encode,
    List<Ingredient> Function(String encoded)? decode,
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
                .map((e) => Ingredient.fromJson(e as Map<String, Object?>))
                .toList();
          },
      options: options,
    );
  }
}
