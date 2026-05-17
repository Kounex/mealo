// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(selectedMeal)
final selectedMealProvider = SelectedMealFamily._();

final class SelectedMealProvider
    extends $FunctionalProvider<AsyncValue<Meal>, Meal, FutureOr<Meal>>
    with $FutureModifier<Meal>, $FutureProvider<Meal> {
  SelectedMealProvider._({
    required SelectedMealFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'selectedMealProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$selectedMealHash();

  @override
  String toString() {
    return r'selectedMealProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Meal> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Meal> create(Ref ref) {
    final argument = this.argument as String;
    return selectedMeal(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is SelectedMealProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$selectedMealHash() => r'7cf17b74d0ce438f84911a6c9972b86eedd35114';

final class SelectedMealFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Meal>, String> {
  SelectedMealFamily._()
    : super(
        retry: null,
        name: r'selectedMealProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  SelectedMealProvider call(String uuid) =>
      SelectedMealProvider._(argument: uuid, from: this);

  @override
  String toString() => r'selectedMealProvider';
}

@ProviderFor(CurrentRandomizedRun)
final currentRandomizedRunProvider = CurrentRandomizedRunProvider._();

final class CurrentRandomizedRunProvider
    extends $AsyncNotifierProvider<CurrentRandomizedRun, RandomizedRun?> {
  CurrentRandomizedRunProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentRandomizedRunProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentRandomizedRunHash();

  @$internal
  @override
  CurrentRandomizedRun create() => CurrentRandomizedRun();
}

String _$currentRandomizedRunHash() =>
    r'9e2615de32b73a03bda8d1d224d374cd1d9292d5';

abstract class _$CurrentRandomizedRun extends $AsyncNotifier<RandomizedRun?> {
  FutureOr<RandomizedRun?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<RandomizedRun?>, RandomizedRun?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<RandomizedRun?>, RandomizedRun?>,
              AsyncValue<RandomizedRun?>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

@ProviderFor(prevRandomizedMeals)
final prevRandomizedMealsProvider = PrevRandomizedMealsProvider._();

final class PrevRandomizedMealsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Meal>>,
          List<Meal>,
          FutureOr<List<Meal>>
        >
    with $FutureModifier<List<Meal>>, $FutureProvider<List<Meal>> {
  PrevRandomizedMealsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prevRandomizedMealsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prevRandomizedMealsHash();

  @$internal
  @override
  $FutureProviderElement<List<Meal>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Meal>> create(Ref ref) {
    return prevRandomizedMeals(ref);
  }
}

String _$prevRandomizedMealsHash() =>
    r'76361ad2960e13d3dfda3216499fc93e0e1ab304';

@ProviderFor(prevAteMeals)
final prevAteMealsProvider = PrevAteMealsProvider._();

final class PrevAteMealsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Meal>>,
          List<Meal>,
          FutureOr<List<Meal>>
        >
    with $FutureModifier<List<Meal>>, $FutureProvider<List<Meal>> {
  PrevAteMealsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'prevAteMealsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$prevAteMealsHash();

  @$internal
  @override
  $FutureProviderElement<List<Meal>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<Meal>> create(Ref ref) {
    return prevAteMeals(ref);
  }
}

String _$prevAteMealsHash() => r'1af782b62f3186ae76f179ae6cc00c9bce9f21be';
