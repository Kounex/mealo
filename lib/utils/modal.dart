import 'dart:math';

import 'package:flutter/material.dart';
import 'styling.dart';

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
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 12.0),
                    Container(
                      height: 6.0,
                      width: 48.0,
                      decoration: BoxDecoration(
                        color: StylingUtils.lightDisabledColor(context),
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    content,
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
