import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:mealo/app.dart';
import 'package:mealo/utils/isar.dart';

import 'models/meal.dart';

void main() async {
  IsarUtils.instance = await Isar.open([MealSchema]);

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
