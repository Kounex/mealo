import 'package:base_components/base_components.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class MealoBaseImage extends StatelessWidget {
  final XFile? image;

  final String? imageUuid;
  final String? subPath;

  final double? height;
  final double? width;

  final IconData? icon;

  final void Function()? onAction;

  final IconData? additionalIcon;

  final Color? borderColor;

  const MealoBaseImage({
    super.key,
    this.image,
    this.imageUuid,
    this.subPath,
    this.height,
    this.width,
    this.icon,
    this.onAction,
    this.additionalIcon,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(platform: TargetPlatform.android),
      child: BaseImage(
        imageUuid: this.imageUuid,
        image: this.image,
        subPath: this.subPath,
        height: this.height,
        width: this.width,
        icon: this.icon,
        onAction: this.onAction,
        additionalIcon: this.additionalIcon,
        borderColor: this.borderColor,
      ),
    );
  }
}
