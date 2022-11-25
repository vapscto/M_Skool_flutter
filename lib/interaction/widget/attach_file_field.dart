import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../config/themes/theme_data.dart';

class AttachFileField extends StatelessWidget {
  final String label;
  const AttachFileField({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: CustomThemeData.getShadow(),
            ),
            child: SizedBox(
              height: 58,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("(Optional)"),
                    SvgPicture.asset("assets/svg/upload-cloud.svg")
                  ],
                ),
              ),
            )),
        Positioned(
            top: 0,
            left: 13,
            child: Text(label,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff898989)))),
      ],
    );
  }
}
