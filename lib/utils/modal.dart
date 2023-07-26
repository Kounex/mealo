import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                        const SizedBox(height: 8.0),
                        content,
                      ],
                    ),
                    Positioned(
                      top: 12.0,
                      child: Container(
                        height: 5.0,
                        width: 36.0,
                        decoration: BoxDecoration(
                          color: CupertinoColors.inactiveGray.darkColor,
                          borderRadius: BorderRadius.circular(6.0),
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
                maxWidth: 720,
              )
            : null,
        builder: (_) => content,
      );
}
