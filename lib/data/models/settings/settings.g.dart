// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Settings _$SettingsFromJson(Map<String, dynamic> json) => _Settings(
  uuid: json['uuid'] as String?,
  created: json['created'] == null
      ? null
      : DateTime.parse(json['created'] as String),
  updated: json['updated'] == null
      ? null
      : DateTime.parse(json['updated'] as String),
  darkMode: json['darkMode'] as bool?,
  firstLaunch: json['firstLaunch'] as bool? ?? false,
);

Map<String, dynamic> _$SettingsToJson(_Settings instance) => <String, dynamic>{
  'uuid': instance.uuid,
  'created': instance.created?.toIso8601String(),
  'updated': instance.updated?.toIso8601String(),
  'darkMode': instance.darkMode,
  'firstLaunch': instance.firstLaunch,
};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SettingsSingleton)
@JsonPersist()
final settingsSingletonProvider = SettingsSingletonProvider._();

@JsonPersist()
final class SettingsSingletonProvider
    extends $AsyncNotifierProvider<SettingsSingleton, Settings> {
  SettingsSingletonProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsSingletonProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsSingletonHash();

  @$internal
  @override
  SettingsSingleton create() => SettingsSingleton();
}

String _$settingsSingletonHash() => r'3379d0cd313838ac94b0c237ffcd116f09c2bf85';

@JsonPersist()
abstract class _$SettingsSingletonBase extends $AsyncNotifier<Settings> {
  FutureOr<Settings> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<Settings>, Settings>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<Settings>, Settings>,
              AsyncValue<Settings>,
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
abstract class _$SettingsSingleton extends _$SettingsSingletonBase {
  /// The default key used by [persist].
  String get key {
    const resolvedKey = "SettingsSingleton";
    return resolvedKey;
  }

  /// A variant of [persist], for JSON-specific encoding.
  ///
  /// You can override [key] to customize the key used for storage.
  PersistResult persist(
    FutureOr<Storage<String, String>> storage, {
    String? key,
    String Function(Settings state)? encode,
    Settings Function(String encoded)? decode,
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
            return Settings.fromJson(e as Map<String, Object?>);
          },
      options: options,
    );
  }
}
