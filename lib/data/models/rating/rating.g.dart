// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Rating _$RatingFromJson(Map<String, dynamic> json) => _Rating(
  uuid: json['uuid'] as String?,
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  updated: json['updated'] == null
      ? null
      : DateTime.parse(json['updated'] as String),
  name: json['name'] as String,
  description: json['description'] as String?,
);

Map<String, dynamic> _$RatingToJson(_Rating instance) => <String, dynamic>{
  'uuid': instance.uuid,
  'created': instance.created?.toIso8601String(),
  'updated': instance.updated?.toIso8601String(),
  'name': instance.name,
  'description': instance.description,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Ratings)
@JsonPersist()
final ratingsProvider = RatingsProvider._();

@JsonPersist()
final class RatingsProvider
    extends $AsyncNotifierProvider<Ratings, List<Rating>> {
  RatingsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'ratingsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$ratingsHash();

  @$internal
  @override
  Ratings create() => Ratings();
}

String _$ratingsHash() => r'52c16b3aa65612bc99cff87ef99425bfd538355e';

@JsonPersist()
abstract class _$RatingsBase extends $AsyncNotifier<List<Rating>> {
  FutureOr<List<Rating>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Rating>>, List<Rating>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Rating>>, List<Rating>>,
              AsyncValue<List<Rating>>,
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
abstract class _$Ratings extends _$RatingsBase {
  /// The default key used by [persist].
  String get key {
    const resolvedKey = "Ratings";
    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  PersistResult persist(
    FutureOr<Storage<String, String>> storage, {
    String? key,
    String Function(List<Rating> state)? encode,
    List<Rating> Function(String encoded)? decode,
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
                .map((e) => Rating.fromJson(e as Map<String, Object?>))
                .toList();
          },
      options: options,
    );
  }
}
