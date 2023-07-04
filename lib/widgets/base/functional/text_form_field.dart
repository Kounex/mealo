import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mealo/utils/styling.dart';

class BaseTextFormField extends StatefulWidget {
  final FocusNode? focusNode;
  final TextEditingController? controller;

  final String? Function(String? text)? validator;
  void Function(String text)? onFieldSubmitted;

  final String? hintText;
  final bool autocorrect;
  final int? minLines;
  final int? maxLines;

  final int? maxLength;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? inputFormatters;

  final bool loseFocusOnTapOutside;
  final bool triggerSubmitOnLoseFocus;

  final bool enabled;

  BaseTextFormField({
    super.key,
    this.focusNode,
    this.controller,
    this.validator,
    this.onFieldSubmitted,
    this.hintText,
    this.autocorrect = true,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.keyboardType,
    this.textInputAction,
    this.inputFormatters,
    this.loseFocusOnTapOutside = true,
    this.triggerSubmitOnLoseFocus = false,
    this.enabled = true,
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
      if (this.widget.triggerSubmitOnLoseFocus && !_focus.hasFocus) {
        this.widget.onFieldSubmitted?.call(_controller.text);
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focus,
      controller: _controller,
      autocorrect: this.widget.autocorrect,
      enabled: this.widget.enabled,
      decoration: InputDecoration(
        hintText: this.widget.hintText,
        counterText: '',
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
      minLines: this.widget.minLines ?? 1,
      maxLines: this.widget.maxLines,
      maxLength: this.widget.maxLength,
      keyboardType: this.widget.keyboardType,
      inputFormatters: this.widget.inputFormatters,
      textInputAction: this.widget.textInputAction ?? TextInputAction.done,
      onFieldSubmitted: this.widget.onFieldSubmitted,
    );
  }
}
