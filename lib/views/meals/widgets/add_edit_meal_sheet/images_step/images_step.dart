import 'package:collection/collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/utils/styling.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/images_step/image_from_url_dialog.dart';
import 'package:mealo/widgets/base/ui/image.dart';
import 'package:mealo/widgets/base/ui/progress_indicator.dart';

import '../../../../../widgets/base/ui/placeholder_text.dart';

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

class ImagesStep extends StatefulWidget {
  final List<String> thumbnailUUID;
  final List<String> imagesUUIDs;

  final List<XFile> thumbnailToAdd;
  final List<XFile> imagesToAdd;

  final List<String> imagesUUIDsToDelete;

  const ImagesStep({
    super.key,
    required this.thumbnailUUID,
    required this.imagesUUIDs,
    required this.thumbnailToAdd,
    required this.imagesToAdd,
    required this.imagesUUIDsToDelete,
  });

  @override
  State<StatefulWidget> createState() => _ImagesStepState();
}

class _ImagesStepState extends State<ImagesStep> {
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
          child: CupertinoSlidingSegmentedControl(
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
            Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(height: 24.0),
                    AnimatedSwitcher(
                      duration: StylingUtils.kBaseAnimationDuration,
                      child: () {
                        switch (_type) {
                          case MealImageType.thumbnail:
                            return this.widget.thumbnailUUID.isNotEmpty ||
                                    this.widget.thumbnailToAdd.isNotEmpty
                                ? BaseImage(
                                    imageUUID:
                                        this.widget.thumbnailUUID.firstOrNull,
                                    image:
                                        this.widget.thumbnailToAdd.firstOrNull,
                                    height: 172.0,
                                    width: 172.0,
                                    icon: CupertinoIcons.clear,
                                    onAction: () => setState(
                                      () {
                                        if (this
                                            .widget
                                            .thumbnailUUID
                                            .isNotEmpty) {
                                          this.widget.imagesUUIDsToDelete.add(
                                              this.widget.thumbnailUUID.first);
                                        }
                                        this.widget.thumbnailUUID.clear();
                                        this.widget.thumbnailToAdd.clear();
                                      },
                                    ),
                                  )
                                : Container(
                                    height: 172.0,
                                    alignment: Alignment.center,
                                    child: const BasePlaceholderText(
                                      text: 'No thumbnail set yet',
                                    ),
                                  );
                          case MealImageType.additional:
                            return this.widget.imagesUUIDs.isNotEmpty ||
                                    this.widget.imagesToAdd.isNotEmpty
                                ? Wrap(
                                    spacing: 24.0,
                                    runSpacing: 24.0,
                                    children: [
                                        ...this.widget.imagesUUIDs.mapIndexed(
                                              (index, imageUUID) => BaseImage(
                                                imageUUID: imageUUID,
                                                height: 128.0,
                                                width: 128.0,
                                                icon: CupertinoIcons.clear,
                                                onAction: () => setState(
                                                  () {
                                                    this
                                                        .widget
                                                        .imagesUUIDs
                                                        .removeAt(index);
                                                    this
                                                        .widget
                                                        .imagesUUIDsToDelete
                                                        .add(imageUUID);
                                                  },
                                                ),
                                              ),
                                            ),
                                        ...this.widget.imagesToAdd.mapIndexed(
                                              (index, image) => BaseImage(
                                                image: image,
                                                height: 128.0,
                                                width: 128.0,
                                                icon: CupertinoIcons.clear,
                                                onAction: () => setState(
                                                  () => this
                                                      .widget
                                                      .imagesToAdd
                                                      .removeAt(index),
                                                ),
                                              ),
                                            ),
                                      ])
                                : Container(
                                    height: 172.0,
                                    alignment: Alignment.center,
                                    child: const BasePlaceholderText(
                                      text: 'No additional images set yet',
                                    ),
                                  );
                        }
                      }(),
                    ),
                    const SizedBox(height: 24.0),
                  ],
                ),
                FutureBuilder(
                  future: _pickFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(24.0),
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
