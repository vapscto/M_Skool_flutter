import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/vaps_container.dart';

class FeeReceiptHome extends StatefulWidget {
  const FeeReceiptHome({super.key});

  @override
  State<FeeReceiptHome> createState() => _FeeReceiptHomeState();
}

class _FeeReceiptHomeState extends State<FeeReceiptHome> {
  List<String> dummySession = [
    "2017-2018",
    "2018-2019",
    "2019-2020",
    "2020-2021",
    "2021-2022",
  ];

  String selectedValue = "2021-2022";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Fee Receipt".tr).getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            VapsContainer(
              child: Column(
                children: [
                  Container(
                    //padding: const EdgeInsets.all(12.0),
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
                      value: selectedValue,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(12.0),
                        // ),

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

                        label: Text(
                          "Academic Year".tr,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .merge(TextStyle(color: Colors.grey.shade600)),
                        ),
                      ),
                      icon: const Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: 30,
                      ),
                      iconSize: 30,
                      items: List.generate(
                        dummySession.length,
                        (index) => DropdownMenuItem(
                          value: dummySession.elementAt(index),
                          child: Text(
                            dummySession.elementAt(index),
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .merge(const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16.0,
                                    letterSpacing: 0.3)),
                          ),
                        ),
                      ),
                      onChanged: (s) {},
                    ),
                  ),
                  // CustomContainer(
                  //   child: ListView.separated(
                  //     itemBuilder: (_, index) {},
                  //     separatorBuilder: (_, index) {
                  //       r
                  //     },
                  //     itemCount: 10,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
