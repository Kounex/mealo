import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../confirmation.dart';

class ColorPickerTile extends StatefulWidget {
  final String? colorHex;

  final void Function(Color? color) onColorSet;

  const ColorPickerTile({
    super.key,
    required this.colorHex,
    required this.onColorSet,
  });

  @override
  State<ColorPickerTile> createState() => _ColorPickerTileState();
}

class _ColorPickerTileState extends State<ColorPickerTile> {
  late Color _color;

  @override
  void initState() {
    super.initState();

    _color = this.widget.colorHex?.toColor() ?? Colors.white;
  }

  @override
  void didUpdateWidget(covariant ColorPickerTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    _color = this.widget.colorHex?.toColor() ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 32.0,
                width: 32.0,
                decoration: BoxDecoration(
                  color: this.widget.colorHex?.toColor() ?? Colors.transparent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Theme.of(context).dividerColor),
                ),
              ),
              SizedBox(width: DesignSystem.spacing.x12),
              Text(this.widget.colorHex ?? 'No color set'),
            ],
          ),
          if (this.widget.colorHex != null)
            BaseTextButton(
              onPressed: () => ModalUtils.showBaseDialog(
                context,
                MealoBaseConfirmationDialog(
                  title: 'Reset Color',
                  body:
                      'Are you sure you want to reset your selected Tag color? It will return back to default which is based on the app theme!',
                  isYesDestructive: true,
                  onYes: (_) => this.widget.onColorSet(null),
                ),
              ),
              isDestructive: true,
              child: const Text('Reset'),
            ),
        ],
      ),
      onTap: () => ModalUtils.showBaseDialog(
        context,
        AlertDialog(
          title: const Text('Tag color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _color,
              onColorChanged: (color) => _color = color,
              hexInputBar: true,
              paletteType: PaletteType.hueWheel,
              enableAlpha: false,
            ),
          ),
          actions: [
            BaseTextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            BaseTextButton(
              onPressed: () {
                this.widget.onColorSet(_color);
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
