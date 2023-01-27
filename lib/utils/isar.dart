import 'package:isar/isar.dart';

class IsarUtils {
  static Future<Isar> instance(List<CollectionSchema<dynamic>> schemas) async =>
      await Isar.open(schemas);

  static Future<T>? crud<T>(Future<T> Function(Isar isar) callback,
      {Isar? isar, List<CollectionSchema<dynamic>>? schemas}) async {
    assert(isar != null || schemas != null && schemas.isNotEmpty);
    return await (isar ?? await IsarUtils.instance(schemas!)).writeTxn(
      () async => callback((isar ?? await IsarUtils.instance(schemas!))),
    );
  }
}
