import 'dart:io';

import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:mealo/widgets/shared/dialog/confirmation.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../models/embeddings/rating_link/rating_link.dart';
import '../../../../models/meal/meal.dart';
import '../../../../models/rating/rating.dart';
import '../../../../utils/persistence.dart';
import 'images_step/images_step.dart';
import 'ingredient_step.dart';
import 'rating_step.dart';
import 'stepper_control.dart';
import 'stepper_overview.dart';
import 'tags_step.dart';

enum AddEditMealStep {
  images,
  ratings,
  ingredients,
  tags;

  String get title => switch (this) {
        AddEditMealStep.images => 'Images',
        AddEditMealStep.ratings => 'Ratings',
        AddEditMealStep.ingredients => 'Ingredients',
        AddEditMealStep.tags => 'Tags',
      };
}

class AddEditMealSheet extends ConsumerStatefulWidget {
  final Meal? meal;

  const AddEditMealSheet({
    super.key,
    this.meal,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddMealSheetState();
}

class _AddMealSheetState extends ConsumerState<AddEditMealSheet> {
  final GlobalKey<FormState> _form = GlobalKey();
  final ScrollController _controller = ScrollController();

  Meal? _meal;
  final List<String> _imagesToDelete = [];

  late final TextEditingController _name;

  AddEditMealStep _step = AddEditMealStep.values.first;

  @override
  void initState() {
    super.initState();

    _meal = this.widget.meal;

    _name = TextEditingController(text: this.widget.meal?.name ?? '');
  }

  /// In case we are about to add a new meal, we can't only create an empty meal
  /// we need to make sure some defaults are in place (like initial ratings)
  Meal _initMeal(List<Rating> ratings) {
    Meal meal = Meal();

    meal.ratings = ratings
        .map(
          (rating) => RatingLink()
            ..ratingUuid = rating.uuid
            ..value = RatingValue.three,
        )
        .toList();

    return meal;
  }

  Future<void> _deleteImages(List<String> imagesUuidsToDelete,
      [String? path]) async {
    List<Future> deletions = [];

    /// The apps root directory for custom content
    path ??= (await getApplicationDocumentsDirectory()).path;

    for (String uuid in imagesUuidsToDelete) {
      deletions.add(File('$path/${Meal.subPathForImages}/$uuid').delete());
    }
    await Future.wait(deletions);
  }

  void _saveMeal() async {
    await _deleteImages(_imagesToDelete);

    PersistenceUtils.transaction(
      PersistenceOperation.insertUpdate,
      [_meal!..name = _name.text.trim()],
    );

    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }

  void _deleteMeal() async {
    if (this.widget.meal != null) {
      await _deleteImages(this.widget.meal!.imagesUuids);

      PersistenceUtils.transaction(
        PersistenceOperation.delete,
        [this.widget.meal!],
      );
    }
    if (mounted) {
      Navigator.of(context).pop('delete');
    }
  }

  String? _checkMealNameUnique(String name) {
    List<Meal> meals =
        PersistenceUtils.where<Meal>().nameEqualTo(name.trim()).findAll();

    if (meals.isNotEmpty &&
        meals.every((meal) => meal.uuid != this.widget.meal?.uuid)) {
      return 'Meal already exists!';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final asyncRatings = ref.watch(ratingsProvider);
    return BaseAsyncValueBuilder(
      asyncValue: asyncRatings,
      loadingText: 'Warming up the meal...',
      data: (ratings) {
        _meal ??= _initMeal(ratings);

        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: DesignSystem.spacing.x24,
                left: DesignSystem.spacing.x24,
                right: DesignSystem.spacing.x24,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        '${this.widget.meal != null ? "Edit" : "New"} Meal',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      if (this.widget.meal != null)
                        Padding(
                          padding:
                              EdgeInsets.only(left: DesignSystem.spacing.x12),
                          child: BaseTextButton(
                            onPressed: () => ModalUtils.showBaseDialog(
                              context,
                              MealoBaseConfirmationDialog(
                                title: 'Delete Meal',
                                body:
                                    'Are you sure you want to delete this meal? This action can\'t be undone!',
                                isYesDestructive: true,
                                onYes: (_) => _deleteMeal(),
                              ),
                            ),
                            isDestructive: true,
                            child: const Text('Delete'),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: DesignSystem.spacing.x24),
                  Form(
                    key: _form,
                    child: BaseTextFormField(
                      controller: _name,
                      validator: (name) =>
                          ValidationUtils.name(name?.trim()) ??
                          _checkMealNameUnique(name!),
                      hintText: 'Name',
                    ),
                  ),
                  SizedBox(height: DesignSystem.spacing.x24),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: DesignSystem.spacing.x4),
                    child: StepperOverview(
                      step: _step.index,
                      max: AddEditMealStep.values.length - 1,
                      size: DesignSystem.size.x42,
                      titles: List.from(
                          AddEditMealStep.values.map((step) => step.title)),
                      onStepTapped: (step) => setState(
                        () => _step = AddEditMealStep.values[step],
                      ),
                    ),
                  ),
                  SizedBox(height: DesignSystem.spacing.x12),
                  Expanded(
                    child: ListView(
                      controller: _controller,
                      physics: const ClampingScrollPhysics(),
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: DesignSystem.spacing.x24),
                            child: AnimatedSwitcher(
                              duration:
                                  DesignSystem.animation.defaultDurationMS250,
                              child: switch (_step) {
                                AddEditMealStep.images => ImagesStep(
                                    controller: _controller,
                                    meal: _meal!,
                                    imagesToDelete: _imagesToDelete,
                                  ),
                                AddEditMealStep.ratings => RatingStep(
                                    meal: _meal!,
                                  ),
                                AddEditMealStep.ingredients => IngredientStep(
                                    meal: _meal!,
                                  ),
                                AddEditMealStep.tags => TagsStep(
                                    meal: _meal!,
                                  ),
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 36.0 +
                              48.0 +
                              MediaQuery.of(context).viewPadding.bottom,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const BaseDivider(),
                  Material(
                    child: Padding(
                      padding: EdgeInsets.all(DesignSystem.spacing.x24) +
                          MediaQuery.of(context).viewPadding,
                      child: StepperControl(
                        step: _step.index,
                        max: AddEditMealStep.values.length - 1,
                        onBack: () => setState(
                          () => _step = AddEditMealStep.values[_step.index - 1],
                        ),
                        onNext: () => setState(
                          () => _step = AddEditMealStep.values[_step.index + 1],
                        ),
                        onSave: () {
                          if (_form.currentState!.validate()) {
                            _saveMeal();
                            setState(() {});
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
