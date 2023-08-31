import 'package:flutter/material.dart';

class DaysDropdown extends StatelessWidget {
  final TextEditingController controller;
  final List<int?> daysNotEaten;

  final void Function(int? day) onSelected;

  const DaysDropdown({
    super.key,
    required this.controller,
    required this.daysNotEaten,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: DropdownMenu<int?>(
        onSelected: this.onSelected,
        controller: this.controller,
        helperText: 'Amount of days',
        dropdownMenuEntries: this
            .daysNotEaten
            .map(
              (day) => DropdownMenuEntry(
                value: day,
                label: day != null ? day.toString() : '',
              ),
            )
            .toList(),
      ),
    );
  }
}
