import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:mealo/widgets/base/functional/animated_color.dart';

import '../../../../utils/styling.dart';
import '../../../../widgets/base/ui/divider.dart';

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

    timeDilation = 1.0;

    List.generate(this.max + 1, (index) {
      children.add(
        Column(
          children: [
            GestureDetector(
              onTap: index != this.step
                  ? () => this.onStepTapped?.call(index)
                  : null,
              child: Container(
                height: this.size,
                width: this.size,
                alignment: Alignment.center,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: AnimatedColor(
                  color: index == this.step
                      ? Theme.of(context).colorScheme.primaryContainer
                      : StylingUtils.lightDisabledColor(context),
                  child: Text(
                    (index + 1).toString(),
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0) +
                  const EdgeInsets.only(bottom: 20.0),
              child: const BaseDivider(),
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
