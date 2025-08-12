// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'randomized_run.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetRandomizedRunCollection on Isar {
  IsarCollection<String, RandomizedRun> get randomizedRuns => this.collection();
}

const RandomizedRunSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'RandomizedRun',
    idName: 'uuid',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'includedTagsUuids',
        type: IsarType.stringList,
      ),
      IsarPropertySchema(
        name: 'excludedTagsUuids',
        type: IsarType.stringList,
      ),
      IsarPropertySchema(
        name: 'ratingLinks',
        type: IsarType.objectList,
        target: 'RatingLink',
      ),
      IsarPropertySchema(
        name: 'ingredientUuids',
        type: IsarType.stringList,
      ),
      IsarPropertySchema(
        name: 'daysNotEaten',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'mealUuid',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'manuallyEaten',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'eaten',
        type: IsarType.bool,
      ),
      IsarPropertySchema(
        name: 'uuid',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'created',
        type: IsarType.dateTime,
      ),
      IsarPropertySchema(
        name: 'updated',
        type: IsarType.dateTime,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<String, RandomizedRun>(
    serialize: serializeRandomizedRun,
    deserialize: deserializeRandomizedRun,
    deserializeProperty: deserializeRandomizedRunProp,
  ),
  embeddedSchemas: [RatingLinkSchema],
);

@isarProtected
int serializeRandomizedRun(IsarWriter writer, RandomizedRun object) {
  {
    final list = object.includedTagsUuids;
    final listWriter = IsarCore.beginList(writer, 1, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  {
    final list = object.excludedTagsUuids;
    final listWriter = IsarCore.beginList(writer, 2, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
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
  {
    final list = object.includedIngredientUuids;
    final listWriter = IsarCore.beginList(writer, 4, list.length);
    for (var i = 0; i < list.length; i++) {
      IsarCore.writeString(listWriter, i, list[i]);
    }
    IsarCore.endList(writer, listWriter);
  }
  IsarCore.writeLong(writer, 5, object.daysNotEaten ?? -9223372036854775808);
  IsarCore.writeString(writer, 6, object.mealUuid);
  IsarCore.writeBool(writer, 7, object.manuallyEaten);
  IsarCore.writeBool(writer, 8, object.eaten);
  IsarCore.writeString(writer, 9, object.uuid);
  IsarCore.writeLong(writer, 10, object.created.toUtc().microsecondsSinceEpoch);
  IsarCore.writeLong(writer, 11, object.updated.toUtc().microsecondsSinceEpoch);
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
        object.includedTagsUuids = const <String>[];
      } else {
        final list = List<String>.filled(length, '', growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readString(reader, i) ?? '';
        }
        IsarCore.freeReader(reader);
        object.includedTagsUuids = list;
      }
    }
  }
  {
    final length = IsarCore.readList(reader, 2, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        object.excludedTagsUuids = const <String>[];
      } else {
        final list = List<String>.filled(length, '', growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readString(reader, i) ?? '';
        }
        IsarCore.freeReader(reader);
        object.excludedTagsUuids = list;
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
    final length = IsarCore.readList(reader, 4, IsarCore.readerPtrPtr);
    {
      final reader = IsarCore.readerPtr;
      if (reader.isNull) {
        object.includedIngredientUuids = const <String>[];
      } else {
        final list = List<String>.filled(length, '', growable: true);
        for (var i = 0; i < length; i++) {
          list[i] = IsarCore.readString(reader, i) ?? '';
        }
        IsarCore.freeReader(reader);
        object.includedIngredientUuids = list;
      }
    }
  }
  {
    final value = IsarCore.readLong(reader, 5);
    if (value == -9223372036854775808) {
      object.daysNotEaten = null;
    } else {
      object.daysNotEaten = value;
    }
  }
  object.mealUuid = IsarCore.readString(reader, 6) ?? '';
  object.manuallyEaten = IsarCore.readBool(reader, 7);
  object.eaten = IsarCore.readBool(reader, 8);
  object.uuid = IsarCore.readString(reader, 9) ?? '';
  {
    final value = IsarCore.readLong(reader, 10);
    if (value == -9223372036854775808) {
      object.created =
          DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
    } else {
      object.created = DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true);
    }
  }
  {
    final value = IsarCore.readLong(reader, 11);
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
        final length = IsarCore.readList(reader, 4, IsarCore.readerPtrPtr);
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
    case 5:
      {
        final value = IsarCore.readLong(reader, 5);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return value;
        }
      }
    case 6:
      return IsarCore.readString(reader, 6) ?? '';
    case 7:
      return IsarCore.readBool(reader, 7);
    case 8:
      return IsarCore.readBool(reader, 8);
    case 9:
      return IsarCore.readString(reader, 9) ?? '';
    case 10:
      {
        final value = IsarCore.readLong(reader, 10);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true);
        }
      }
    case 11:
      {
        final value = IsarCore.readLong(reader, 11);
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
    int? daysNotEaten,
    String? mealUuid,
    bool? manuallyEaten,
    bool? eaten,
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
    Object? daysNotEaten = ignore,
    Object? mealUuid = ignore,
    Object? manuallyEaten = ignore,
    Object? eaten = ignore,
    Object? created = ignore,
    Object? updated = ignore,
  }) {
    return collection.updateProperties([
          uuid
        ], {
          if (daysNotEaten != ignore) 5: daysNotEaten as int?,
          if (mealUuid != ignore) 6: mealUuid as String?,
          if (manuallyEaten != ignore) 7: manuallyEaten as bool?,
          if (eaten != ignore) 8: eaten as bool?,
          if (created != ignore) 10: created as DateTime?,
          if (updated != ignore) 11: updated as DateTime?,
        }) >
        0;
  }
}

sealed class _RandomizedRunUpdateAll {
  int call({
    required List<String> uuid,
    int? daysNotEaten,
    String? mealUuid,
    bool? manuallyEaten,
    bool? eaten,
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
    Object? daysNotEaten = ignore,
    Object? mealUuid = ignore,
    Object? manuallyEaten = ignore,
    Object? eaten = ignore,
    Object? created = ignore,
    Object? updated = ignore,
  }) {
    return collection.updateProperties(uuid, {
      if (daysNotEaten != ignore) 5: daysNotEaten as int?,
      if (mealUuid != ignore) 6: mealUuid as String?,
      if (manuallyEaten != ignore) 7: manuallyEaten as bool?,
      if (eaten != ignore) 8: eaten as bool?,
      if (created != ignore) 10: created as DateTime?,
      if (updated != ignore) 11: updated as DateTime?,
    });
  }
}

extension RandomizedRunUpdate on IsarCollection<String, RandomizedRun> {
  _RandomizedRunUpdate get update => _RandomizedRunUpdateImpl(this);

  _RandomizedRunUpdateAll get updateAll => _RandomizedRunUpdateAllImpl(this);
}

sealed class _RandomizedRunQueryUpdate {
  int call({
    int? daysNotEaten,
    String? mealUuid,
    bool? manuallyEaten,
    bool? eaten,
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
    Object? daysNotEaten = ignore,
    Object? mealUuid = ignore,
    Object? manuallyEaten = ignore,
    Object? eaten = ignore,
    Object? created = ignore,
    Object? updated = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (daysNotEaten != ignore) 5: daysNotEaten as int?,
      if (mealUuid != ignore) 6: mealUuid as String?,
      if (manuallyEaten != ignore) 7: manuallyEaten as bool?,
      if (eaten != ignore) 8: eaten as bool?,
      if (created != ignore) 10: created as DateTime?,
      if (updated != ignore) 11: updated as DateTime?,
    });
  }
}

extension RandomizedRunQueryUpdate on IsarQuery<RandomizedRun> {
  _RandomizedRunQueryUpdate get updateFirst =>
      _RandomizedRunQueryUpdateImpl(this, limit: 1);

  _RandomizedRunQueryUpdate get updateAll =>
      _RandomizedRunQueryUpdateImpl(this);
}

class _RandomizedRunQueryBuilderUpdateImpl
    implements _RandomizedRunQueryUpdate {
  const _RandomizedRunQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<RandomizedRun, RandomizedRun, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? daysNotEaten = ignore,
    Object? mealUuid = ignore,
    Object? manuallyEaten = ignore,
    Object? eaten = ignore,
    Object? created = ignore,
    Object? updated = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (daysNotEaten != ignore) 5: daysNotEaten as int?,
        if (mealUuid != ignore) 6: mealUuid as String?,
        if (manuallyEaten != ignore) 7: manuallyEaten as bool?,
        if (eaten != ignore) 8: eaten as bool?,
        if (created != ignore) 10: created as DateTime?,
        if (updated != ignore) 11: updated as DateTime?,
      });
    } finally {
      q.close();
    }
  }
}

extension RandomizedRunQueryBuilderUpdate
    on QueryBuilder<RandomizedRun, RandomizedRun, QOperations> {
  _RandomizedRunQueryUpdate get updateFirst =>
      _RandomizedRunQueryBuilderUpdateImpl(this, limit: 1);

  _RandomizedRunQueryUpdate get updateAll =>
      _RandomizedRunQueryBuilderUpdateImpl(this);
}

extension RandomizedRunQueryFilter
    on QueryBuilder<RandomizedRun, RandomizedRun, QFilterCondition> {
  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      includedTagsUuidsElementEqualTo(
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
      includedTagsUuidsElementGreaterThan(
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
      includedTagsUuidsElementGreaterThanOrEqualTo(
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
      includedTagsUuidsElementLessThan(
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
      includedTagsUuidsElementLessThanOrEqualTo(
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
      includedTagsUuidsElementBetween(
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
      includedTagsUuidsElementStartsWith(
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
      includedTagsUuidsElementEndsWith(
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
      includedTagsUuidsElementContains(String value,
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
      includedTagsUuidsElementMatches(String pattern,
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
      includedTagsUuidsElementIsEmpty() {
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
      includedTagsUuidsElementIsNotEmpty() {
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
      includedTagsUuidsIsEmpty() {
    return not().includedTagsUuidsIsNotEmpty();
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      includedTagsUuidsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 1, value: null),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      excludedTagsUuidsElementEqualTo(
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
      excludedTagsUuidsElementGreaterThan(
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
      excludedTagsUuidsElementGreaterThanOrEqualTo(
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
      excludedTagsUuidsElementLessThan(
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
      excludedTagsUuidsElementLessThanOrEqualTo(
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
      excludedTagsUuidsElementBetween(
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
      excludedTagsUuidsElementStartsWith(
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
      excludedTagsUuidsElementEndsWith(
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
      excludedTagsUuidsElementContains(String value,
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
      excludedTagsUuidsElementMatches(String pattern,
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
      excludedTagsUuidsElementIsEmpty() {
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
      excludedTagsUuidsElementIsNotEmpty() {
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
      excludedTagsUuidsIsEmpty() {
    return not().excludedTagsUuidsIsNotEmpty();
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      excludedTagsUuidsIsNotEmpty() {
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
      ingredientUuidsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsElementGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsElementGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsElementLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsElementLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsElementBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsElementContains(String value,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsElementMatches(String pattern,
          {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsIsEmpty() {
    return not().ingredientUuidsIsNotEmpty();
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      ingredientUuidsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterOrEqualCondition(property: 4, value: null),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      daysNotEatenIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      daysNotEatenIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 5));
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      daysNotEatenEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      daysNotEatenGreaterThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      daysNotEatenGreaterThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      daysNotEatenLessThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      daysNotEatenLessThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      daysNotEatenBetween(
    int? lower,
    int? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
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
          property: 6,
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
          property: 6,
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
          property: 6,
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
          property: 6,
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
          property: 6,
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
          property: 6,
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
          property: 6,
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
          property: 6,
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
          property: 6,
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
          property: 6,
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
          property: 6,
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
          property: 6,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      manuallyEatenEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition>
      eatenEqualTo(
    bool value,
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

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 9,
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
          property: 9,
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
          property: 9,
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
          property: 9,
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
          property: 9,
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
          property: 9,
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
          property: 9,
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
          property: 9,
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
          property: 9,
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
          property: 9,
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
          property: 9,
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
          property: 9,
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
          property: 10,
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
          property: 10,
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
          property: 10,
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
          property: 10,
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
          property: 10,
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
          property: 10,
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
          property: 11,
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
          property: 11,
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
          property: 11,
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
          property: 11,
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
          property: 11,
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
          property: 11,
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
      sortByDaysNotEaten() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy>
      sortByDaysNotEatenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByMealUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByMealUuidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        6,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy>
      sortByManuallyEaten() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy>
      sortByManuallyEatenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByEaten() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByEatenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        9,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByUuidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        9,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> sortByUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11, sort: Sort.desc);
    });
  }
}

extension RandomizedRunQuerySortThenBy
    on QueryBuilder<RandomizedRun, RandomizedRun, QSortThenBy> {
  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy>
      thenByDaysNotEaten() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy>
      thenByDaysNotEatenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByMealUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByMealUuidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy>
      thenByManuallyEaten() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy>
      thenByManuallyEatenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByEaten() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByEatenDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(8, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByUuidDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(9, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByCreatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(10, sort: Sort.desc);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterSortBy> thenByUpdatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(11, sort: Sort.desc);
    });
  }
}

extension RandomizedRunQueryWhereDistinct
    on QueryBuilder<RandomizedRun, RandomizedRun, QDistinct> {
  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByIncludedTagsUuids() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByExcludedTagsUuids() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByIngredientUuids() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByDaysNotEaten() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct> distinctByMealUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByManuallyEaten() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(7);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct> distinctByEaten() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(8);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByCreated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(10);
    });
  }

  QueryBuilder<RandomizedRun, RandomizedRun, QAfterDistinct>
      distinctByUpdated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(11);
    });
  }
}

extension RandomizedRunQueryProperty1
    on QueryBuilder<RandomizedRun, RandomizedRun, QProperty> {
  QueryBuilder<RandomizedRun, List<String>, QAfterProperty>
      includedTagsUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<RandomizedRun, List<String>, QAfterProperty>
      excludedTagsUuidsProperty() {
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

  QueryBuilder<RandomizedRun, List<String>, QAfterProperty>
      ingredientUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<RandomizedRun, int?, QAfterProperty> daysNotEatenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<RandomizedRun, String, QAfterProperty> mealUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<RandomizedRun, bool, QAfterProperty> manuallyEatenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<RandomizedRun, bool, QAfterProperty> eatenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<RandomizedRun, String, QAfterProperty> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<RandomizedRun, DateTime, QAfterProperty> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<RandomizedRun, DateTime, QAfterProperty> updatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }
}

extension RandomizedRunQueryProperty2<R>
    on QueryBuilder<RandomizedRun, R, QAfterProperty> {
  QueryBuilder<RandomizedRun, (R, List<String>), QAfterProperty>
      includedTagsUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<RandomizedRun, (R, List<String>), QAfterProperty>
      excludedTagsUuidsProperty() {
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

  QueryBuilder<RandomizedRun, (R, List<String>), QAfterProperty>
      ingredientUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<RandomizedRun, (R, int?), QAfterProperty>
      daysNotEatenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<RandomizedRun, (R, String), QAfterProperty> mealUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<RandomizedRun, (R, bool), QAfterProperty>
      manuallyEatenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<RandomizedRun, (R, bool), QAfterProperty> eatenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<RandomizedRun, (R, String), QAfterProperty> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<RandomizedRun, (R, DateTime), QAfterProperty> createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<RandomizedRun, (R, DateTime), QAfterProperty> updatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
    });
  }
}

extension RandomizedRunQueryProperty3<R1, R2>
    on QueryBuilder<RandomizedRun, (R1, R2), QAfterProperty> {
  QueryBuilder<RandomizedRun, (R1, R2, List<String>), QOperations>
      includedTagsUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, List<String>), QOperations>
      excludedTagsUuidsProperty() {
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

  QueryBuilder<RandomizedRun, (R1, R2, List<String>), QOperations>
      ingredientUuidsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, int?), QOperations>
      daysNotEatenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, String), QOperations>
      mealUuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, bool), QOperations>
      manuallyEatenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, bool), QOperations> eatenProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(8);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, String), QOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(9);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, DateTime), QOperations>
      createdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(10);
    });
  }

  QueryBuilder<RandomizedRun, (R1, R2, DateTime), QOperations>
      updatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(11);
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
