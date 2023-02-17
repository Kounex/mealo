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

String _$RandomizedMealHash() => r'c9c4d486b39a92ab27c73b4bb228a237efaecc5d';

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

String _$prevRandomizedMealsHash() =>
    r'13d21b4f74b32edf4297b6fd7b720faa5c04f66d';

/// See also [prevRandomizedMeals].
final prevRandomizedMealsProvider = AutoDisposeFutureProvider<List<Meal>>(
  prevRandomizedMeals,
  name: r'prevRandomizedMealsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$prevRandomizedMealsHash,
);
typedef PrevRandomizedMealsRef = AutoDisposeFutureProviderRef<List<Meal>>;
String _$prevAteMealsHash() => r'8e5dc90904eba8c4c86555a34c71373f54afc765';

/// See also [prevAteMeals].
final prevAteMealsProvider = AutoDisposeFutureProvider<List<Meal>>(
  prevAteMeals,
  name: r'prevAteMealsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$prevAteMealsHash,
);
typedef PrevAteMealsRef = AutoDisposeFutureProviderRef<List<Meal>>;
