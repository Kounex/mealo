import 'package:isar/isar.dart';
import 'package:mealo/models/meal.dart';
import 'package:mealo/types/api/meal.dart';
import 'package:mealo/utils/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meal.g.dart';

class MealStore {}

/// Design:
///
/// Data will always be served from the persistance layer. Initially entities
/// will be received by the [_local] function which checks [Isar] for the
/// existing entities. Afterwards an initial (and adhoc whenever a CRUD
/// operation is done) [fetch] is called to receive the latest entities
/// from the backend which we will persist locally with [Isar] again. While
/// creating this store, we also call [_watcher] which is listening for changes
/// on the persistance layer. Therefore after fetching new entities which
/// are persisted, we will automatically trigger the watcher which will call
/// [_local] again so our [ref.watch] are notified correctly.

@riverpod
class Meals extends _$Meals {
  @override
  FutureOr<List<Meal>> build() async {
    _watcher();
    return _local();
  }

  void _watcher() async => (await IsarUtils.instance([IMealSchema]))
          .iMeals
          .watchLazy()
          .listen((_) async {
        state = const AsyncValue.loading();
        state = await AsyncValue.guard(() async => _local());
      });

  Future<List<Meal>> _local() async {
    List<IMeal> iMeals = await (await IsarUtils.instance([IMealSchema]))
        .iMeals
        .where()
        .findAll();

    return iMeals
        .map(
          (iMeal) => Meal(
              uuid: iMeal.uuid, createdAt: iMeal.createdAt, name: iMeal.name),
        )
        .toList();
  }

  Future<List<Meal>>? fetch() async {
    /// TODO: here we will add the API call once there will be a backend
    throw UnimplementedError();
  }
}
