import 'package:isar/isar.dart';
import 'package:uuid/uuid.dart';

abstract class BaseModel {
  @id
  String uuid = const Uuid().v4();
}

abstract class Model extends BaseModel {
  late String name;
}
