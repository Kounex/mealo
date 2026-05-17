// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Tag _$TagFromJson(Map<String, dynamic> json) => _Tag(
  uuid: json['uuid'] as String?,
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  updated: json['updated'] == null
      ? null
      : DateTime.parse(json['updated'] as String),
  name: json['name'] as String,
  colorHex: json['colorHex'] as String?,
);

Map<String, dynamic> _$TagToJson(_Tag instance) => <String, dynamic>{
  'uuid': instance.uuid,
  'created': instance.created?.toIso8601String(),
  'updated': instance.updated?.toIso8601String(),
  'name': instance.name,
  'colorHex': instance.colorHex,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(Tags)
@JsonPersist()
final tagsProvider = TagsProvider._();

@JsonPersist()
final class TagsProvider extends $AsyncNotifierProvider<Tags, List<Tag>> {
  TagsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'tagsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$tagsHash();

  @$internal
  @override
  Tags create() => Tags();
}

String _$tagsHash() => r'c2e339a12dbd87e0ebb1de79d1690f613355c21b';

@JsonPersist()
abstract class _$TagsBase extends $AsyncNotifier<List<Tag>> {
  FutureOr<List<Tag>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Tag>>, List<Tag>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Tag>>, List<Tag>>,
              AsyncValue<List<Tag>>,
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
abstract class _$Tags extends _$TagsBase {
  /// The default key used by [persist].
  String get key {
    const resolvedKey = "Tags";
    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  PersistResult persist(
    FutureOr<Storage<String, String>> storage, {
    String? key,
    String Function(List<Tag> state)? encode,
    List<Tag> Function(String encoded)? decode,
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
                .map((e) => Tag.fromJson(e as Map<String, Object?>))
                .toList();
          },
      options: options,
    );
  }
}
