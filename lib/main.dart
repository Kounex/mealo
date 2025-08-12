import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'utils/persistence.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Open our [Isar] instance which will be available in sync. We need
  /// to add and maintain all schemas here
  await PersistenceUtils.init();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
