import 'package:base_components/base_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AmountTextField extends StatelessWidget {
  final TextEditingController controller;

  const AmountTextField({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BaseTextFormField(
      controller: this.controller,
      hintText: 'Amount',
      maxLines: 1,
      maxLength: 6,
      // keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
        TextInputFormatter.withFunction((oldValue, newValue) {
          try {
            final text = newValue.text.replaceAll(RegExp(r','), '.');
            if (text.isNotEmpty) double.parse(text);
            return newValue.copyWith(text: text);
          } catch (e) {}
          return oldValue;
        }),
      ],
      triggerSubmitOnLoseFocus: true,
    );
  }
}
