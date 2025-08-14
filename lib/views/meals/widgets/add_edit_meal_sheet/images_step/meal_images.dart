import 'package:base_components/base_components.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../models/meal/meal.dart';
import '../../../../../widgets/shared/image.dart';

class MealImages extends StatelessWidget {
  final Meal meal;
  final List<XFile> imagesToAdd;
  final List<String> imagesUuidsToDelete;

  final void Function(int index, String imageUuid) onExistingImagesAction;
  final void Function(int index) onNewImagesAction;

  const MealImages({
    super.key,
    required this.meal,
    required this.imagesToAdd,
    required this.imagesUuidsToDelete,
    required this.onExistingImagesAction,
    required this.onNewImagesAction,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: DesignSystem.animation.defaultDurationMS250,
      child: this.meal.imagesUuids.isNotEmpty || this.imagesToAdd.isNotEmpty
          ? Wrap(
              spacing: DesignSystem.spacing.x24,
              runSpacing: DesignSystem.spacing.x24,
              children: [
                ...this.meal.imagesUuids.mapIndexed(
                      (index, imageUuid) => MealoBaseImage(
                        imageUuid: imageUuid,
                        subPath: Meal.subPathForImages,
                        height: 128.0,
                        width: 128.0,
                        icon: CupertinoIcons.clear,
                        onAction: () =>
                            this.onExistingImagesAction(index, imageUuid),
                      ),
                    ),
                ...this.imagesToAdd.mapIndexed(
                      (index, image) => MealoBaseImage(
                        image: image,
                        height: 128.0,
                        width: 128.0,
                        icon: CupertinoIcons.clear,
                        onAction: () => this.onNewImagesAction(index),
                      ),
                    ),
              ],
            )
          : BaseCard(
              topPadding: 0,
              bottomPadding: 0,
              leftPadding: 0,
              rightPadding: 0,
              backgroundColor: Theme.of(context).cardColor.lighten(2),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: DesignSystem.spacing.x24),
                child: const BasePlaceholder(
                  text: 'No additional images set yet',
                ),
              ),
            ),
    );
  }
}
