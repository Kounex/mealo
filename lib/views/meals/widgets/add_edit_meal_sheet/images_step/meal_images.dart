import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../models/meal/meal.dart';
import '../../../../../utils/styling.dart';
import '../../../../../widgets/base/ui/image.dart';
import '../../../../../widgets/base/ui/placeholder_text.dart';
import 'images_step.dart';

class MealImages extends StatelessWidget {
  final MealImageType type;

  final Meal meal;

  final List<XFile> thumbnailToAdd;
  final List<XFile> imagesToAdd;

  final List<String> imagesUUIDsToDelete;

  final VoidCallback onThumbnailAction;
  final void Function(int index, String imageUUID) onExistingImagesAction;
  final void Function(int index) onNewImagesAction;

  const MealImages({
    super.key,
    required this.type,
    required this.meal,
    required this.thumbnailToAdd,
    required this.imagesToAdd,
    required this.imagesUUIDsToDelete,
    required this.onThumbnailAction,
    required this.onExistingImagesAction,
    required this.onNewImagesAction,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: StylingUtils.kBaseAnimationDuration,
      child: () {
        switch (this.type) {
          case MealImageType.thumbnail:
            return this.meal.thumbnailUUID != null ||
                    this.thumbnailToAdd.isNotEmpty
                ? BaseImage(
                    imageUUID: this.meal.thumbnailUUID,
                    image: this.thumbnailToAdd.firstOrNull,
                    height: 172.0,
                    width: 172.0,
                    icon: CupertinoIcons.clear,
                    onAction: this.onThumbnailAction,
                  )
                : Container(
                    height: 172.0,
                    alignment: Alignment.center,
                    child: const BasePlaceholder(
                      text: 'No thumbnail set yet',
                    ),
                  );
          case MealImageType.additional:
            return this.meal.imagesUUIDs.isNotEmpty ||
                    this.imagesToAdd.isNotEmpty
                ? Wrap(
                    spacing: 24.0,
                    runSpacing: 24.0,
                    children: [
                      ...this.meal.imagesUUIDs.mapIndexed(
                            (index, imageUUID) => BaseImage(
                              imageUUID: imageUUID,
                              height: 128.0,
                              width: 128.0,
                              icon: CupertinoIcons.clear,
                              onAction: () =>
                                  this.onExistingImagesAction(index, imageUUID),
                            ),
                          ),
                      ...this.imagesToAdd.mapIndexed(
                            (index, image) => BaseImage(
                              image: image,
                              height: 128.0,
                              width: 128.0,
                              icon: CupertinoIcons.clear,
                              onAction: () => this.onNewImagesAction(index),
                            ),
                          ),
                    ],
                  )
                : Container(
                    height: 172.0,
                    alignment: Alignment.center,
                    child: const BasePlaceholder(
                      text: 'No additional images set yet',
                    ),
                  );
        }
      }(),
    );
  }
}
