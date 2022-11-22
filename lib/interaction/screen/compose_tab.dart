import 'package:flutter/material.dart';
import 'package:m_skool_flutter/interaction/widget/custom_radio_button.dart';

class ComposeTabScreen extends StatelessWidget {
  const ComposeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomRadioButton(label: "Group", value: true, groupValue: false)
        ],
      ),
    );
  }
}
