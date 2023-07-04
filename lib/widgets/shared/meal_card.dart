import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../base/ui/image.dart';

import '../../../models/meal/meal.dart';

class MealCard extends StatelessWidget {
  final Meal? meal;
  final double? height;
  final double? width;

  final void Function()? onTap;

  const MealCard({
    super.key,
    this.meal,
    this.height,
    this.width,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onTap,
      child: Card(
        // elevation: 10,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Hero(
            //   tag: this.meal?.uuid ?? 'placeholder',
            //   child: this.meal?.thumbnailBase64 != null
            //       ? Image.memory(base64Decode(this.meal!.thumbnailBase64!))
            //       : Image.asset('assets/images/meal-placeholder.png'),
            // ),
            this.meal?.thumbnailUUID != null
                ? BaseImage(
                    imageUUID: this.meal?.thumbnailUUID,
                    height: this.height,
                    width: this.width,
                  )
                : Image.asset('assets/images/meal-placeholder.png'),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height:
                    this.height != null ? min(this.height! / 3, 48.0) : 48.0,
                padding: const EdgeInsets.all(4.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  // border: Border(
                  //   top: BorderSide(color: Theme.of(context).dividerColor),
                  // ),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 12.0,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),
                child: Center(
                  child: AutoSizeText(
                    this.meal?.name ?? '',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
