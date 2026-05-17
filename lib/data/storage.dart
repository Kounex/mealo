import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/experimental/persist.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sqflite/riverpod_sqflite.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

part 'storage.g.dart';

@riverpod
Future<Storage<String, String>> storage(Ref ref) async {
  if (kIsWeb) {
    databaseFactory = databaseFactoryFfiWeb;
  }
  return JsonSqFliteStorage.open(join(await getDatabasesPath(), 'mealo.db'));
}
