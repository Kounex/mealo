// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$RandomizedMealHash() => r'0fa53dfed01c5488e579a22b6dfced798e6bf894';

/// See also [RandomizedMeal].
final randomizedMealProvider =
    AutoDisposeAsyncNotifierProvider<RandomizedMeal, Meal?>(
  RandomizedMeal.new,
  name: r'randomizedMealProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$RandomizedMealHash,
);
typedef RandomizedMealRef = AutoDisposeAsyncNotifierProviderRef<Meal?>;

abstract class _$RandomizedMeal extends AutoDisposeAsyncNotifier<Meal?> {
  @override
  FutureOr<Meal?> build();
}

String _$selectedMealHash() => r'7cf17b74d0ce438f84911a6c9972b86eedd35114';

/// See also [selectedMeal].
class SelectedMealProvider extends AutoDisposeFutureProvider<Meal> {
  SelectedMealProvider(
    this.uuid,
  ) : super(
          (ref) => selectedMeal(
            ref,
            uuid,
          ),
          from: selectedMealProvider,
          name: r'selectedMealProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$selectedMealHash,
        );

  final String uuid;

  @override
  bool operator ==(Object other) {
    return other is SelectedMealProvider && other.uuid == uuid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, uuid.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef SelectedMealRef = AutoDisposeFutureProviderRef<Meal>;

/// See also [selectedMeal].
final selectedMealProvider = SelectedMealFamily();

class SelectedMealFamily extends Family<AsyncValue<Meal>> {
  SelectedMealFamily();

  SelectedMealProvider call(
    String uuid,
  ) {
    return SelectedMealProvider(
      uuid,
    );
  }

  @override
  AutoDisposeFutureProvider<Meal> getProviderOverride(
    covariant SelectedMealProvider provider,
  ) {
    return call(
      provider.uuid,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'selectedMealProvider';
}

String _$prevRandomizedMealsHash() =>
    r'9eb8db004b8444e647d5169ba3068d6cfc35a0a2';

/// See also [prevRandomizedMeals].
final prevRandomizedMealsProvider = AutoDisposeFutureProvider<List<Meal>>(
  prevRandomizedMeals,
  name: r'prevRandomizedMealsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$prevRandomizedMealsHash,
);
typedef PrevRandomizedMealsRef = AutoDisposeFutureProviderRef<List<Meal>>;
String _$prevAteMealsHash() => r'579cbf75dd8ef906bffc4cb6c2dfa49600326a52';

/// See also [prevAteMeals].
final prevAteMealsProvider = AutoDisposeFutureProvider<List<Meal>>(
  prevAteMeals,
  name: r'prevAteMealsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$prevAteMealsHash,
);
typedef PrevAteMealsRef = AutoDisposeFutureProviderRef<List<Meal>>;
