import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PressDoneTag extends StatelessWidget {
  const PressDoneTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.0,
      width: 38.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: const Icon(
        CupertinoIcons.return_icon,
        size: 16.0,
      ),
      //     Text(
      //   'Press\nDone',
      //   textAlign: TextAlign.center,
      //   style: Theme.of(context)
      //       .textTheme
      //       .labelSmall!
      //       .copyWith(color: Theme.of(context).colorScheme.onPrimary),
      // ),
    );
  }
}
