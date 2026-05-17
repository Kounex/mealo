// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'unit.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Unit _$UnitFromJson(Map<String, dynamic> json) => _Unit(
  uuid: json['uuid'] as String?,
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  updated: json['updated'] == null
      ? null
      : DateTime.parse(json['updated'] as String),
  name: json['name'] as String,
);

Map<String, dynamic> _$UnitToJson(_Unit instance) => <String, dynamic>{
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

@ProviderFor(Units)
@JsonPersist()
final unitsProvider = UnitsProvider._();

@JsonPersist()
final class UnitsProvider extends $AsyncNotifierProvider<Units, List<Unit>> {
  UnitsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'unitsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$unitsHash();

  @$internal
  @override
  Units create() => Units();
}

String _$unitsHash() => r'd7fdcfbfd74decb95e81eb86d9d691a8f7af1c37';

@JsonPersist()
abstract class _$UnitsBase extends $AsyncNotifier<List<Unit>> {
  FutureOr<List<Unit>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Unit>>, List<Unit>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Unit>>, List<Unit>>,
              AsyncValue<List<Unit>>,
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
abstract class _$Units extends _$UnitsBase {
  /// The default key used by [persist].
  String get key {
    const resolvedKey = "Units";
    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  PersistResult persist(
    FutureOr<Storage<String, String>> storage, {
    String? key,
    String Function(List<Unit> state)? encode,
    List<Unit> Function(String encoded)? decode,
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
                .map((e) => Unit.fromJson(e as Map<String, Object?>))
                .toList();
          },
      options: options,
    );
  }
}
