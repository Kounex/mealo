import 'package:flutter/material.dart';

class BaseTextButton extends StatelessWidget {
  final Widget child;
  final void Function()? onPressed;

  final bool isDestructive;

  const BaseTextButton({
    super.key,
    required this.child,
    this.onPressed,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: this.onPressed,
      style: this.isDestructive
          ? ButtonStyle(
              foregroundColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.error,
              ),
              overlayColor: MaterialStatePropertyAll(
                Theme.of(context).colorScheme.error.withOpacity(0.1),
              ),
            )
          : null,
      child: this.child,
    );
  }
}
