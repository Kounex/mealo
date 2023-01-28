import 'package:isar/isar.dart';
import 'package:mealo/models/meal.dart';
import 'package:mealo/utils/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal.g.dart';

/// Design:
///
/// Data will always be served from the persistance layer. Initially entities
/// will be received by the [_local] function which checks [Isar] for the
/// existing entities. Afterwards an initial (and adhoc whenever a CRUD
/// operation is done) [fetch] is called to receive the latest entities
/// from the backend which we will persist locally with [Isar] again. While
/// creating this providser, we also call [_watcher] which is listening for
/// changes on the persistance layer. Therefore after fetching new entities
/// which are persisted, we will automatically trigger the watcher which will
/// call [_local] again so our [ref.watch] are notified correctly.
mixin Persistance<T> {
  FutureOr<List<T>> init(AutoDisposeAsyncNotifier<List<T>> provider) async {
    _watcher(provider);
    return _local();
  }

  void _watcher(AutoDisposeAsyncNotifier<List<T>> provider) async =>
      IsarUtils.instance.collection<T>().watchLazy().listen((_) async {
        /// Not possible since [loading] is returning [Never] which can't
        /// be applied
        // provider.state = const AsyncValue.loading();
        provider.state = await AsyncValue.guard(() async => _local());
      });

  Future<List<T>> _local() async {
    List<T> entries =
        await IsarUtils.instance.collection<T>().where().findAll();

    return entries;
  }
}

@riverpod
class Meals extends _$Meals with Persistance<Meal> {
  @override
  FutureOr<List<Meal>> build() async => this.init(this);

  void fetch() async {
    /// Here we will add the API call to fetch the latest [MealDTO] from
    /// the backend and sync it with our persistance layer. This might trigger
    /// additional CRUD operations to sync potentially offline created
    /// entities with the backend
    throw UnimplementedError();
  }
}

// @riverpod
// class Meals extends _$Meals
// // {
//     with
//         Persistance<Meal> {
//   @override
//   FutureOr<List<Meal>> build() async => this.init(this);

//   // @override
//   // FutureOr<List<Meal>> build() async {
//   //   _watcher();
//   //   return _local();
//   // }

//   // void _watcher() async =>
//   //     IsarUtils.instance.collection<Meal>().watchLazy().listen((_) async {
//   //       this.state = const AsyncValue.loading();
//   //       this.state = await AsyncValue.guard(() async => _local());
//   //     });

//   // Future<List<Meal>> _local() async {
//   //   List<Meal> entries =
//   //       await IsarUtils.instance.collection<Meal>().where().findAll();

//   //   return entries;
//   // }

//   Future<List<Meal>>? fetch() async {
//     /// TODO: here we will add the API call once there will be a backend
//     throw UnimplementedError();
//   }
// }
