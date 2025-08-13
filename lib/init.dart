import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/utils/theme.dart';

import 'models/settings/settings.dart';

class Init extends ConsumerStatefulWidget {
  final Widget child;

  const Init({super.key, required this.child});

  @override
  ConsumerState<Init> createState() => _InitState();
}

class _InitState extends ConsumerState<Init> {
  Future<void>? _init;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _init ??= _initApp();
  }

  Future<void> _initApp() async {
    await Future.delayed(Duration(seconds: 1));

    FlutterNativeSplash.remove();
    await _checkImages();
  }

  /// Due to various reasons (most of the time not intended and due to crashes
  /// or similar) we could end up with having images persisted, which are not
  /// referenced anymore. At app startup we will check for those and delete
  /// them
  Future<void> _checkImages() async {
    await Future.delayed(Duration(seconds: 3));
  }

  @override
  Widget build(BuildContext context) {
    bool? darkMode = ref.watch(
          settingsSingletonProvider
              .select((value) => value.valueOrNull?.darkMode),
        ) ??
        true;

    return Theme(
      data: ThemeUtils.baseDark,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Builder(builder: (context) {
          return Material(
            color: ThemeUtils.baseDark.colorScheme.surface,
            child: BaseFutureBuilder(
              future: _init,
              loading: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(DesignSystem.border.radius12),
                      clipBehavior: Clip.hardEdge,
                      child: Image.asset(
                        'assets/images/app-icon.jpeg',
                        height: DesignSystem.size.x172,
                      ),
                    ),
                  ),
                  SizedBox(height: DesignSystem.spacing.x64),
                  BaseProgressIndicator(
                    text: 'Preparing all meals...',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              data: (_) => widget.child,
            ),
          );
        }),
      ),
    );
  }
}
