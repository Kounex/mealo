import 'package:base_components/base_components.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/images_step/image_preview.dart';
import 'package:reorderable_grid/reorderable_grid.dart';

import '../../../../../models/meal/meal.dart';
import '../../../../../widgets/shared/image.dart';

class MealImages extends ConsumerStatefulWidget {
  final ScrollController? controller;

  final Meal meal;

  final void Function(String imageUuid) onImageAction;

  const MealImages({
    super.key,
    this.controller,
    required this.meal,
    required this.onImageAction,
  });

  @override
  ConsumerState<MealImages> createState() => _MealImagesState();
}

class _MealImagesState extends ConsumerState<MealImages>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _orderMode = false;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this)..value = 0.5;
  }

  void _toggleOrderMode() {
    setState(() => _orderMode = !_orderMode);

    if (_orderMode) {
      HapticFeedback.lightImpact();
      _controller.repeat(reverse: true);
    } else {
      _controller.animateTo(0.5);
    }
  }

  void _setThumbnail(String imageUuid) {
    if (this.widget.meal.thumbnailUuid != imageUuid) {
      setState(() => this.widget.meal.thumbnailUuid = imageUuid);
    }
  }

  void _showImagePreview(String imageUuid) => ModalUtils.showFullscreen(
        context: context,
        barrierDismissible: true,
        transparent: true,
        blur: true,
        content: ImagePreview(imageUuid: imageUuid),
      );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: DesignSystem.animation.defaultDurationMS250,
      child: this.widget.meal.imagesUuids.isNotEmpty
          ? Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: ReorderableGridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    crossAxisSpacing: DesignSystem.spacing.x12,
                    mainAxisSpacing: DesignSystem.spacing.x12,
                    onReorder: (oldIndex, newIndex) => setState(() {
                      final item =
                          this.widget.meal.imagesUuids.removeAt(oldIndex);
                      this.widget.meal.imagesUuids.insert(newIndex, item);
                    }),
                    onReorderStart: (_) => setState(() => _toggleOrderMode()),
                    onReorderEnd: () => setState(() => _toggleOrderMode()),
                    shrinkWrap: true,
                    padding: EdgeInsets.all(DesignSystem.spacing.x8),
                    children: [
                      ...this.widget.meal.imagesUuids.mapIndexed(
                            (index, imageUuid) => GestureDetector(
                              key: ValueKey(imageUuid),
                              behavior: HitTestBehavior.translucent,
                              onDoubleTap: () => _setThumbnail(imageUuid),
                              onTap: () => _showImagePreview(imageUuid),
                              child: Animate(
                                autoPlay: false,
                                controller: _controller,
                                effects: [
                                  RotateEffect(
                                    begin: -0.003,
                                    end: 0.003,
                                    duration: DesignSystem
                                        .animation.defaultDurationMS150,
                                    curve: Curves.easeInOut,
                                  ),
                                  ScaleEffect(
                                    begin: const Offset(0.998, 0.998),
                                    end: const Offset(1.002, 1.002),
                                    duration: DesignSystem
                                        .animation.defaultDurationMS150,
                                    curve: Curves.easeInOut,
                                  ),
                                ],
                                child: MealoBaseImage(
                                  imageUuid: imageUuid,
                                  subPath: Meal.subPathForImages,
                                  height:
                                      MediaQuery.sizeOf(context).width / 3.75,
                                  width:
                                      MediaQuery.sizeOf(context).width / 3.75,
                                  additionalIcon:
                                      this.widget.meal.thumbnailUuid ==
                                              imageUuid
                                          ? CupertinoIcons.photo
                                          : null,
                                  borderColor: this.widget.meal.thumbnailUuid ==
                                          imageUuid
                                      ? Theme.of(context).colorScheme.onSurface
                                      : null,
                                  icon: CupertinoIcons.clear,
                                  onAction: () =>
                                      this.widget.onImageAction(imageUuid),
                                ),
                              ),
                            ),
                          ),
                    ],
                  ),
                  //     ReorderableWrap(
                  //   controller: this.widget.controller,
                  //   enableReorder: _orderMode,
                  //   onReorder: (oldIndex, newIndex) => setState(() {
                  //     final item =
                  //         this.widget.meal.imagesUuids.removeAt(oldIndex);
                  //     this.widget.meal.imagesUuids.insert(newIndex, item);
                  //   }),
                  //   spacing: DesignSystem.spacing.x12,
                  //   runSpacing: DesignSystem.spacing.x12,
                  //   needsLongPressDraggable: false,
                  //   children: [
                  //     ...this.widget.meal.imagesUuids.mapIndexed(
                  //           (index, imageUuid) => GestureDetector(
                  //             key: ValueKey(imageUuid),
                  //             behavior: HitTestBehavior.translucent,
                  //             onDoubleTap: () => _setThumbnail(imageUuid),
                  //             onTap: () => _showImagePreview(imageUuid),
                  //             child: Animate(
                  //               autoPlay: false,
                  //               controller: _controller,
                  //               effects: [
                  //                 RotateEffect(
                  //                   begin: -0.003,
                  //                   end: 0.003,
                  //                   duration: DesignSystem
                  //                       .animation.defaultDurationMS150,
                  //                   curve: Curves.easeInOut,
                  //                 ),
                  //                 ScaleEffect(
                  //                   begin: const Offset(0.998, 0.998),
                  //                   end: const Offset(1.002, 1.002),
                  //                   duration: DesignSystem
                  //                       .animation.defaultDurationMS150,
                  //                   curve: Curves.easeInOut,
                  //                 ),
                  //               ],
                  //               child: MealoBaseImage(
                  //                 imageUuid: imageUuid,
                  //                 subPath: Meal.subPathForImages,
                  //                 height:
                  //                     MediaQuery.sizeOf(context).width / 3.75,
                  //                 width:
                  //                     MediaQuery.sizeOf(context).width / 3.75,
                  //                 additionalIcon:
                  //                     this.widget.meal.thumbnailUuid ==
                  //                             imageUuid
                  //                         ? CupertinoIcons.photo
                  //                         : null,
                  //                 borderColor:
                  //                     this.widget.meal.thumbnailUuid ==
                  //                             imageUuid
                  //                         ? Theme.of(context)
                  //                             .colorScheme
                  //                             .onSurface
                  //                         : null,
                  //                 icon: CupertinoIcons.clear,
                  //                 onAction: () =>
                  //                     this.widget.onImageAction(imageUuid),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //   ],
                  // ),
                ),
                SizedBox(height: DesignSystem.spacing.x18),
                Text(
                  'Long press an image to reorder it.\nDouble tap an image to set it as the thumbnail.\nIf no thumbnail is set, it\'s going to be the first image.',
                  textAlign: TextAlign.center,
                ),
              ],
            )
          : BaseCard(
              topPadding: 0,
              bottomPadding: 0,
              leftPadding: 0,
              rightPadding: 0,
              backgroundColor: Theme.of(context).cardColor.lighten(2),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(vertical: DesignSystem.spacing.x24),
                child: const BasePlaceholder(
                  text: 'No images set yet',
                ),
              ),
            ),
    );
  }
}
