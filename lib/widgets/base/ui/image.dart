import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../utils/modal.dart';
import '../functional/cached_memory_image.dart';
import 'progress_indicator.dart';
import '../../dialog/confirmation.dart';
import 'package:path_provider/path_provider.dart';

class BaseImage extends StatelessWidget {
  final String? imageBase64;
  final String? imageUUID;
  final XFile? image;

  final double? height;
  final double? width;

  final double borderRadius;
  final double borderWidth;

  final double actionSize;
  final IconData? icon;
  final void Function()? onAction;

  const BaseImage({
    super.key,
    this.imageBase64,
    this.imageUUID,
    this.image,
    this.height,
    this.width,
    this.borderRadius = 12.0,
    this.borderWidth = 3.0,
    this.actionSize = 32.0,
    this.icon,
    this.onAction,
  }) : assert(imageBase64 != null || imageUUID != null || image != null);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          height: this.height,
          width: this.width,
          foregroundDecoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: this.borderWidth,
            ),
            borderRadius: BorderRadius.circular(this.borderRadius),
          ),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(this.borderRadius),
              child: () {
                if (this.imageBase64 != null) {
                  return CachedMemoryImage(
                    imageBase64: this.imageBase64!,
                    height: this.height,
                    width: this.width,
                  );
                }
                if (this.image != null) {
                  return FutureBuilder<Uint8List>(
                    future: this.image!.readAsBytes(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return CachedMemoryImage(
                            imageBase64: base64Encode(snapshot.data!),
                            height: this.height,
                            width: this.width,
                          );
                        }
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return BaseProgressIndicator();
                      }
                      return const SizedBox();
                    },
                  );
                }
                if (this.imageUUID != null) {
                  return FutureBuilder<Directory>(
                    future: getApplicationDocumentsDirectory(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        if (snapshot.hasData) {
                          return Image(
                            image: FileImage(
                              File('${snapshot.data!.path}/${this.imageUUID}'),
                            ),
                            height: this.height,
                            width: this.width,
                            fit: BoxFit.cover,
                          );
                        }
                      }
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return BaseProgressIndicator();
                      }
                      return const SizedBox();
                    },
                  );
                }
              }()),
        ),
        if (this.icon != null && this.onAction != null)
          GestureDetector(
            onTap: () => ModalUtils.showBaseDialog(
              context,
              ConfirmationDialog(
                title: 'Delete Image',
                text: 'Are you sure you want to delete this image?',
                onYes: this.onAction,
                isYesDestructive: true,
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              height: this.actionSize,
              width: this.actionSize,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(this.borderRadius),
                  topRight: Radius.circular(this.borderRadius),
                ),
              ),
              child: FittedBox(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  this.icon,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
              )),
            ),
          ),
      ],
    );
  }
}
