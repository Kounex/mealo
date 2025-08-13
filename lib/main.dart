import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/init.dart';

import 'app.dart';
import 'utils/persistence.dart';

void main() async {
  FlutterNativeSplash.preserve(
    widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
  );

  /// Open our [Isar] instance which will be available in sync. We need
  /// to add and maintain all schemas here
  await PersistenceUtils.init();

  runApp(
    const ProviderScope(
      child: Init(child: App()),
    ),
  );
}
