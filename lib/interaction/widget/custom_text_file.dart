import 'package:flutter/material.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const CustomTextField(
      {required this.label, required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
              boxShadow: CustomThemeData.getShadow(),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: TextField(
            controller: controller,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w100),
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 17, horizontal: 15),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
            ),
          ),
        ),
        Positioned(
            top: 0,
            left: 13,
            child: Text(label,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    backgroundColor: Colors.white,
                    color: Color(0xff898989)))),
      ],
    );
  }
}
