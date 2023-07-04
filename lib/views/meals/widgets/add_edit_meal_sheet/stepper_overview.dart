import 'package:flutter/material.dart';
import 'package:mealo/utils/styling.dart';
import 'package:mealo/widgets/base/ui/divider.dart';

class StepperOverview extends StatelessWidget {
  final int step;
  final int max;

  final double size;

  final List<String>? titles;

  final void Function(int step)? onStepTapped;

  const StepperOverview({
    super.key,
    required this.step,
    required this.max,
    this.size = 32.0,
    this.onStepTapped,
    this.titles,
  }) : assert(titles != null ? titles.length - 1 == max : true);

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [];

    List.generate(this.max + 1, (index) {
      children.add(
        Column(
          children: [
            GestureDetector(
              onTap: index != this.step
                  ? () => this.onStepTapped?.call(index)
                  : null,
              child: AnimatedContainer(
                duration: StylingUtils.kBaseAnimationDuration,
                height: this.size,
                width: this.size,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: index == this.step
                      ? Theme.of(context).colorScheme.primaryContainer
                      : StylingUtils.lightDisabledColor(context),
                  shape: BoxShape.circle,
                ),
                child: Text(
                  (index + 1).toString(),
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ),
            ),
            if (this.titles != null)
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  this.titles![index],
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
          ],
        ),
      );
      if (index < this.max) {
        children.add(
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: BaseDivider(),
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
