import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/models/meal.dart';
import 'package:mealo/utils/isar.dart';
import 'package:uuid/uuid.dart';

class AddMealSheet extends StatefulWidget {
  const AddMealSheet({super.key});

  @override
  State<AddMealSheet> createState() => _AddMealSheetState();
}

class _AddMealSheetState extends State<AddMealSheet> {
  final GlobalKey<FormState> _form = GlobalKey();

  final _name = TextEditingController();

  void _saveMeal() async {
    await IsarUtils.crud(
      (isar) {
        return isar.meals.put(
          Meal()
            ..uuid = const Uuid().v4()
            ..createdAt = DateTime.now()
            ..name = _name.text.trim(),
        );
      },
      // schemas: [MealSchema],
    );
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Meal',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              IconButton(
                icon: const Icon(CupertinoIcons.clear),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          Expanded(
            child: Form(
              key: _form,
              child: ListView(
                children: [
                  const SizedBox(height: 24.0),
                  TextFormField(
                    controller: _name,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Name is required';
                      }
                      if (value.trim().length < 3) {
                        return 'Too short';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Name',
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        _saveMeal();
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
