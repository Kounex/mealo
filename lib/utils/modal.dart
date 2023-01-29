import 'dart:math';

import 'package:flutter/material.dart';

class ModalUtils {
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
