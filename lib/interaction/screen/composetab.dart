import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import '../../widget/custom_container.dart';
import '../widget/custom_radio_button.dart';

class ComposeTabScreen extends StatefulWidget {
  const ComposeTabScreen({super.key});

  @override
  State<ComposeTabScreen> createState() => _ComposeTabScreenState();
}

class _ComposeTabScreenState extends State<ComposeTabScreen> {
  List<String> staffList = ["Ankush", "Shailesh"];
  String selectedStaff = 'Ankush';
  final TextEditingController about = TextEditingController();
  final TextEditingController subject = TextEditingController();
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
          child: CustomContainer(
            child: TextField(
              style: Theme.of(context).textTheme.titleSmall,
              controller: subject,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Color(0xFFFFEBEA)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/subjectfielicon.png",
                        height: 24.0,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        " Subject ".tr,
                        style: Theme.of(context).textTheme.labelMedium!.merge(
                              const TextStyle(
                                  fontSize: 20.0, color: Color(0xFFFF6F67)),
                            ),
                      ),
                    ],
                  ),
                ),
                hintText: 'Enter here.'.tr,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomContainer(
            child: TextField(
              style: Theme.of(context).textTheme.titleSmall,
              controller: about,
              maxLines: 3,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: Color(0xFFDBFDF5)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/abouticon.png",
                        height: 24.0,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        " About ".tr,
                        style: Theme.of(context).textTheme.labelMedium!.merge(
                              const TextStyle(
                                  fontSize: 20.0, color: Color(0xFF47BA9E)),
                            ),
                      ),
                    ],
                  ),
                ),
                hintText: 'Enter here.'.tr,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.transparent,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const SizedBox(height: 30),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: const [
              BoxShadow(
                offset: Offset(0, 1),
                blurRadius: 8,
                color: Colors.black12,
              ),
            ],
          ),
          child: DropdownButtonFormField<String>(
            value: selectedStaff,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              isDense: true,
              label: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(229, 243, 255, 1),
                  borderRadius: BorderRadius.all(
                    Radius.circular(24),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 33,
                      child: Image.asset(
                        'assets/images/selectteachericon.png',
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'Select Teacher',
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20.0,
                              color: Color.fromRGBO(60, 120, 170, 1),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            icon: const Padding(
              padding: EdgeInsets.only(top: 3),
              child: Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 30,
              ),
            ),
            iconSize: 30,
            items: List.generate(staffList.length, (index) {
              return DropdownMenuItem(
                value: staffList.elementAt(index),
                child: Padding(
                  padding: const EdgeInsets.only(top: 13, left: 5),
                  child: Text(
                    staffList.elementAt(index),
                    style: Theme.of(context).textTheme.labelSmall!.merge(
                        const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            letterSpacing: 0.3)),
                  ),
                ),
              );
            }),
            onChanged: (s) {
              selectedStaff = s!;
            },
          ),
        ),
      ],
    );
  }
}
