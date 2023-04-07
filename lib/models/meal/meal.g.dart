// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetMealCollection on Isar {
  IsarCollection<Meal> get meals => this.collection();
}

const MealSchema = CollectionSchema(
  name: r'Meal',
  id: 2462895270179255875,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'imagesUUIDs': PropertySchema(
      id: 1,
      name: r'imagesUUIDs',
      type: IsarType.stringList,
    ),
    r'ingredients': PropertySchema(
      id: 2,
      name: r'ingredients',
      type: IsarType.objectList,
      target: r'IngredientMap',
    ),
    r'instructions': PropertySchema(
      id: 3,
      name: r'instructions',
      type: IsarType.string,
    ),
    r'lastTimeAte': PropertySchema(
      id: 4,
      name: r'lastTimeAte',
      type: IsarType.dateTime,
    ),
    r'lastTimeRandomized': PropertySchema(
      id: 5,
      name: r'lastTimeRandomized',
      type: IsarType.dateTime,
    ),
    r'name': PropertySchema(
      id: 6,
      name: r'name',
      type: IsarType.string,
    ),
    r'ratings': PropertySchema(
      id: 7,
      name: r'ratings',
      type: IsarType.objectList,
      target: r'RatingMap',
    ),
    r'thumbnailUUID': PropertySchema(
      id: 8,
      name: r'thumbnailUUID',
      type: IsarType.string,
    ),
    r'uuid': PropertySchema(
      id: 9,
      name: r'uuid',
      type: IsarType.string,
    )
  },
  estimateSize: _mealEstimateSize,
  serialize: _mealSerialize,
  deserialize: _mealDeserialize,
  deserializeProp: _mealDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'uuid': IndexSchema(
      id: 2134397340427724972,
      name: r'uuid',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'uuid',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {
    r'tags': LinkSchema(
      id: -2933018270435141161,
      name: r'tags',
      target: r'Tag',
      single: false,
    )
  },
  embeddedSchemas: {
    r'RatingMap': RatingMapSchema,
    r'IngredientMap': IngredientMapSchema
  },
  getId: _mealGetId,
  getLinks: _mealGetLinks,
  attach: _mealAttach,
  version: '3.0.5',
);

int _mealEstimateSize(
  Meal object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.imagesUUIDs.length * 3;
  {
    for (var i = 0; i < object.imagesUUIDs.length; i++) {
      final value = object.imagesUUIDs[i];
      bytesCount += value.length * 3;
    }
  }
  bytesCount += 3 + object.ingredients.length * 3;
  {
    final offsets = allOffsets[IngredientMap]!;
    for (var i = 0; i < object.ingredients.length; i++) {
      final value = object.ingredients[i];
      bytesCount +=
          IngredientMapSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.instructions;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.ratings.length * 3;
  {
    final offsets = allOffsets[RatingMap]!;
    for (var i = 0; i < object.ratings.length; i++) {
      final value = object.ratings[i];
      bytesCount += RatingMapSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  {
    final value = object.thumbnailUUID;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.uuid.length * 3;
  return bytesCount;
}

void _mealSerialize(
  Meal object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeStringList(offsets[1], object.imagesUUIDs);
  writer.writeObjectList<IngredientMap>(
    offsets[2],
    allOffsets,
    IngredientMapSchema.serialize,
    object.ingredients,
  );
  writer.writeString(offsets[3], object.instructions);
  writer.writeDateTime(offsets[4], object.lastTimeAte);
  writer.writeDateTime(offsets[5], object.lastTimeRandomized);
  writer.writeString(offsets[6], object.name);
  writer.writeObjectList<RatingMap>(
    offsets[7],
    allOffsets,
    RatingMapSchema.serialize,
    object.ratings,
  );
  writer.writeString(offsets[8], object.thumbnailUUID);
  writer.writeString(offsets[9], object.uuid);
}

Meal _mealDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Meal();
  object.createdAt = reader.readDateTime(offsets[0]);
  object.imagesUUIDs = reader.readStringList(offsets[1]) ?? [];
  object.ingredients = reader.readObjectList<IngredientMap>(
        offsets[2],
        IngredientMapSchema.deserialize,
        allOffsets,
        IngredientMap(),
      ) ??
      [];
  object.instructions = reader.readStringOrNull(offsets[3]);
  object.lastTimeAte = reader.readDateTimeOrNull(offsets[4]);
  object.lastTimeRandomized = reader.readDateTimeOrNull(offsets[5]);
  object.name = reader.readString(offsets[6]);
  object.ratings = reader.readObjectList<RatingMap>(
        offsets[7],
        RatingMapSchema.deserialize,
        allOffsets,
        RatingMap(),
      ) ??
      [];
  object.thumbnailUUID = reader.readStringOrNull(offsets[8]);
  object.uuid = reader.readString(offsets[9]);
  return object;
}

P _mealDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringList(offset) ?? []) as P;
    case 2:
      return (reader.readObjectList<IngredientMap>(
            offset,
            IngredientMapSchema.deserialize,
            allOffsets,
            IngredientMap(),
          ) ??
          []) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 6:
      return (reader.readString(offset)) as P;
    case 7:
      return (reader.readObjectList<RatingMap>(
            offset,
            RatingMapSchema.deserialize,
            allOffsets,
            RatingMap(),
          ) ??
          []) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mealGetId(Meal object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _mealGetLinks(Meal object) {
  return [object.tags];
}

void _mealAttach(IsarCollection<dynamic> col, Id id, Meal object) {
  object.tags.attach(col, col.isar.collection<Tag>(), r'tags', id);
}

extension MealByIndex on IsarCollection<Meal> {
  Future<Meal?> getByUuid(String uuid) {
    return getByIndex(r'uuid', [uuid]);
  }

  Meal? getByUuidSync(String uuid) {
    return getByIndexSync(r'uuid', [uuid]);
  }

  Future<bool> deleteByUuid(String uuid) {
    return deleteByIndex(r'uuid', [uuid]);
  }

  bool deleteByUuidSync(String uuid) {
    return deleteByIndexSync(r'uuid', [uuid]);
  }

  Future<List<Meal?>> getAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndex(r'uuid', values);
  }

  List<Meal?> getAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'uuid', values);
  }

  Future<int> deleteAllByUuid(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'uuid', values);
  }

  int deleteAllByUuidSync(List<String> uuidValues) {
    final values = uuidValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'uuid', values);
  }

  Future<Id> putByUuid(Meal object) {
    return putByIndex(r'uuid', object);
  }

  Id putByUuidSync(Meal object, {bool saveLinks = true}) {
    return putByIndexSync(r'uuid', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByUuid(List<Meal> objects) {
    return putAllByIndex(r'uuid', objects);
  }

  List<Id> putAllByUuidSync(List<Meal> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'uuid', objects, saveLinks: saveLinks);
  }
}

extension MealQueryWhereSort on QueryBuilder<Meal, Meal, QWhere> {
  QueryBuilder<Meal, Meal, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MealQueryWhere on QueryBuilder<Meal, Meal, QWhereClause> {
  QueryBuilder<Meal, Meal, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> uuidEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'uuid',
        value: [uuid],
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterWhereClause> uuidNotEqualTo(String uuid) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [uuid],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'uuid',
              lower: [],
              upper: [uuid],
              includeUpper: false,
            ));
      }
    });
  }
}

extension MealQueryFilter on QueryBuilder<Meal, Meal, QFilterCondition> {
  QueryBuilder<Meal, Meal, QAfterFilterCondition> createdAtEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'createdAt',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'createdAt',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsElementEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagesUUIDs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'imagesUUIDs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'imagesUUIDs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'imagesUUIDs',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsElementStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'imagesUUIDs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsElementEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'imagesUUIDs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsElementContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'imagesUUIDs',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsElementMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'imagesUUIDs',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'imagesUUIDs',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      imagesUUIDsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'imagesUUIDs',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesUUIDs',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesUUIDs',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesUUIDs',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesUUIDs',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesUUIDs',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> imagesUUIDsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesUUIDs',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ingredientsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ingredientsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ingredientsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ingredientsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ingredientsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ingredientsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ingredients',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'instructions',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'instructions',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'instructions',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'instructions',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'instructions',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'instructions',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> instructionsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'instructions',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> lastTimeAteIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastTimeAte',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> lastTimeAteIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastTimeAte',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> lastTimeAteEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastTimeAte',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> lastTimeAteGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastTimeAte',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> lastTimeAteLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastTimeAte',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> lastTimeAteBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastTimeAte',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> lastTimeRandomizedIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'lastTimeRandomized',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition>
      lastTimeRandomizedIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'lastTimeRandomized',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> lastTimeRandomizedEqualTo(
      DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastTimeRandomized',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> lastTimeRandomizedGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastTimeRandomized',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> lastTimeRandomizedLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastTimeRandomized',
        value: value,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> lastTimeRandomizedBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastTimeRandomized',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nameContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nameMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ratingsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ratings',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ratingsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ratings',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ratingsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ratings',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ratingsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ratings',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ratingsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ratings',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ratingsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'ratings',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'thumbnailUUID',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'thumbnailUUID',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnailUUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'thumbnailUUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'thumbnailUUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'thumbnailUUID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'thumbnailUUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'thumbnailUUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'thumbnailUUID',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'thumbnailUUID',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'thumbnailUUID',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> thumbnailUUIDIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'thumbnailUUID',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> uuidEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> uuidGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> uuidLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> uuidBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> uuidContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> uuidMatches(String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }
}

extension MealQueryObject on QueryBuilder<Meal, Meal, QFilterCondition> {
  QueryBuilder<Meal, Meal, QAfterFilterCondition> ingredientsElement(
      FilterQuery<IngredientMap> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ingredients');
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> ratingsElement(
      FilterQuery<RatingMap> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'ratings');
    });
  }
}

extension MealQueryLinks on QueryBuilder<Meal, Meal, QFilterCondition> {
  QueryBuilder<Meal, Meal, QAfterFilterCondition> tags(FilterQuery<Tag> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'tags');
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> tagsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', length, true, length, true);
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> tagsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, true, 0, true);
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> tagsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, false, 999999, true);
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> tagsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', 0, true, length, include);
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> tagsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'tags', length, include, 999999, true);
    });
  }

  QueryBuilder<Meal, Meal, QAfterFilterCondition> tagsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'tags', lower, includeLower, upper, includeUpper);
    });
  }
}

extension MealQuerySortBy on QueryBuilder<Meal, Meal, QSortBy> {
  QueryBuilder<Meal, Meal, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByLastTimeAte() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTimeAte', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByLastTimeAteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTimeAte', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByLastTimeRandomized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTimeRandomized', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByLastTimeRandomizedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTimeRandomized', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByThumbnailUUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUUID', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByThumbnailUUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUUID', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> sortByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension MealQuerySortThenBy on QueryBuilder<Meal, Meal, QSortThenBy> {
  QueryBuilder<Meal, Meal, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByInstructions() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByInstructionsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'instructions', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByLastTimeAte() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTimeAte', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByLastTimeAteDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTimeAte', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByLastTimeRandomized() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTimeRandomized', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByLastTimeRandomizedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastTimeRandomized', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByThumbnailUUID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUUID', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByThumbnailUUIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'thumbnailUUID', Sort.desc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByUuid() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.asc);
    });
  }

  QueryBuilder<Meal, Meal, QAfterSortBy> thenByUuidDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'uuid', Sort.desc);
    });
  }
}

extension MealQueryWhereDistinct on QueryBuilder<Meal, Meal, QDistinct> {
  QueryBuilder<Meal, Meal, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByImagesUUIDs() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagesUUIDs');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByInstructions(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'instructions', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByLastTimeAte() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastTimeAte');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByLastTimeRandomized() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastTimeRandomized');
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByThumbnailUUID(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'thumbnailUUID',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<Meal, Meal, QDistinct> distinctByUuid(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'uuid', caseSensitive: caseSensitive);
    });
  }
}

extension MealQueryProperty on QueryBuilder<Meal, Meal, QQueryProperty> {
  QueryBuilder<Meal, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Meal, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<Meal, List<String>, QQueryOperations> imagesUUIDsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagesUUIDs');
    });
  }

  QueryBuilder<Meal, List<IngredientMap>, QQueryOperations>
      ingredientsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ingredients');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> instructionsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'instructions');
    });
  }

  QueryBuilder<Meal, DateTime?, QQueryOperations> lastTimeAteProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastTimeAte');
    });
  }

  QueryBuilder<Meal, DateTime?, QQueryOperations> lastTimeRandomizedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastTimeRandomized');
    });
  }

  QueryBuilder<Meal, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<Meal, List<RatingMap>, QQueryOperations> ratingsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ratings');
    });
  }

  QueryBuilder<Meal, String?, QQueryOperations> thumbnailUUIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'thumbnailUUID');
    });
  }

  QueryBuilder<Meal, String, QQueryOperations> uuidProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'uuid');
    });
  }
}

// **************************************************************************
// IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const RatingMapSchema = Schema(
  name: r'RatingMap',
  id: -1237193197385617406,
  properties: {
    r'uuid': PropertySchema(
      id: 0,
      name: r'uuid',
      type: IsarType.string,
    ),
    r'value': PropertySchema(
      id: 1,
      name: r'value',
      type: IsarType.string,
      enumMap: _RatingMapvalueEnumValueMap,
    )
  },
  estimateSize: _ratingMapEstimateSize,
  serialize: _ratingMapSerialize,
  deserialize: _ratingMapDeserialize,
  deserializeProp: _ratingMapDeserializeProp,
);

int _ratingMapEstimateSize(
  RatingMap object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.uuid;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.value;
    if (value != null) {
      bytesCount += 3 + value.name.length * 3;
    }
  }
  return bytesCount;
}

void _ratingMapSerialize(
  RatingMap object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.uuid);
  writer.writeString(offsets[1], object.value?.name);
}

RatingMap _ratingMapDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = RatingMap();
  object.uuid = reader.readStringOrNull(offsets[0]);
  object.value =
      _RatingMapvalueValueEnumMap[reader.readStringOrNull(offsets[1])];
  return object;
}

P _ratingMapDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (_RatingMapvalueValueEnumMap[reader.readStringOrNull(offset)])
          as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _RatingMapvalueEnumValueMap = {
  r'one': r'one',
  r'two': r'two',
  r'three': r'three',
  r'four': r'four',
  r'five': r'five',
};
const _RatingMapvalueValueEnumMap = {
  r'one': RatingValue.one,
  r'two': RatingValue.two,
  r'three': RatingValue.three,
  r'four': RatingValue.four,
  r'five': RatingValue.five,
};

extension RatingMapQueryFilter
    on QueryBuilder<RatingMap, RatingMap, QFilterCondition> {
  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuid',
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuid',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuid',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuid',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> uuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuid',
        value: '',
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'value',
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueEqualTo(
    RatingValue? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueGreaterThan(
    RatingValue? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueLessThan(
    RatingValue? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueBetween(
    RatingValue? lower,
    RatingValue? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'value',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'value',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'value',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'value',
        value: '',
      ));
    });
  }

  QueryBuilder<RatingMap, RatingMap, QAfterFilterCondition> valueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'value',
        value: '',
      ));
    });
  }
}

extension RatingMapQueryObject
    on QueryBuilder<RatingMap, RatingMap, QFilterCondition> {}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

const IngredientMapSchema = Schema(
  name: r'IngredientMap',
  id: -1765431288580713845,
  properties: {
    r'amount': PropertySchema(
      id: 0,
      name: r'amount',
      type: IsarType.double,
    ),
    r'uuidIngredient': PropertySchema(
      id: 1,
      name: r'uuidIngredient',
      type: IsarType.string,
    ),
    r'uuidUnit': PropertySchema(
      id: 2,
      name: r'uuidUnit',
      type: IsarType.string,
    )
  },
  estimateSize: _ingredientMapEstimateSize,
  serialize: _ingredientMapSerialize,
  deserialize: _ingredientMapDeserialize,
  deserializeProp: _ingredientMapDeserializeProp,
);

int _ingredientMapEstimateSize(
  IngredientMap object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.uuidIngredient;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.uuidUnit;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _ingredientMapSerialize(
  IngredientMap object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDouble(offsets[0], object.amount);
  writer.writeString(offsets[1], object.uuidIngredient);
  writer.writeString(offsets[2], object.uuidUnit);
}

IngredientMap _ingredientMapDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = IngredientMap();
  object.amount = reader.readDoubleOrNull(offsets[0]);
  object.uuidIngredient = reader.readStringOrNull(offsets[1]);
  object.uuidUnit = reader.readStringOrNull(offsets[2]);
  return object;
}

P _ingredientMapDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDoubleOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

extension IngredientMapQueryFilter
    on QueryBuilder<IngredientMap, IngredientMap, QFilterCondition> {
  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      amountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      amountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'amount',
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      amountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      amountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      amountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'amount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      amountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'amount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuidIngredient',
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuidIngredient',
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuidIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuidIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuidIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuidIngredient',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuidIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuidIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuidIngredient',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuidIngredient',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuidIngredient',
        value: '',
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidIngredientIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuidIngredient',
        value: '',
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'uuidUnit',
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'uuidUnit',
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuidUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'uuidUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'uuidUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'uuidUnit',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'uuidUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'uuidUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'uuidUnit',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'uuidUnit',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'uuidUnit',
        value: '',
      ));
    });
  }

  QueryBuilder<IngredientMap, IngredientMap, QAfterFilterCondition>
      uuidUnitIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'uuidUnit',
        value: '',
      ));
    });
  }
}

extension IngredientMapQueryObject
    on QueryBuilder<IngredientMap, IngredientMap, QFilterCondition> {}

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$mealsHash() => r'7ea244ac38e3960fe70d8267231e034d17fcc511';

/// See also [Meals].
@ProviderFor(Meals)
final mealsProvider =
    AutoDisposeAsyncNotifierProvider<Meals, List<Meal>>.internal(
  Meals.new,
  name: r'mealsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$mealsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Meals = AutoDisposeAsyncNotifier<List<Meal>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
