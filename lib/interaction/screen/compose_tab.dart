import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/interaction/widget/attach_file_field.dart';
import 'package:m_skool_flutter/interaction/widget/custom_dropdown.dart';
import 'package:m_skool_flutter/interaction/widget/custom_radio_button.dart';
import 'package:m_skool_flutter/interaction/widget/custom_text_file.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

class ComposeTabScreen extends StatelessWidget {
  const ComposeTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CustomRadioButton(
                  label: "Group", value: true, groupValue: false),
              SizedBox(width: Get.width * 0.1),
              const CustomRadioButton(
                  label: "Individual", value: true, groupValue: true)
            ],
          ),
          const SizedBox(height: 20),
          CustomTextField(
              label: "Group Name", controller: TextEditingController()),
          const SizedBox(height: 25),
          CustomTextField(label: "About", controller: TextEditingController()),
          const SizedBox(height: 25),
          Row(
            children: [
              const CustomRadioButton(
                  label: "Student", value: true, groupValue: false),
              SizedBox(width: Get.width * 0.1),
              const CustomRadioButton(
                  label: "Teachers", value: true, groupValue: true)
            ],
          ),
          const SizedBox(height: 25),
          CustomDropdown(
              label: "Class",
              items: const ['I', 'II', 'III'],
              onChange: (s) {}),
          const SizedBox(height: 25),
          CustomDropdown(
              label: "Section", items: const ['A', 'B', 'C'], onChange: (s) {}),
          const SizedBox(height: 25),
          CustomDropdown(
              label: "Section Students",
              items: const ['All', 'Class B', 'Class C'],
              onChange: (s) {}),
          const SizedBox(height: 25),
          AttachFileField(label: "Attach Files"),
          const SizedBox(height: 25),
          MSkollBtn(
            title: "Send",
            onPress: () {},
          )
        ],
      ),
    );
  }
}
