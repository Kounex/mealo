import 'dart:math';

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

  static Future<T?> showExpandedModalBottomSheet<T>(
    BuildContext context,
    Widget content, {
    bool fullscreen = false,
  }) =>
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        constraints: !fullscreen
            ? BoxConstraints(
                maxHeight:
                    min(720, MediaQuery.of(context).size.height * (9 / 10)),
                maxWidth: 720,
              )
            : null,
        builder: (_) => content,
      );
}
