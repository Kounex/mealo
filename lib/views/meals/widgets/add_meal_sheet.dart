import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/models/i_meal.dart';
import 'package:mealo/utils/isar.dart';
import 'package:uuid/uuid.dart';

class AddMealSheet extends StatefulWidget {
  const AddMealSheet({super.key});

  @override
  State<AddMealSheet> createState() => _AddMealSheetState();
}

class _AddMealSheetState extends State<AddMealSheet> {
  final _name = TextEditingController();

  void _saveMeal() async {
    IsarUtils.crud(
      (isar) {
        return isar.iMeals.put(
          IMeal()
            ..uuid = const Uuid().v4()
            ..createdAt = DateTime.now()
            ..name = _name.text,
        );
      },
      schemas: [IMealSchema],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: const Icon(CupertinoIcons.clear),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        TextField(controller: _name),
        ElevatedButton(
          onPressed: () => _saveMeal(),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
