import 'dart:convert';

import 'package:flutter/material.dart';

class ActionImage extends StatelessWidget {
  final String imageBase64;
  final double? height;
  final double? width;

  final double borderRadius;
  final double borderWidth;

  final double actionSize;
  final IconData? icon;
  final void Function()? onPress;

  const ActionImage({
    super.key,
    required this.imageBase64,
    this.height,
    this.width,
    this.borderRadius = 12.0,
    this.borderWidth = 3.0,
    this.actionSize = 32.0,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).colorScheme.primaryContainer,
              width: this.borderWidth,
            ),
            borderRadius: BorderRadius.circular(this.borderRadius),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(this.borderRadius),
            child: Image.memory(
              base64Decode(this.imageBase64),
              height: this.height,
              width: this.width,
              fit: BoxFit.cover,
            ),
          ),
        ),
        if (this.icon != null && this.onPress != null)
          GestureDetector(
            onTap: this.onPress,
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
