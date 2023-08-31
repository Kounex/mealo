import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'design_system.dart';

class ModalUtils {
  static Future<T?> showBaseDialog<T>(
    BuildContext context,
    Widget dialog,
  ) =>
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (context) => dialog,
      );

  static Future<T?> showBaseModalBottomSheet<T>(
    BuildContext context,
    Widget content, {
    bool enableDrag = true,
    bool showDragHandle = true,
  }) =>
      showModalBottomSheet<T>(
        context: context,
        useRootNavigator: true,
        enableDrag: enableDrag,
        builder: (context) => SafeArea(
          child: enableDrag && showDragHandle
              ? Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(height: DesignSystem.spacing.x8),
                        content,
                      ],
                    ),
                    Positioned(
                      top: DesignSystem.spacing.x12,
                      child: Container(
                        height: 5.0,
                        width: 36.0,
                        decoration: BoxDecoration(
                          color: CupertinoColors.inactiveGray.darkColor,
                          borderRadius: BorderRadius.circular(
                              DesignSystem.border.radius6),
                        ),
                      ),
                    ),
                  ],
                )
              : content,
        ),
      );

  static Future<T?> showExpandedModalBottomSheet<T>(
    BuildContext context,
    Widget content, {
    bool fullscreen = false,
    bool forceExpand = false,
    bool includeCloseButton = true,
    void Function()? onClose,
  }) =>
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        constraints: !fullscreen
            ? BoxConstraints(
                maxHeight: forceExpand
                    ? MediaQuery.of(context).size.height * (9 / 10)
                    : min(992, MediaQuery.of(context).size.height * (9 / 10)),
                maxWidth: Breakpoint.sm.width,
                minWidth: Breakpoint.sm.width,
              )
            : null,
        builder: (context) => Stack(
          children: [
            content,
            Positioned(
              top: DesignSystem.spacing.x18,
              right: DesignSystem.spacing.x18,
              child: IconButton(
                onPressed: () {
                  onClose?.call();
                  Navigator.of(context).pop();
                },
                icon: const Icon(CupertinoIcons.clear),
              ),
            ),
          ],
        ),
      );
}
