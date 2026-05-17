// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'randomized_run.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RandomizedRun _$RandomizedRunFromJson(Map<String, dynamic> json) =>
    _RandomizedRun(
      uuid: json['uuid'] as String?,
      created: json['created'] == null
          ? null
          : DateTime.parse(json['created'] as String),
      updated: json['updated'] == null
          ? null
          : DateTime.parse(json['updated'] as String),
      includedTagsUuids:
          (json['includedTagsUuids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      excludedTagsUuids:
          (json['excludedTagsUuids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      includedIngredientUuids:
          (json['includedIngredientUuids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      excludedIngredientUuids:
          (json['excludedIngredientUuids'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      ratingLinks:
          (json['ratingLinks'] as List<dynamic>?)
              ?.map((e) => RatingLink.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      daysNotEaten: (json['daysNotEaten'] as num?)?.toInt(),
      mealUuid: json['mealUuid'] as String?,
      eaten: json['eaten'] as bool? ?? false,
    );

Map<String, dynamic> _$RandomizedRunToJson(_RandomizedRun instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'created': instance.created?.toIso8601String(),
      'updated': instance.updated?.toIso8601String(),
      'includedTagsUuids': instance.includedTagsUuids,
      'excludedTagsUuids': instance.excludedTagsUuids,
      'includedIngredientUuids': instance.includedIngredientUuids,
      'excludedIngredientUuids': instance.excludedIngredientUuids,
      'ratingLinks': instance.ratingLinks,
      'daysNotEaten': instance.daysNotEaten,
      'mealUuid': instance.mealUuid,
      'eaten': instance.eaten,
    };

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(RandomizedRuns)
@JsonPersist()
final randomizedRunsProvider = RandomizedRunsProvider._();

@JsonPersist()
final class RandomizedRunsProvider
    extends $AsyncNotifierProvider<RandomizedRuns, List<RandomizedRun>> {
  RandomizedRunsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'randomizedRunsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$randomizedRunsHash();

  @$internal
  @override
  RandomizedRuns create() => RandomizedRuns();
}

String _$randomizedRunsHash() => r'971fc565504f12d192ac6af8e6eb56c54be62dad';

@JsonPersist()
abstract class _$RandomizedRunsBase
    extends $AsyncNotifier<List<RandomizedRun>> {
  FutureOr<List<RandomizedRun>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<RandomizedRun>>, List<RandomizedRun>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<RandomizedRun>>, List<RandomizedRun>>,
              AsyncValue<List<RandomizedRun>>,
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
abstract class _$RandomizedRuns extends _$RandomizedRunsBase {
  /// The default key used by [persist].
  String get key {
    const resolvedKey = "RandomizedRuns";
    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  PersistResult persist(
    FutureOr<Storage<String, String>> storage, {
    String? key,
    String Function(List<RandomizedRun> state)? encode,
    List<RandomizedRun> Function(String encoded)? decode,
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
                .map((e) => RandomizedRun.fromJson(e as Map<String, Object?>))
                .toList();
          },
      options: options,
    );
  }
}
