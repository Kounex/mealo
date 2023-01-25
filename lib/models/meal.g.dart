// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meal.dart';

// **************************************************************************
// CrimsonGenerator
// **************************************************************************

extension ReadMeal on Crimson {
  Meal readMeal() {
    late DateTime createdAt;
    late String name;
    String? thumbnailBase64;
    List<String>? imagesBase64;

    loop:
    while (true) {
      switch (iterObjectHash()) {
        case -1:
          break loop;

        case -3141059728106243719: // created_at
          createdAt = DateTime.parse(readString());
          break;
        case -4270347329889690746: // name
          name = readString();
          break;
        case -5604944823420908017: // thumbnail_base64
          thumbnailBase64 = readStringOrNull();
          break;
        case -4173521385998187749: // images_base64
          imagesBase64 = skipNull()
              ? null
              : [
                  for (; iterArray();) readString(),
                ];
          break;

        default:
          skip();
          break;
      }
    }

    final obj = Meal(
      createdAt: createdAt,
      name: name,
      thumbnailBase64: thumbnailBase64,
      imagesBase64: imagesBase64,
    );
    return obj;
  }

  List<Meal> readMealList() {
    final list = <Meal>[];
    while (iterArray()) {
      list.add(readMeal());
    }
    return list;
  }

  List<Meal?> readMealOrNullList() {
    final list = <Meal?>[];
    while (iterArray()) {
      list.add(skipNull() ? null : readMeal());
    }
    return list;
  }
}

extension WriteMeal on CrimsonWriter {
  void writeMeal(Meal value) {
    writeObjectStart();
    writeObjectKeyRaw('created_at');
    final createdAtVal = value.createdAt;
    writeString(createdAtVal.toIso8601String());
    writeObjectKeyRaw('name');
    final nameVal = value.name;
    writeString(nameVal);
    writeObjectKeyRaw('thumbnail_base64');
    final thumbnailBase64Val = value.thumbnailBase64;
    if (thumbnailBase64Val == null) {
      writeNull();
    } else {
      writeString(thumbnailBase64Val);
    }
    writeObjectKeyRaw('images_base64');
    final imagesBase64Val = value.imagesBase64;
    if (imagesBase64Val == null) {
      writeNull();
    } else {
      writeArrayStart();
      for (final value in imagesBase64Val) {
        writeString(value);
      }
      writeArrayEnd();
    }
    writeObjectEnd();
  }

  void writeMealList(List<Meal> list) {
    writeArrayStart();
    for (final value in list) {
      writeMeal(value);
    }
    writeArrayEnd();
  }

  void writeMealOrNullList(List<Meal?> list) {
    writeArrayStart();
    for (final value in list) {
      if (value == null) {
        writeNull();
      } else {
        writeMeal(value);
      }
    }
    writeArrayEnd();
  }
}
