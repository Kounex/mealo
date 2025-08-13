import 'package:base_components/base_components.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../../models/meal/meal.dart';
import 'image_from_url_dialog.dart';
import 'meal_images.dart';

enum MealImageType {
  thumbnail,
  additional;

  String get text {
    switch (this) {
      case MealImageType.thumbnail:
        return 'Thumbnail';
      case MealImageType.additional:
        return 'Images';
    }
  }
}

enum ImagePickerType {
  camera,
  gallery,
  url;

  String get text {
    switch (this) {
      case ImagePickerType.camera:
        return 'Camera';
      case ImagePickerType.gallery:
        return 'Gallery';
      case ImagePickerType.url:
        return 'URL';
    }
  }

  IconData get icon {
    switch (this) {
      case ImagePickerType.camera:
        return FluentIcons.camera_24_filled;
      case ImagePickerType.gallery:
        return FluentIcons.album_24_filled;
      case ImagePickerType.url:
        return FluentIcons.web_asset_24_filled;
    }
  }
}

class ImagesStepOld extends StatefulWidget {
  final Meal meal;

  final List<XFile> thumbnailToAdd;
  final List<XFile> imagesToAdd;

  final List<String> imagesUuidsToDelete;

  const ImagesStepOld({
    super.key,
    required this.meal,
    required this.thumbnailToAdd,
    required this.imagesToAdd,
    required this.imagesUuidsToDelete,
  });

  @override
  State<StatefulWidget> createState() => _ImagesStepOldState();
}

class _ImagesStepOldState extends State<ImagesStepOld> {
  MealImageType _type = MealImageType.thumbnail;

  Future? _pickFuture;

  Future<List<String>> _showPhotoPickerSheet([bool multiple = false]) async {
    ImagePickerType? type =
        await ModalUtils.showBaseModalBottomSheet<ImagePickerType>(
      context,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: ImagePickerType.values
            .map(
              (type) => ListTile(
                title: Text(type.text),
                leading: Icon(type.icon),
                onTap: () => Navigator.of(context).pop(type),
              ),
            )
            .toList(),
      ),
    );

    if (type != null && mounted) {
      List<XFile> images = [];
      switch (type) {
        case ImagePickerType.camera:
        case ImagePickerType.gallery:
          images = await _pickImages(type, multiple);
          break;
        case ImagePickerType.url:
          XFile? image = XFile.fromData(await ModalUtils.showBaseDialog(
            context,
            const ImageFromURLDialog(),
          ));

          images.add(image);
          break;
      }
      if (images.isNotEmpty) {
        setState(
          () {
            if (multiple) {
              this.widget.imagesToAdd.addAll(images);
            } else {
              this.widget.thumbnailToAdd
                ..clear()
                ..add(images.first);
            }
          },
        );
      }
    }

    return [];
  }

  Future<List<XFile>> _pickImages(ImagePickerType type,
      [bool multiple = false]) async {
    final ImagePicker picker = ImagePicker();

    List<XFile?> photos = [];
    switch (type) {
      case ImagePickerType.camera:
        setState(() {
          _pickFuture = picker.pickImage(source: ImageSource.camera);
        });
        photos.add(await _pickFuture);
        break;
      case ImagePickerType.gallery:
        if (multiple) {
          setState(() {
            _pickFuture = picker.pickMultiImage();
          });
          photos.addAll(await _pickFuture);
        } else {
          setState(() {
            _pickFuture = picker.pickImage(source: ImageSource.gallery);
          });
          photos.add(await _pickFuture);
        }
        break;
      default:
        break;
    }

    return photos.whereType<XFile>().toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          // width: 256,
          width: double.infinity,
          child: CupertinoSlidingSegmentedControl<MealImageType>(
            groupValue: _type,
            children: {}..addEntries(
                MealImageType.values.map(
                  (type) => MapEntry(type, Text(type.text)),
                ),
              ),
            onValueChanged: (type) =>
                setState(() => _type = type ?? MealImageType.thumbnail),
          ),
        ),
        Column(
          children: [
            SizedBox(height: DesignSystem.spacing.x24),
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: DesignSystem.spacing.x24),
                  child: MealImages(
                    type: _type,
                    meal: this.widget.meal,
                    thumbnailToAdd: this.widget.thumbnailToAdd,
                    imagesToAdd: this.widget.imagesToAdd,
                    imagesUuidsToDelete: this.widget.imagesUuidsToDelete,
                    onThumbnailAction: () => setState(
                      () {
                        if (this.widget.meal.thumbnailUuid != null) {
                          this
                              .widget
                              .imagesUuidsToDelete
                              .add(this.widget.meal.thumbnailUuid!);
                        }
                        this.widget.meal.thumbnailUuid = null;
                        this.widget.thumbnailToAdd.clear();
                      },
                    ),
                    onExistingImagesAction: (index, imageUuid) => setState(
                      () {
                        this.widget.meal.imagesUuids.removeAt(index);
                        this.widget.imagesUuidsToDelete.add(imageUuid);
                      },
                    ),
                    onNewImagesAction: (index) => setState(
                      () => this.widget.imagesToAdd.removeAt(index),
                    ),
                  ),
                ),
                // BaseCard(
                //   topPadding: 0,
                //   bottomPadding: 0,
                //   leftPadding: 0,
                //   rightPadding: 0,
                //   child:
                // ),
                FutureBuilder(
                  future: _pickFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(DesignSystem.border.radius12),
                          ),
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2.0,
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(DesignSystem.spacing.x24),
                          child: BaseProgressIndicator(
                            text: 'Loading image(s)...',
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
            SizedBox(height: DesignSystem.spacing.x24),
            SizedBox(
              // width: 256,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _showPhotoPickerSheet(_type == MealImageType.additional);
                },
                child: const Text('Select photo(s)'),
              ),
            ),
          ],
        )
      ],
    );
  }
}
