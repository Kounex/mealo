import 'package:isar/isar.dart';
import 'package:mealo/utils/date.dart';
import 'package:uuid/uuid.dart';

abstract class BaseModel {
  @id
  String uuid = const Uuid().v4();

  @utc
  DateTime created = DateTime.now();

  /// We don't want [updated] to be nullable and also be able to distinguish
  /// if a model is new (will be inserted) or already exists (will be updated).
  /// [updated] will be changed solely in the [PersistanceUtils.transaction]
  /// function to remain integrity and with this approach we know how to handle
  /// this property correctly. If a model will be used for the [transaction]
  /// function with this value, we know it's a new one or an existing one a and
  /// can handle it
  @utc
  DateTime updated = DateUtils.zero;
}

abstract class CommonModel extends BaseModel {
  late String name;
}
