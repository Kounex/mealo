import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';
import 'utils/persistance.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Open our [Isar] instance which will be available in sync. We need
  /// to add and maintain all schemas here
  await PersistanceUtils.init();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
