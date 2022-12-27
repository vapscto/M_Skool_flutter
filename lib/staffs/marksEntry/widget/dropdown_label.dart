import 'package:flutter/material.dart';

class DropDownLabel extends StatelessWidget {
  final String icon;
  final String text;
  final Color containerColor;
  final Color textColor;
  const DropDownLabel(
      {super.key,
      required this.icon,
      required this.text,
      required this.containerColor,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
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
            height: 33,
            child: Image.asset(
              icon,
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
