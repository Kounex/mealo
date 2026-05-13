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
    String uuid,
  ) : this._internal(
          (ref) => selectedMeal(
            ref as SelectedMealRef,
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
          uuid: uuid,
        );

  SelectedMealProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.uuid,
  }) : super.internal();

  final String uuid;

  @override
  Override overrideWith(
    FutureOr<Meal> Function(SelectedMealRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SelectedMealProvider._internal(
        (ref) => create(ref as SelectedMealRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        uuid: uuid,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Meal> createElement() {
    return _SelectedMealProviderElement(this);
  }

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

mixin SelectedMealRef on AutoDisposeFutureProviderRef<Meal> {
  /// The parameter `uuid` of this provider.
  String get uuid;
}

class _SelectedMealProviderElement
    extends AutoDisposeFutureProviderElement<Meal> with SelectedMealRef {
  _SelectedMealProviderElement(super.provider);

  @override
  String get uuid => (origin as SelectedMealProvider).uuid;
}

String _$prevRandomizedMealsHash() =>
    r'76361ad2960e13d3dfda3216499fc93e0e1ab304';

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
String _$prevAteMealsHash() => r'cc25a5fb0363edc58a171292c30d6e88feb9534e';

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
    r'9e2615de32b73a03bda8d1d224d374cd1d9292d5';

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
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
