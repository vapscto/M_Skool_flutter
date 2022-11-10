import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:m_skool_flutter/attendance/screens/attendance_details.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';

class AttendanceHomeScreen extends StatefulWidget {
  const AttendanceHomeScreen({super.key});

  @override
  State<AttendanceHomeScreen> createState() => _AttendanceHomeScreenState();
}

class _AttendanceHomeScreenState extends State<AttendanceHomeScreen> {
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
      appBar: AppBar(
        centerTitle: false,
        leading: const CustomGoBackButton(),
        leadingWidth: 30,
        title: Text("Attendance".tr),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 8.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 4,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/images/vpslogo.png',
                          height: 36,
                        ),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Text(
                          "VAPS International School".tr,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium!
                              .merge(const TextStyle(color: Color(0xFF35658F))),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
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
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: CustomThemeData.getShadow(),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              style:
                                  Theme.of(context).textTheme.labelSmall!.merge(
                                        const TextStyle(
                                          fontSize: 15.0,
                                          //fontWeight: FontWeight.w400,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                              text: "Total Class Held : ".tr,
                              children: [
                                TextSpan(
                                  text: "26",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .merge(
                                        const TextStyle(
                                          fontSize: 15.0,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          RichText(
                            text: TextSpan(
                              style:
                                  Theme.of(context).textTheme.labelSmall!.merge(
                                        const TextStyle(
                                          fontSize: 15.0,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                              text: "Total Class Attended : ".tr,
                              children: [
                                TextSpan(
                                  text: "0",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .merge(
                                        const TextStyle(
                                          fontSize: 15.0,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          RichText(
                            text: TextSpan(
                              style:
                                  Theme.of(context).textTheme.labelSmall!.merge(
                                        const TextStyle(
                                          fontSize: 15.0,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                              text: "Total Class Percentage : ".tr,
                              children: [
                                TextSpan(
                                  text: "0.00%",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .merge(
                                        const TextStyle(
                                          fontSize: 15.0,
                                          letterSpacing: 0.3,
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => AttendanceDetails());
                    },
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16.0),
                          bottomRight: Radius.circular(16.0),
                        ),
                      ),
                      child: const Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color(0xFF35658F),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: CustomThemeData.getShadow(),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                        (states) => Theme.of(context).colorScheme.secondary),
                    border: const TableBorder(
                      horizontalInside: BorderSide(
                        color: Colors.black12,
                      ),
                      verticalInside: BorderSide(
                        color: Colors.black12,
                      ),
                    ),
                    columns: [
                      DataColumn(
                        label: Text(
                          "Months".tr,
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                                const TextStyle(
                                  fontSize: 16.0,
                                  letterSpacing: 0.3,
                                ),
                              ),
                        ),
                      ),
                      DataColumn(
                        label: Flexible(
                          child: Text(
                            "Class Held".tr,
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                            style:
                                Theme.of(context).textTheme.labelSmall!.merge(
                                      const TextStyle(
                                        fontSize: 16.0,
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Flexible(
                          fit: FlexFit.loose,
                          child: Text(
                            "Total Present".tr,
                            overflow: TextOverflow.visible,
                            style:
                                Theme.of(context).textTheme.labelSmall!.merge(
                                      const TextStyle(
                                        fontSize: 16.0,
                                        letterSpacing: 0.3,
                                      ),
                                    ),
                          ),
                        ),
                      ),
                    ],
                    rows: [
                      populateData(context, "September", "21", 0.toString()),
                      populateData(context, "October", "21", "10"),
                      populateData(context, "November", "24", "16"),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  DataRow populateData(
      BuildContext context, String month, String classHeld, String present) {
    return DataRow(
      cells: [
        DataCell(
          Center(
            child: Text(
              month,
              style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                      fontSize: 13.0,
                      letterSpacing: 0.3,
                    ),
                  ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              classHeld,
              style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                      fontSize: 13.0,
                      letterSpacing: 0.3,
                    ),
                  ),
            ),
          ),
        ),
        DataCell(
          Center(
            child: Text(
              present,
              style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                      fontSize: 13.0,
                      letterSpacing: 0.3,
                    ),
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
