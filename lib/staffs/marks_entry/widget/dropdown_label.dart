import 'package:flutter/material.dart';

class CustomDropDownLabel extends StatelessWidget {
  final String icon;
  final String text;
  final Color containerColor;
  final Color textColor;
  const CustomDropDownLabel(
      {super.key,
      required this.icon,
      required this.text,
      required this.containerColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 25,
            child: FittedBox(
              fit: BoxFit.cover,
              child: Image.asset(
                icon,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: Theme.of(context).textTheme.titleSmall!.merge(
                  TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20.0,
                    color: textColor,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
