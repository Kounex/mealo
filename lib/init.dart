import 'dart:io';

import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/models/meal/meal.dart';
import 'package:mealo/utils/theme.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

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

    await _createFolders();
    await _moveImages();
    await _cleanUpMealImages();

    await Future.delayed(Duration(seconds: 2));
  }

  bool _isUuidV4(String s) {
    try {
      return ((Uuid.parse(s)[6] >> 4) & 0x0f) == 4;
    } catch (_) {
      return false;
    }
  }

  Future<void> _createFolders() async {
    Directory baseDir = await getApplicationDocumentsDirectory();

    /// Folder for the images of all the meals
    Directory dir = Directory('${baseDir.path}/${Meal.subPathForImages}');

    await dir.create();
  }

  /// Only necessary due to the fact that the folder structure changed and I
  /// need to make sure to move them correctly
  ///
  /// Can be deleted later
  Future<void> _moveImages() async {
    Directory imagesDir = await getApplicationDocumentsDirectory();

    List<FileSystemEntity> files = imagesDir.listSync();

    List<Future<FileSystemEntity>> renamings = [];
    for (final file in files) {
      if (_isUuidV4(file.path.split('/').last)) {
        renamings.add(
          file.rename(
              '${imagesDir.path}/${Meal.subPathForImages}/${file.path.split('/').last}'),
        );
      }
    }

    await Future.wait(renamings);
  }

  /// Due to various reasons (most of the time not intended and due to crashes
  /// or similar) we could end up with having images persisted, which are not
  /// referenced anymore. At app startup we will check for those and delete
  /// them
  Future<void> _cleanUpMealImages() async {
    Directory baseDir = await getApplicationDocumentsDirectory();

    /// Folder for the images of all the meals
    Directory mealImagesDir =
        Directory('${baseDir.path}/${Meal.subPathForImages}');

    List<FileSystemEntity> imagesUuidsFiles = mealImagesDir.listSync();

    List<Future<FileSystemEntity>> deletions = [];

    List<Meal> meals = await ref.read(mealsProvider.future);

    for (final imageUuidFile in imagesUuidsFiles) {
      String imageUuid = imageUuidFile.path.split('/').last;

      if (!meals.any((meal) =>
          meal.imagesUuids.contains(imageUuid) ||
          meal.thumbnailUuid == imageUuid)) {
        deletions.add(imageUuidFile.delete());
      }
    }

    await Future.wait(deletions);
  }

  @override
  Widget build(BuildContext context) {
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
