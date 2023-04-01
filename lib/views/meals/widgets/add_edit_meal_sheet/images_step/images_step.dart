import 'dart:convert';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/utils/styling.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/images_step/action_image.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/images_step/image_from_url_dialog.dart';
import 'package:mealo/widgets/base/functional/camera/camera.dart';
import 'package:mealo/widgets/base/ui/result.dart';

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
  final List<String> thumbnailBase64;
  final List<String> imagesBase64;

  const ImagesStep({
    super.key,
    required this.thumbnailBase64,
    required this.imagesBase64,
  });

  @override
  State<StatefulWidget> createState() => _ImagesStepState();
}

class _ImagesStepState extends State<ImagesStep> {
  MealImageType _type = MealImageType.thumbnail;

  Future<List<String>> _showPhotoPickerSheet() async {
    ImagePickerType? type = await showModalBottomSheet<ImagePickerType>(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
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
      ),
    );

    if (type != null && mounted) {
      switch (type) {
        case ImagePickerType.camera:
          showCupertinoModalPopup(
            context: context,
            builder: (context) => const BaseCamera(),
          );

          break;
        case ImagePickerType.gallery:

        /// TODO: ImagePicker implementation
        case ImagePickerType.url:
          String? imageBase64 = await ModalUtils.showBaseDialog(
            context,
            const ImageFromURLDialog(),
          );
          if (imageBase64 != null) {
            setState(
              () => this.widget.thumbnailBase64
                ..clear()
                ..add(imageBase64),
            );
          }
      }
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 256,
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
        const SizedBox(height: 48.0),
        SingleChildScrollView(
          child: AnimatedSwitcher(
            duration: StylingUtils.kBaseAnimationDuration,
            child: () {
              switch (_type) {
                case MealImageType.thumbnail:
                  return Column(
                    key: ValueKey(_type),
                    children: [
                      this.widget.thumbnailBase64.isNotEmpty
                          ? ActionImage(
                              imageBase64: this.widget.thumbnailBase64.first,
                              height: 128.0,
                              icon: CupertinoIcons.clear,
                              onPress: () {},
                            )
                          : const BaseResult(
                              text: 'No thumbnail set yet',
                              icon: BaseResultIcon.Missing,
                              iconSize: 48,
                            ),
                      const SizedBox(height: 48.0),
                      SizedBox(
                        width: 256,
                        child: ElevatedButton(
                          onPressed: () {
                            _showPhotoPickerSheet();
                          },
                          child: const Text('Select photo'),
                        ),
                      ),
                    ],
                  );
                case MealImageType.additional:
                  return Column(
                    key: ValueKey(_type),
                    children: [
                      this.widget.imagesBase64.isNotEmpty
                          ? Wrap(
                              children: this
                                  .widget
                                  .imagesBase64
                                  .map(
                                    (imageBase64) => Image.memory(
                                      base64Decode(imageBase64),
                                      height: 48.0,
                                    ),
                                  )
                                  .toList(),
                            )
                          : const BaseResult(
                              text: 'No additional images set yet',
                              icon: BaseResultIcon.Missing,
                              iconSize: 48,
                            ),
                      const SizedBox(height: 48.0),
                      SizedBox(
                        width: 256,
                        child: ElevatedButton(
                          onPressed: () {
                            _showPhotoPickerSheet();
                          },
                          child: const Text('Select photo'),
                        ),
                      ),
                    ],
                  );
              }
            }(),
          ),
        )
      ],
    );
  }
}
