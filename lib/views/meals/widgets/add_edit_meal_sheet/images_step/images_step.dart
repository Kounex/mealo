import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mealo/utils/modal.dart';
import 'package:mealo/utils/styling.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/images_step/action_image.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/images_step/image_from_url_dialog.dart';
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

  Future? _pickFuture;

  Future<List<String>> _showPhotoPickerSheet([bool multiple = false]) async {
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
      List<String> imagesBase64 = [];
      switch (type) {
        case ImagePickerType.camera:
        case ImagePickerType.gallery:
          imagesBase64 = await _pickImages(type, multiple);
          break;
        case ImagePickerType.url:
          String? imageBase64 = await ModalUtils.showBaseDialog(
            context,
            const ImageFromURLDialog(),
          );

          if (imageBase64 != null) {
            imagesBase64.add(imageBase64);
          }
          break;
      }
      if (imagesBase64.isNotEmpty) {
        setState(
          () {
            if (multiple) {
              this.widget.imagesBase64.addAll(imagesBase64);
            } else {
              this.widget.thumbnailBase64
                ..clear()
                ..add(imagesBase64.first);
            }
          },
        );
      }
    }

    return [];
  }

  Future<List<String>> _pickImages(ImagePickerType type,
      [bool multiple = false]) async {
    final ImagePicker picker = ImagePicker();

    List<XFile?> photos = [];
    switch (type) {
      case ImagePickerType.camera:
        setState(() {
          _pickFuture = picker.pickImage(source: ImageSource.camera);
        });
        photos.addAll(await _pickFuture);
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

    photos.removeWhere((photo) => photo == null);

    if (photos.isNotEmpty) {
      List<String> images = [];
      for (XFile? photo in photos) {
        images.add(base64Encode(await photo!.readAsBytes()));
      }
      return images;
    }
    return [];
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
                            return this.widget.thumbnailBase64.isNotEmpty
                                ? ActionImage(
                                    imageBase64:
                                        this.widget.thumbnailBase64.first,
                                    height: 172.0,
                                    width: 172.0,
                                    icon: CupertinoIcons.clear,
                                    onPress: () => setState(() =>
                                        this.widget.thumbnailBase64.clear()),
                                  )
                                : Container(
                                    height: 172.0,
                                    alignment: Alignment.center,
                                    child: const BasePlaceholderText(
                                      text: 'No thumbnail set yet',
                                    ),
                                  );
                          case MealImageType.additional:
                            return this.widget.imagesBase64.isNotEmpty
                                ? Wrap(
                                    spacing: 24.0,
                                    runSpacing: 24.0,
                                    children: this
                                        .widget
                                        .imagesBase64
                                        .mapIndexed(
                                          (index, imageBase64) => ActionImage(
                                            imageBase64: imageBase64,
                                            height: 128.0,
                                            width: 128.0,
                                            icon: CupertinoIcons.clear,
                                            onPress: () => setState(() => this
                                                .widget
                                                .imagesBase64
                                                .removeAt(index)),
                                          ),
                                        )
                                        .toList(),
                                  )
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
