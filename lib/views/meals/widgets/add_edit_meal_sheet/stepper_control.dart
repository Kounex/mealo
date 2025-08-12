import 'package:base_components/base_components.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class StepperControl extends StatelessWidget {
  final int step;
  final int max;

  final void Function()? onBack;
  final void Function()? onNext;
  final void Function()? onSave;

  const StepperControl({
    super.key,
    required this.step,
    required this.max,
    this.onBack,
    this.onNext,
    this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: this.step > 0 ? this.onBack : null,
            child: const Text('Back'),
          ),
        ),
        SizedBox(width: DesignSystem.spacing.x24),
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              if (this.step < this.max) {
                this.onNext?.call();
              } else {
                this.onSave?.call();
              }
            },
            style: ButtonStyle(
              backgroundColor: this.step >= this.max
                  ? const WidgetStatePropertyAll(Colors.green)
                  : null,
            ),
            child: Text(
              this.step >= this.max ? 'Save' : 'Next',
              style: TextStyle(
                color: this.step >= this.max
                    ? Colors.green.onColor
                    : Theme.of(context).colorScheme.primaryContainer.onColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
