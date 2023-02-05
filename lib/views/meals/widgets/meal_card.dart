import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mealo/utils/router.dart';

import '../../../models/meal/meal.dart';

class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({
    super.key,
    required this.meal,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => RouterUtils.goTo(
        context,
        MealDetailRoute(this.meal.uuid),
        data: meal,
      ),
      child: Card(
        elevation: 10,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Hero(
              tag: this.meal.uuid,
              child: this.meal.thumbnailBase64 != null
                  ? Image.memory(base64Decode(this.meal.thumbnailBase64!))
                  : Image.asset('assets/images/meal-placeholder.png'),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                height: 48.0,
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
                    this.meal.name,
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
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
