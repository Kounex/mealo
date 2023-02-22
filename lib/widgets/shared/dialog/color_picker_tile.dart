import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:mealo/utils/modal.dart';

class ColorPickerTile extends StatelessWidget {
  final String? colorHex;

  final void Function(Color color) onColorSet;

  const ColorPickerTile({
    super.key,
    required this.colorHex,
    required this.onColorSet,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Row(
        children: [
          Container(
            height: 32.0,
            width: 32.0,
            decoration: BoxDecoration(
              color: this.colorHex?.toColor ?? Colors.transparent,
              shape: BoxShape.circle,
              border: Border.all(color: Theme.of(context).dividerColor),
            ),
          ),
          const SizedBox(width: 12.0),
          Text(this.colorHex ?? 'No specific color set'),
        ],
      ),
      onTap: () => ModalUtils.showBaseDialog(
        context,
        AlertDialog(
          content: ColorPicker(
            pickerColor: this.colorHex?.toColor ?? Colors.white,
            onColorChanged: this.onColorSet,
            hexInputBar: true,
            paletteType: PaletteType.hueWheel,
            enableAlpha: false,
          ),
        ),
      ),
    );
  }
}
