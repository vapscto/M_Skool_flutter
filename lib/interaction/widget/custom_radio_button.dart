import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final String label;
  final dynamic groupValue;
  final dynamic value;
  const CustomRadioButton(
      {required this.label,
      required this.value,
      required this.groupValue,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Radio(
          value: value,
          groupValue: groupValue,
          onChanged: (selected) {},
        ),
        const SizedBox(width: 3),
        AutoSizeText(label, style: const TextStyle(fontWeight: FontWeight.w500))
      ],
    );
  }
}
