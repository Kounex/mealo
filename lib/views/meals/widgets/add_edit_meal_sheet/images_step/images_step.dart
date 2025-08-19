import 'package:base_components/base_components.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import '../../../../../models/meal/meal.dart';
import 'image_from_url_dialog.dart';
import 'meal_images.dart';

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
  final ScrollController controller;

  final Meal meal;
  final List<String> imagesToDelete;

  const ImagesStep({
    super.key,
    required this.controller,
    required this.meal,
    required this.imagesToDelete,
  });

  @override
  State<StatefulWidget> createState() => _ImagesStepState();
}

class _ImagesStepState extends State<ImagesStep> {
  Future? _pickFuture;

  Future<void> _saveImages(List<XFile> images) async {
    String path = (await getApplicationDocumentsDirectory()).path;

    List<Future<void>> imagesToSave = [];

    for (XFile image in images) {
      String uuid = const Uuid().v4();
      imagesToSave.add(image.saveTo('$path/${Meal.subPathForImages}/$uuid'));
      this.widget.meal.imagesUuids.add(uuid);
    }

    await Future.wait(imagesToSave);
  }

  Future<void> _showPhotoPickerSheet() async {
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
          images = await _pickImages(type, true);
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
        await _saveImages(images);
        setState(() {});
      }
    }
  }

  Future<List<XFile>> _pickImages(ImagePickerType type,
      [bool multiple = false]) async {
    final ImagePicker picker = ImagePicker();

    List<XFile?> photos = [];
    switch (type) {
      case ImagePickerType.camera:
        _pickFuture = picker.pickImage(source: ImageSource.camera);
        photos.add(await _pickFuture);
        break;
      case ImagePickerType.gallery:
        if (multiple) {
          _pickFuture = picker.pickMultiImage();
          photos.addAll(await _pickFuture);
        } else {
          _pickFuture = picker.pickImage(source: ImageSource.gallery);
          photos.add(await _pickFuture);
        }
        break;
      default:
        break;
    }

    return photos.whereType<XFile>().toList();
  }

  /// We are deleting this image only from the [meal] object and not
  /// on storage yet since the user might not save this state. When the
  /// user saves the [meal] we will actually delete it
  void _deleteImage(String imageUuid) {
    setState(() {
      this.widget.imagesToDelete.add(imageUuid);
      this.widget.meal.imagesUuids.remove(imageUuid);
      if (this.widget.meal.thumbnailUuid == imageUuid) {
        this.widget.meal.thumbnailUuid = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            MealImages(
              meal: this.widget.meal,
              onImageAction: _deleteImage,
            ),
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
            onPressed: _showPhotoPickerSheet,
            child: const Text('Select photo(s)'),
          ),
        ),
      ],
    );
  }
}
