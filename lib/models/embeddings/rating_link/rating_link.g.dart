// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_link.dart';

// **************************************************************************
// _IsarEmbeddedGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors

const ratingLinkSchemaHash = 3831148368175904900;
const RatingLinkSchema = IsarSchema(
  schema:
      '{"name":"RatingLink","idName":null,"embedded":true,"properties":[{"name":"ratingUuid","type":"String"},{"name":"value","type":"Byte","enumMap":{"one":0,"two":1,"three":2,"four":3,"five":4}}]}',
  converter: IsarObjectConverter<void, RatingLink>(
    serialize: serializeRatingLink,
    deserialize: deserializeRatingLink,
  ),
);

@isarProtected
int serializeRatingLink(IsarWriter writer, RatingLink object) {
  {
    final value = object.ratingUuid;
    if (value == null) {
      IsarCore.writeNull(writer, 1);
    } else {
      IsarCore.writeString(writer, 1, IsarCore.toNativeString(value));
    }
  }
  IsarCore.writeByte(writer, 2, object.value.index);
  return 0;
}

@isarProtected
RatingLink deserializeRatingLink(IsarReader reader) {
  final object = RatingLink();
  object.ratingUuid = IsarCore.readString(reader, 1);
  {
    final value = IsarCore.readByte(reader, 2);
    if (value == 0) {
      object.value = _ratingLinkValue[RatingValue.one] ?? RatingValue.one;
    } else {
      object.value = _ratingLinkValue[value] ?? RatingValue.one;
    }
  }
  return object;
}

const _ratingLinkValue = {
  0: RatingValue.one,
  1: RatingValue.two,
  2: RatingValue.three,
  3: RatingValue.four,
  4: RatingValue.five,
};

extension RatingLinkQueryFilter
    on QueryBuilder<RatingLink, RatingLink, QFilterCondition> {
  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      ratingUuidIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      ratingUuidIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 1));
    });
  }

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition> ratingUuidEqualTo(
    String? value, {
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

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      ratingUuidGreaterThan(
    String? value, {
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

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      ratingUuidGreaterThanOrEqualTo(
    String? value, {
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

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      ratingUuidLessThan(
    String? value, {
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

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      ratingUuidLessThanOrEqualTo(
    String? value, {
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

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition> ratingUuidBetween(
    String? lower,
    String? upper, {
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

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      ratingUuidStartsWith(
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

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      ratingUuidEndsWith(
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

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      ratingUuidContains(String value, {bool caseSensitive = true}) {
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

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition> ratingUuidMatches(
      String pattern,
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

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      ratingUuidIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      ratingUuidIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition> valueEqualTo(
    RatingValue value,
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

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition> valueGreaterThan(
    RatingValue value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      valueGreaterThanOrEqualTo(
    RatingValue value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition> valueLessThan(
    RatingValue value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition>
      valueLessThanOrEqualTo(
    RatingValue value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<RatingLink, RatingLink, QAfterFilterCondition> valueBetween(
    RatingValue lower,
    RatingValue upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension RatingLinkQueryObject
    on QueryBuilder<RatingLink, RatingLink, QFilterCondition> {}
