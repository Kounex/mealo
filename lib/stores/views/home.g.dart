// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$selectedMealHash() => r'7cf17b74d0ce438f84911a6c9972b86eedd35114';

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

typedef SelectedMealRef = AutoDisposeFutureProviderRef<Meal>;

/// See also [selectedMeal].
@ProviderFor(selectedMeal)
const selectedMealProvider = SelectedMealFamily();

/// See also [selectedMeal].
class SelectedMealFamily extends Family<AsyncValue<Meal>> {
  /// See also [selectedMeal].
  const SelectedMealFamily();

  /// See also [selectedMeal].
  SelectedMealProvider call(
    String uuid,
  ) {
    return SelectedMealProvider(
      uuid,
    );
  }

  @override
  SelectedMealProvider getProviderOverride(
    covariant SelectedMealProvider provider,
  ) {
    return call(
      provider.uuid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'selectedMealProvider';
}

/// See also [selectedMeal].
class SelectedMealProvider extends AutoDisposeFutureProvider<Meal> {
  /// See also [selectedMeal].
  SelectedMealProvider(
    this.uuid,
  ) : super.internal(
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
          dependencies: SelectedMealFamily._dependencies,
          allTransitiveDependencies:
              SelectedMealFamily._allTransitiveDependencies,
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

String _$prevRandomizedMealsHash() =>
    r'9eb8db004b8444e647d5169ba3068d6cfc35a0a2';

/// See also [prevRandomizedMeals].
@ProviderFor(prevRandomizedMeals)
final prevRandomizedMealsProvider =
    AutoDisposeFutureProvider<List<Meal>>.internal(
  prevRandomizedMeals,
  name: r'prevRandomizedMealsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$prevRandomizedMealsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PrevRandomizedMealsRef = AutoDisposeFutureProviderRef<List<Meal>>;
String _$prevAteMealsHash() => r'579cbf75dd8ef906bffc4cb6c2dfa49600326a52';

/// See also [prevAteMeals].
@ProviderFor(prevAteMeals)
final prevAteMealsProvider = AutoDisposeFutureProvider<List<Meal>>.internal(
  prevAteMeals,
  name: r'prevAteMealsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$prevAteMealsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PrevAteMealsRef = AutoDisposeFutureProviderRef<List<Meal>>;
String _$randomizedMealHash() => r'0fa53dfed01c5488e579a22b6dfced798e6bf894';

/// See also [RandomizedMeal].
@ProviderFor(RandomizedMeal)
final randomizedMealProvider =
    AutoDisposeAsyncNotifierProvider<RandomizedMeal, Meal?>.internal(
  RandomizedMeal.new,
  name: r'randomizedMealProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$randomizedMealHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RandomizedMeal = AutoDisposeAsyncNotifier<Meal?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
