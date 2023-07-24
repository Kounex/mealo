// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api

extension GetSettingsCollection on Isar {
  IsarCollection<String, Settings> get settings => this.collection();
}

const SettingsSchema = IsarCollectionSchema(
  schema:
      '{"name":"Settings","idName":"uuid","properties":[{"name":"darkMode","type":"Bool"},{"name":"firstLaunch","type":"Bool"},{"name":"uuid","type":"String"}]}',
  converter: IsarObjectConverter<String, Settings>(
    serialize: serializeSettings,
    deserialize: deserializeSettings,
    deserializeProperty: deserializeSettingsProp,
  ),
  embeddedSchemas: [],
  hash: 2288885675456660844,
);

@isarProtected
int serializeSettings(IsarWriter writer, Settings object) {
  {
    final value = object.darkMode;
    if (value == null) {
      IsarCore.writeNull(writer, 1);
    } else {
      IsarCore.writeBool(writer, 1, value);
    }
  }
  IsarCore.writeBool(writer, 2, object.firstLaunch);
  IsarCore.writeString(writer, 3, IsarCore.toNativeString(object.uuid));
  return Isar.fastHash(object.uuid);
}

@isarProtected
Settings deserializeSettings(IsarReader reader) {
  final object = Settings();
  {
    if (IsarCore.readNull(reader, 1)) {
      object.darkMode = null;
    } else {
      object.darkMode = IsarCore.readBool(reader, 1);
    }
  }
  object.firstLaunch = IsarCore.readBool(reader, 2);
  object.uuid = IsarCore.readString(reader, 3) ?? '';
  return object;
}

@isarProtected
dynamic deserializeSettingsProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      {
        if (IsarCore.readNull(reader, 1)) {
          return null;
        } else {
          return IsarCore.readBool(reader, 1);
        }
      }
    case 2:
      return IsarCore.readBool(reader, 2);
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _SettingsUpdate {
  bool call(
    String uuid, {
    bool? darkMode,
    bool? firstLaunch,
  });
}

class _SettingsUpdateImpl implements _SettingsUpdate {
  const _SettingsUpdateImpl(this.collection);

  final IsarCollection<String, Settings> collection;

  @override
  bool call(
    String uuid, {
    Object? darkMode = ignore,
    Object? firstLaunch = ignore,
  }) {
    return collection.updateProperties([
          uuid
        ], {
          if (darkMode != ignore) 1: darkMode as bool?,
          if (firstLaunch != ignore) 2: firstLaunch as bool?,
        }) >
        0;
  }
}

sealed class _SettingsUpdateAll {
  int call(
    List<String> uuid, {
    bool? darkMode,
    bool? firstLaunch,
  });
}

class _SettingsUpdateAllImpl implements _SettingsUpdateAll {
  const _SettingsUpdateAllImpl(this.collection);

  final IsarCollection<String, Settings> collection;

  @override
  int call(
    List<String> uuid, {
    Object? darkMode = ignore,
    Object? firstLaunch = ignore,
  }) {
    return collection.updateProperties(uuid, {
      if (darkMode != ignore) 1: darkMode as bool?,
      if (firstLaunch != ignore) 2: firstLaunch as bool?,
    });
  }
}

extension SettingsUpdate on IsarCollection<String, Settings> {
  _SettingsUpdate get update => _SettingsUpdateImpl(this);

  _SettingsUpdateAll get updateAll => _SettingsUpdateAllImpl(this);
}

extension SettingsQueryFilter
    on QueryBuilder<Settings, Settings, QFilterCondition> {
  QueryBuilder<Settings, Settings, QAfterFilterCondition> darkModeIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> darkModeIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> darkModeEqualTo(
    bool? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> firstLaunchEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> uuidGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition>
      uuidGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> uuidLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> uuidLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> uuidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> uuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }
}

extension SettingsQueryObject
    on QueryBuilder<Settings, Settings, QFilterCondition> {}

extension SettingsQuerySortBy on QueryBuilder<Settings, Settings, QSortBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> sortByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByFirstLaunch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByFirstLaunchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> sortByUuidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }
}

extension SettingsQuerySortThenBy
    on QueryBuilder<Settings, Settings, QSortThenBy> {
  QueryBuilder<Settings, Settings, QAfterSortBy> thenByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByFirstLaunch() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByFirstLaunchDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Settings, Settings, QAfterSortBy> thenByUuidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }
}

extension SettingsQueryWhereDistinct
    on QueryBuilder<Settings, Settings, QDistinct> {
  QueryBuilder<Settings, Settings, QAfterDistinct> distinctByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<Settings, Settings, QAfterDistinct> distinctByFirstLaunch() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }
}

extension SettingsQueryProperty1
    on QueryBuilder<Settings, Settings, QProperty> {
  QueryBuilder<Settings, bool?, QAfterProperty> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Settings, bool, QAfterProperty> firstLaunchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Settings, String, QAfterProperty> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension SettingsQueryProperty2<R>
    on QueryBuilder<Settings, R, QAfterProperty> {
  QueryBuilder<Settings, (R, bool?), QAfterProperty> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Settings, (R, bool), QAfterProperty> firstLaunchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Settings, (R, String), QAfterProperty> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension SettingsQueryProperty3<R1, R2>
    on QueryBuilder<Settings, (R1, R2), QAfterProperty> {
  QueryBuilder<Settings, (R1, R2, bool?), QOperations> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<Settings, (R1, R2, bool), QOperations> firstLaunchProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<Settings, (R1, R2, String), QOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$settingsSingletonHash() => r'5bf787b5f69a9bddfced0442570a4775cb5c7256';

/// See also [SettingsSingleton].
@ProviderFor(SettingsSingleton)
final settingsSingletonProvider =
    AutoDisposeAsyncNotifierProvider<SettingsSingleton, Settings>.internal(
  SettingsSingleton.new,
  name: r'settingsSingletonProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$settingsSingletonHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SettingsSingleton = AutoDisposeAsyncNotifier<Settings>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
