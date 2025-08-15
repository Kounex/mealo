import 'package:base_components/base_components.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mealo/views/meals/widgets/add_edit_meal_sheet/images_step/image_preview.dart';
import 'package:reorderables/reorderables.dart';

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

    HapticFeedback.selectionClick();

    if (_orderMode) {
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

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: DesignSystem.animation.defaultDurationMS250,
      child: this.widget.meal.imagesUuids.isNotEmpty
          ? GestureDetector(
              behavior: HitTestBehavior.translucent,
              onLongPress: () => _toggleOrderMode(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Flexible(
                    child: ReorderableWrap(
                      controller: this.widget.controller,
                      enableReorder: _orderMode,
                      onReorder: (oldIndex, newIndex) => setState(() {
                        final item =
                            this.widget.meal.imagesUuids.removeAt(oldIndex);
                        this.widget.meal.imagesUuids.insert(newIndex, item);
                      }),
                      spacing: DesignSystem.spacing.x12,
                      runSpacing: DesignSystem.spacing.x12,
                      needsLongPressDraggable: false,
                      children: [
                        ...this.widget.meal.imagesUuids.mapIndexed(
                              (index, imageUuid) => GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onDoubleTap: () => _setThumbnail(imageUuid),
                                onTap: () => ModalUtils.showFullscreen(
                                  context: context,
                                  transparent: true,
                                  includeClose: false,
                                  content: ImagePreview(
                                    imageUuid: imageUuid,
                                  ),
                                ),
                                child: Animate(
                                  autoPlay: false,
                                  controller: _controller,
                                  effects: [
                                    RotateEffect(
                                      begin: -0.002,
                                      end: 0.002,
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
                                    borderColor:
                                        this.widget.meal.thumbnailUuid ==
                                                imageUuid
                                            ? Theme.of(context)
                                                .colorScheme
                                                .onSurface
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
                  ),
                  SizedBox(height: DesignSystem.spacing.x24),
                  Text(
                    'Long press above to toggle the reorder mode.\nDouble tap an image to set it as the thumbnail. If no thumbnail is set, it\'s going to be the first one.',
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
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
