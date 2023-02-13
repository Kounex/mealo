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
    Widget content,
  ) =>
      showModalBottomSheet(
        context: context,
        useRootNavigator: true,
        enableDrag: false,
        isDismissible: false,
        isScrollControlled: true,
        constraints: BoxConstraints(
          maxHeight: min(700, MediaQuery.of(context).size.height * (9 / 10)),
          maxWidth: 700,
        ),
        builder: (_) => content,
      );
}
