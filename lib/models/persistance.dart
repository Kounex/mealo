import 'package:isar/isar.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../utils/isar.dart';

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
///
/// Riverpod entities only need to add this mixin if they expose a model
mixin Persistance<T> on AutoDisposeAsyncNotifier<List<T>> {
  FutureOr<List<T>> init() async {
    _watcher();
    return _local();
  }

  void _watcher() async =>
      IsarUtils.instance.collection<T>().watchLazy().listen(
        (_) async {
          this.state = const AsyncLoading();
          this.state = await AsyncValue.guard(() async => _local());
        },
      );

  Future<List<T>> _local() async {
    List<T> entries =
        await IsarUtils.instance.collection<T>().where().findAll();

    return entries;
  }
}

/// Same as [Persistance] but for singletons - for edge cases like [Settings]
/// where we "abuse" [Isar] to have a collection with only one entry (usually
/// not the use case) since we have the whole persistance cycle done and it
/// would be tedious to have something else in place for such edge cases
mixin SingletonPersistance<T> on AutoDisposeAsyncNotifier<T> {
  FutureOr<T> init() async {
    _watcher();
    return _local();
  }

  void _watcher() async =>
      IsarUtils.instance.collection<T>().watchLazy().listen(
        (_) async {
          this.state = AsyncValue<T>.loading();
          this.state = await AsyncValue.guard(() async => _local());
        },
      );

  Future<T> _local() async {
    List<T> entries =
        await IsarUtils.instance.collection<T>().where().findAll();

    return entries.first;
  }
}
