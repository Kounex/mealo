import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mealo/models/meal.dart';
import 'package:mealo/utils/isar.dart';
import 'package:mealo/widgets/base/scaffold.dart';

class MealDetailsView extends StatelessWidget {
  final Meal? meal;

  const MealDetailsView({
    super.key,
    this.meal,
  });

  void _deleteMeal(BuildContext context) async {
    await IsarUtils.crud(
      (isar) => isar.meals.deleteByUuid(this.meal!.uuid),
      // schemas: [MealSchema],
    );
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      appBarProperties: AppBarProperties(
        title: Text(this.meal?.name ?? 'Unnamed'),
      ),
      children: [
        Hero(
          tag: this.meal?.uuid ?? 'placeholder',
          child: this.meal?.thumbnailBase64 != null
              ? Image.memory(base64Decode(this.meal!.thumbnailBase64!))
              : Image.asset('assets/images/meal-placeholder.png'),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: ElevatedButton(
            onPressed: () => _deleteMeal(context),
            child: const Text('Remove'),
          ),
        ),
      ],
    );
  }
}
