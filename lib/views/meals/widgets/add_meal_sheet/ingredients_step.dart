import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/ingredient/ingredient.dart';
import 'package:mealo/models/unit/unit.dart';
import 'package:mealo/widgets/base/functional/async_value_builder.dart';

class IngredientsStep extends ConsumerWidget {
  const IngredientsStep({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<Ingredient>> asyncIngredients =
        ref.watch(ingredientsProvider);
    final AsyncValue<List<Unit>> asyncUnits = ref.watch(unitsProvider);

    return BaseAsyncValueBuilder(
      asyncValue: asyncIngredients,
      data: (ingredients) => BaseAsyncValueBuilder(
        asyncValue: asyncUnits,
        data: (units) => const Text('Ingredients'),
      ),
    );
  }
}
