import 'package:isar/isar.dart';

class IsarUtils {
  static late Isar instance;

  // static FutureOr<Isar> instance(
  //         List<CollectionSchema<dynamic>> schemas) async =>
  //     Isar.getInstance() ?? await Isar.open(schemas);

  // static Future<T>? crud<T>(Future<T> Function(Isar isar) callback,
  //     {Isar? isar, List<CollectionSchema<dynamic>>? schemas}) async {
  //   assert(isar != null || schemas != null && schemas.isNotEmpty);
  //   return await (isar ?? await IsarUtils.instance(schemas!)).writeTxn(
  //     () async => callback((isar ?? await IsarUtils.instance(schemas!))),
  //   );
  // }
  static Future<T>? crud<T>(Future<T> Function(Isar isar) callback) async {
    return IsarUtils.instance.writeTxn(
      () async => callback(IsarUtils.instance),
    );
  }
}
