import 'package:flutter/material.dart';

class PressDoneTag extends StatelessWidget {
  const PressDoneTag({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.0,
      width: 92.0,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Text(
        'Press Done',
        style: Theme.of(context).textTheme.labelSmall,
      ),
    );
  }
}
