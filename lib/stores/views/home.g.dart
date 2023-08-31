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
    r'9c4c6134f76cae63435b8c67bd351b1b777aa9a0';

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
String _$prevAteMealsHash() => r'40284bc60cb44b411f64e1a5d50707c47aa4ca57';

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
String _$currentRandomizedRunHash() =>
    r'60cde4c2ae4533bd6b58fbf789aed6966206fc1b';

/// See also [CurrentRandomizedRun].
@ProviderFor(CurrentRandomizedRun)
final currentRandomizedRunProvider = AutoDisposeAsyncNotifierProvider<
    CurrentRandomizedRun, RandomizedRun?>.internal(
  CurrentRandomizedRun.new,
  name: r'currentRandomizedRunProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentRandomizedRunHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentRandomizedRun = AutoDisposeAsyncNotifier<RandomizedRun?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
