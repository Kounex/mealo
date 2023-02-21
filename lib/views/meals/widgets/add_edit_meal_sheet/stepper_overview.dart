import 'package:flutter/material.dart';
import 'package:mealo/utils/styling.dart';

class StepperOverview extends StatelessWidget {
  final int step;
  final int max;

  final double size;

  final void Function(int step)? onStepTapped;

  const StepperOverview({
    super.key,
    required this.step,
    required this.max,
    this.size = 32.0,
    this.onStepTapped,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    List.generate(this.max + 1, (index) {
      children.add(
        GestureDetector(
          onTap:
              index != this.step ? () => this.onStepTapped?.call(index) : null,
          child: AnimatedContainer(
            duration: StylingUtils.kBaseAnimationDuration,
            height: this.size,
            width: this.size,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: index == this.step
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).disabledColor,
              shape: BoxShape.circle,
            ),
            child: Text(
              (index + 1).toString(),
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ),
        ),
      );
      if (index < this.max) {
        children.add(
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Divider(thickness: 0),
            ),
          ),
        );
      }
    });

    return Row(
      children: children,
    );
  }
}
