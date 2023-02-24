import 'package:flutter/material.dart';

extension StringStuff on String {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  Color toColor() {
    final buffer = StringBuffer();
    if (this.length == 6 || this.length == 7) buffer.write('ff');
    buffer.write(this.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
