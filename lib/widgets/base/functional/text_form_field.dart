import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mealo/utils/styling.dart';

class BaseTextFormField extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;

  final String? Function(String?)? validator;
  void Function(String)? onFieldSubmitted;

  final String? hintText;

  final bool loseFocusOnTapOutside;

  BaseTextFormField({
    super.key,
    this.focusNode,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.hintText,
    this.loseFocusOnTapOutside = true,
  });

  @override
  State<BaseTextFormField> createState() => _BaseTextFormFieldState();
}

class _BaseTextFormFieldState extends State<BaseTextFormField> {
  late FocusNode _focus;
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _focus = this.widget.focusNode ?? FocusNode();
    _controller = this.widget.controller ?? TextEditingController();

    _focus.addListener(() {
      if (context.mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // key: this.widget.key,
      focusNode: _focus,
      controller: _controller,
      decoration: InputDecoration(
        hintText: this.widget.hintText,
        suffixIcon: AnimatedSwitcher(
          duration: StylingUtils.kBaseAnimationDuration,
          child: _focus.hasFocus
              ? IconButton(
                  onPressed: () => _controller.clear(),
                  icon: const Icon(CupertinoIcons.clear_circled_solid),
                )
              : const SizedBox(),
        ),
      ),
      onTapOutside:
          this.widget.loseFocusOnTapOutside ? (_) => _focus.unfocus() : null,
      validator: this.widget.validator,
      onFieldSubmitted: this.widget.onFieldSubmitted,
    );
  }
}
