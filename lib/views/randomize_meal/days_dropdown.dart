import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/design_system.dart';

class DaysDropdown extends StatelessWidget {
  final TextEditingController controller;
  final List<int> daysNotEaten;

  final void Function(int? day) onSelected;
  final void Function()? onClear;

  const DaysDropdown({
    super.key,
    required this.controller,
    required this.daysNotEaten,
    required this.onSelected,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'How long should it at least be since you last ate the meal we\'ll select?',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: DesignSystem.spacing.x12),
        Align(
          alignment: Alignment.centerLeft,
          child: Stack(
            children: [
              DropdownMenu<int?>(
                onSelected: this.onSelected,
                controller: this.controller,
                enabled: this.controller.text.isEmpty,
                helperText: 'Amount of days',
                trailingIcon:
                    this.controller.text.isNotEmpty ? const SizedBox() : null,
                dropdownMenuEntries: this
                    .daysNotEaten
                    .map(
                      (day) => DropdownMenuEntry(
                        value: day,
                        label: day.toString(),
                      ),
                    )
                    .toList(),
              ),
              if (this.onClear != null && this.controller.text.isNotEmpty)
                Positioned(
                  top: DesignSystem.spacing.x8,
                  right: DesignSystem.spacing.x4,
                  child: IconButton(
                    onPressed: this.onClear,
                    icon: const Icon(CupertinoIcons.clear_circled_solid),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
