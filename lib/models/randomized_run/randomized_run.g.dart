// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'randomized_run.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors

extension GetRandomizedRunCollection on Isar {
  IsarCollection<String, RandomizedRun> get randomizedRuns => this.collection();
}

const RandomizedRunSchema = IsarCollectionSchema(
  schema:
      '{"name":"RandomizedRun","idName":"uuid","properties":[{"name":"inclusiveTagsUuids","type":"StringList"},{"name":"exclusiveTagsUuids","type":"StringList"},{"name":"ratingLinks","type":"ObjectList","target":"RatingLink"},{"name":"mealNotFeastSince","type":"DateTime"},{"name":"mealUuid","type":"String"},{"name":"feast","type":"Bool"},{"name":"uuid","type":"String"},{"name":"created","type":"DateTime"},{"name":"updated","type":"DateTime"}]}',
  converter: IsarObjectConverter<String, RandomizedRun>(
    serialize: serializeRandomizedRun,
    deserialize: deserializeRandomizedRun,
    deserializeProperty: deserializeRandomizedRunProp,
  ),
  embeddedSchemas: [RatingLinkSchema],
  hash: (-8119236817800978489 * 31 + ratingLinkSchemaHash),
);

@isarProtected
int serializeRandomizedRun(IsarWriter writer, RandomizedRun object) {
  {
    final list = object.inclusiveTagsUuids;
    final listWriter = IsarCore.beginList(writer, 1, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, IsarCore.toNativeString(list[i]));
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.exclusiveTagsUuids;
    final listWriter = IsarCore.beginList(writer, 2, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, IsarCore.toNativeString(list[i]));
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.ratingLinks;
    final listWriter = IsarCore.beginList(writer, 3, list.length);
    for (var i = 0; i < list.length; i++) {
      {
        final value = list[i];
        final objectWriter = IsarCore.beginObject(listWriter, i);
        serializeRatingLink(objectWriter, value);
        IsarCore.endObject(listWriter, objectWriter);
      }
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeLong(
      writer,
      4,
      object.mealNotFeastSince?.toUtc().microsecondsSinceEpoch ??
          -9223372036854775808);
  IsarCore.writeString(writer, 5, IsarCore.toNativeString(object.mealUuid));
  IsarCore.writeBool(writer, 6, object.feast);
  IsarCore.writeString(writer, 7, IsarCore.toNativeString(object.uuid));
  IsarCore.writeLong(writer, 8, object.created.toUtc().microsecondsSinceEpoch);
  IsarCore.writeLong(writer, 9, object.updated.toUtc().microsecondsSinceEpoch);
  return Isar.fastHash(object.uuid);
}

@isarProtected
RandomizedRun deserializeRandomizedRun(IsarReader reader) {
  final object = RandomizedRun();
  {
    final length = IsarCore.readList(reader, 1, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        object.inclusiveTagsUuids = const <String>[];
      } else {
        final list = List<String>.filled(length, '', growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readString(reader, i) ?? '';
        }
        IsarCore.freeReader(reader);
        object.inclusiveTagsUuids = list;
      }
    }
  }
  {
    final length = IsarCore.readList(reader, 2, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        object.exclusiveTagsUuids = const <String>[];
      } else {
        final list = List<String>.filled(length, '', growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readString(reader, i) ?? '';
        }
        IsarCore.freeReader(reader);
        object.exclusiveTagsUuids = list;
      }
    }
  }
  {
    final length = IsarCore.readList(reader, 3, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        object.ratingLinks = const <RatingLink>[];
      } else {
        final list =
            List<RatingLink>.filled(length, RatingLink(), growable: true);
        for (var i = 0; i < length; i++) {
          {
            final objectReader = IsarCore.readObject(reader, i);
            if (objectReader.isNull) {
              list[i] = RatingLink();
            } else {
              final embedded = deserializeRatingLink(objectReader);
              IsarCore.freeReader(objectReader);
              list[i] = embedded;
            }
          }
        }
        IsarCore.freeReader(reader);
        object.ratingLinks = list;
      }
    }
  }
  {
    final value = IsarCore.readLong(reader, 4);
    if (value == -9223372036854775808) {
      object.mealNotFeastSince = null;
    } else {
      object.mealNotFeastSince =
          DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true);
    }
  }
  object.mealUuid = IsarCore.readString(reader, 5) ?? '';
  object.feast = IsarCore.readBool(reader, 6);
  object.uuid = IsarCore.readString(reader, 7) ?? '';
  {
    final value = IsarCore.readLong(reader, 8);
    if (value == -9223372036854775808) {
      object.created =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      object.created = DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true);
    }
  }
  {
    final value = IsarCore.readLong(reader, 9);
    if (value == -9223372036854775808) {
      object.updated =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      object.updated = DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true);
    }
  }
  return object;
}

@isarProtected
dynamic deserializeRandomizedRunProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      {
        final length = IsarCore.readList(reader, 1, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <String>[];
          } else {
            final list = List<String>.filled(length, '', growable: true);
            for (var i = 0; i < length; i++) {
              list[i] = IsarCore.readString(reader, i) ?? '';
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    case 2:
      {
        final length = IsarCore.readList(reader, 2, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <String>[];
          } else {
            final list = List<String>.filled(length, '', growable: true);
            for (var i = 0; i < length; i++) {
              list[i] = IsarCore.readString(reader, i) ?? '';
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    case 3:
      {
        final length = IsarCore.readList(reader, 3, IsarCore.readerPtrPtr);
        {
          final reader = IsarCore.readerPtr;
          if (reader.isNull) {
            return const <RatingLink>[];
          } else {
            final list =
                List<RatingLink>.filled(length, RatingLink(), growable: true);
            for (var i = 0; i < length; i++) {
              {
                final objectReader = IsarCore.readObject(reader, i);
                if (objectReader.isNull) {
                  list[i] = RatingLink();
                } else {
                  final embedded = deserializeRatingLink(objectReader);
                  IsarCore.freeReader(objectReader);
                  list[i] = embedded;
                }
              }
            }
            IsarCore.freeReader(reader);
            return list;
          }
        }
      }
    case 4:
      {
        final value = IsarCore.readLong(reader, 4);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true);
        }
      }
    case 5:
      return IsarCore.readString(reader, 5) ?? '';
    case 6:
      return IsarCore.readBool(reader, 6);
    case 7:
      return IsarCore.readString(reader, 7) ?? '';
    case 8:
      {
        final value = IsarCore.readLong(reader, 8);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true);
        }
      }
    case 9:
      {
        final value = IsarCore.readLong(reader, 9);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true);
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _RandomizedRunUpdate {
  bool call({
    required String uuid,
    DateTime? mealNotFeastSince,
    String? mealUuid,
    bool? feast,
    DateTime? created,
    DateTime? updated,
  });
}

class _RandomizedRunUpdateImpl implements _RandomizedRunUpdate {
  const _RandomizedRunUpdateImpl(this.collection);

  final IsarCollection<String, RandomizedRun> collection;

  @override
  bool call({
    required String uuid,
    Object? mealNotFeastSince = ignore,
    Object? mealUuid = ignore,
    Object? feast = ignore,
    Object? created = ignore,
    Object? updated = ignore,
  }) {
    return collection.updateProperties([
          uuid
        ], {
          if (mealNotFeastSince != ignore) 4: mealNotFeastSince as DateTime?,
          if (mealUuid != ignore) 5: mealUuid as String?,
          if (feast != ignore) 6: feast as bool?,
          if (created != ignore) 8: created as DateTime?,
          if (updated != ignore) 9: updated as DateTime?,
        }) >
        0;
  }
}

sealed class _RandomizedRunUpdateAll {
  int call({
    required List<String> uuid,
    DateTime? mealNotFeastSince,
    String? mealUuid,
    bool? feast,
    DateTime? created,
    DateTime? updated,
  });
}

class _RandomizedRunUpdateAllImpl implements _RandomizedRunUpdateAll {
  const _RandomizedRunUpdateAllImpl(this.collection);

  final IsarCollection<String, RandomizedRun> collection;

  @override
  int call({
    required List<String> uuid,
    Object? mealNotFeastSince = ignore,
    Object? mealUuid = ignore,
    Object? feast = ignore,
    Object? created = ignore,
    Object? updated = ignore,
  }) {
    return collection.updateProperties(uuid, {
      if (mealNotFeastSince != ignore) 4: mealNotFeastSince as DateTime?,
      if (mealUuid != ignore) 5: mealUuid as String?,
      if (feast != ignore) 6: feast as bool?,
      if (created != ignore) 8: created as DateTime?,
      if (updated != ignore) 9: updated as DateTime?,
    });
  }
}

extension RandomizedRunUpdate on IsarCollection<String, RandomizedRun> {
  _RandomizedRunUpdate get update => _RandomizedRunUpdateImpl(this);

  _RandomizedRunUpdateAll get updateAll => _RandomizedRunUpdateAllImpl(this);
}

sealed class _RandomizedRunQueryUpdate {
  int call({
    DateTime? mealNotFeastSince,
    String? mealUuid,
    bool? feast,
    DateTime? created,
    DateTime? updated,
  });
}

class _RandomizedRunQueryUpdateImpl implements _RandomizedRunQueryUpdate {
  const _RandomizedRunQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<RandomizedRun> query;
  final int? limit;

  @override
  int call({
    Object? mealNotFeastSince = ignore,
    Object? mealUuid = ignore,
    Object? feast = ignore,
    Object? created = ignore,
    Object? updated = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (mealNotFeastSince != ignore) 4: mealNotFeastSince as DateTime?,
      if (mealUuid != ignore) 5: mealUuid as String?,
      if (feast != ignore) 6: feast as bool?,
      if (created != ignore) 8: created as DateTime?,
      if (updated != ignore) 9: updated as DateTime?,
    });
  }
}

extension RandomizedRunQueryUpdate on IsarQuery<RandomizedRun> {
  _RandomizedRunQueryUpdate get updateFirst =>
      _RandomizedRunQueryUpdateImpl(this, limit: 1);

  _RandomizedRunQueryUpdate get updateAll =>
      _RandomizedRunQueryUpdateImpl(this);
}

extension RandomizedRunQueryFilter
    on QueryBuilder<RandomizedRun, RandomizedRun, QFilterCondition> {
  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsIsEmpty() {
    return not().inclusiveTagsUuidsIsNotEmpty();
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      inclusiveTagsUuidsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 1, value: null),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsIsEmpty() {
    return not().exclusiveTagsUuidsIsNotEmpty();
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      exclusiveTagsUuidsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 2, value: null),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ratingLinksIsEmpty() {
    return not().ratingLinksIsNotEmpty();
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ratingLinksIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 3, value: null),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealNotFeastSinceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealNotFeastSinceIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 4));
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealNotFeastSinceEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealNotFeastSinceGreaterThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealNotFeastSinceGreaterThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealNotFeastSinceLessThan(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealNotFeastSinceLessThanOrEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealNotFeastSinceBetween(
    DateTime? lower,
    DateTime? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      mealUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      feastEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      uuidGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      uuidGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      uuidLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      uuidLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition> uuidBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      uuidContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 7,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 7,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 7,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 7,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      createdEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      createdGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      createdGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      createdLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      createdLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 8,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      createdBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 8,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      updatedEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      updatedGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      updatedGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      updatedLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      updatedLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 9,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      updatedBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 9,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension RandomizedRunQueryObject
    on QueryBuilder<RandomizedRun, RandomizedRun, QFilterCondition> {}

extension RandomizedRunQuerySortBy
    on QueryBuilder<RandomizedRun, RandomizedRun, QSortBy> {
  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy>
      sortByMealNotFeastSince() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy>
      sortByMealNotFeastSinceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByMealUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByMealUuidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByFeast() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByFeastDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        7,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByUuidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        7,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc);
    });
  }
}

extension RandomizedRunQuerySortThenBy
    on QueryBuilder<RandomizedRun, RandomizedRun, QSortThenBy> {
  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy>
      thenByMealNotFeastSince() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy>
      thenByMealNotFeastSinceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByMealUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByMealUuidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByFeast() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByFeastDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByUuidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc);
    });
  }
}

extension RandomizedRunQueryWhereDistinct
    on QueryBuilder<RandomizedRun, RandomizedRun, QDistinct> {
  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByInclusiveTagsUuids() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByExclusiveTagsUuids() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByMealNotFeastSince() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct> distinctByMealUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct> distinctByFeast() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(8);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(9);
    });
  }
}

extension RandomizedRunQueryProperty1
    on QueryBuilder<RandomizedRun, RandomizedRun, QProperty> {
  QueryBuilder<RandomizedRun, List<String>, QAfterProperty>
      inclusiveTagsUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<RandomizedRun, List<String>, QAfterProperty>
      exclusiveTagsUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<RandomizedRun, List<RatingLink>, QAfterProperty>
      ratingLinksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<RandomizedRun, DateTime?, QAfterProperty>
      mealNotFeastSinceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<RandomizedRun, String, QAfterProperty> mealUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<RandomizedRun, bool, QAfterProperty> feastProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<RandomizedRun, String, QAfterProperty> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<RandomizedRun, DateTime, QAfterProperty> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<RandomizedRun, DateTime, QAfterProperty> updatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }
}

extension RandomizedRunQueryProperty2<R>
    on QueryBuilder<RandomizedRun, R, QAfterProperty> {
  QueryBuilder<RandomizedRun, (R, List<String>), QAfterProperty>
      inclusiveTagsUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<RandomizedRun, (R, List<String>), QAfterProperty>
      exclusiveTagsUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<RandomizedRun, (R, List<RatingLink>), QAfterProperty>
      ratingLinksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<RandomizedRun, (R, DateTime?), QAfterProperty>
      mealNotFeastSinceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<RandomizedRun, (R, String), QAfterProperty> mealUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<RandomizedRun, (R, bool), QAfterProperty> feastProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<RandomizedRun, (R, String), QAfterProperty> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<RandomizedRun, (R, DateTime), QAfterProperty> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<RandomizedRun, (R, DateTime), QAfterProperty> updatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }
}

extension RandomizedRunQueryProperty3<R1, R2>
    on QueryBuilder<RandomizedRun, (R1, R2), QAfterProperty> {
  QueryBuilder<RandomizedRun, (R1, R2, List<String>), QOperations>
      inclusiveTagsUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, List<String>), QOperations>
      exclusiveTagsUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, List<RatingLink>), QOperations>
      ratingLinksProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, DateTime?), QOperations>
      mealNotFeastSinceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, String), QOperations>
      mealUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, bool), QOperations> feastProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, String), QOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, DateTime), QOperations>
      createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, DateTime), QOperations>
      updatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }
}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomizedRunsHash() => r'd19a291e2f2163357353e79671cee3637c0b3b29';

/// See also [RandomizedRuns].
@ProviderFor(RandomizedRuns)
final randomizedRunsProvider = AutoDisposeAsyncNotifierProvider<RandomizedRuns,
    List<RandomizedRun>>.internal(
  RandomizedRuns.new,
  name: r'randomizedRunsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$randomizedRunsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RandomizedRuns = AutoDisposeAsyncNotifier<List<RandomizedRun>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
