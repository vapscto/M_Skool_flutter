import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';
import 'package:m_skool_flutter/widget/vaps_container.dart';

class TimeTableHome extends StatefulWidget {
  const TimeTableHome({super.key});

  @override
  State<TimeTableHome> createState() => _TimeTableHomeState();
}

class _TimeTableHomeState extends State<TimeTableHome> {
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
      appBar: CustomAppBar(title: "Time Table".tr).getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 16.0,
            ),
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
                      style: Theme.of(context).textTheme.labelSmall!.merge(
                          const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              letterSpacing: 0.3)),
                    ),
                  ),
                ),
                onChanged: (s) {},
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomContainer(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Theme.of(context).colorScheme.secondary,
                    ),
                    border: TableBorder(
                      horizontalInside: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                      verticalInside: BorderSide(
                        color: Colors.grey.shade300,
                      ),
                    ),
                    columns: [
                      DataColumn(
                          label: Center(
                        child: Text(
                          "Periods",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .merge(const TextStyle(
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      )),
                      DataColumn(
                          label: Center(
                        child: Text(
                          "Mon",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .merge(const TextStyle(
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      )),
                      DataColumn(
                          label: Center(
                        child: Text(
                          "Tue",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .merge(const TextStyle(
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      )),
                      DataColumn(
                          label: Center(
                        child: Text(
                          "Wed",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .merge(const TextStyle(
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      )),
                      DataColumn(
                          label: Center(
                        child: Text(
                          "Thu",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .merge(const TextStyle(
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      )),
                      DataColumn(
                          label: Center(
                        child: Text(
                          "Fri",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .merge(const TextStyle(
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      )),
                      DataColumn(
                          label: Center(
                        child: Text(
                          "Sat",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .merge(const TextStyle(
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      )),
                    ],
                    rows: [
                      // DataRow(
                      //   cells: [
                      //     DataCell(
                      //       Center(child: Text("P1")),
                      //     ),
                      //     DataCell(
                      //       Center(child:  Icon(Icons.circle)),
                      //     ),
                      //     DataCell(
                      //       Center(child:  Icon(Icons.circle)),
                      //     ),
                      //     DataCell(
                      //       Center(child:  Icon(Icons.circle)),
                      //     ),
                      //     DataCell(
                      //       Center(child: Text("Hindi")),
                      //     ),
                      //     DataCell(
                      //       Center(child: Text("Soc Sci")),
                      //     ),
                      //     DataCell(
                      //       Center(child: Text("Chem")),
                      //     ),
                      //   ],
                      // ),
                      populateTimetable(),
                      populateTimetable(),
                      populateTimetable(),
                      populateTimetable()
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Wrap(
              runSpacing: 12.0,
              spacing: 12.0,
              children: const [
                SubjectIndicatorWidget(
                  color: Colors.amber,
                  sub: "Maths",
                ),
                SubjectIndicatorWidget(
                  color: Colors.amber,
                  sub: "Maths",
                ),
                SubjectIndicatorWidget(
                  color: Colors.amber,
                  sub: "Maths",
                ),
                SubjectIndicatorWidget(
                  color: Colors.amber,
                  sub: "Maths",
                ),
                SubjectIndicatorWidget(
                  color: Colors.amber,
                  sub: "Maths",
                ),
                SubjectIndicatorWidget(
                  color: Colors.amber,
                  sub: "Maths",
                ),
                SubjectIndicatorWidget(
                  color: Colors.amber,
                  sub: "Maths",
                ),
                SubjectIndicatorWidget(
                  color: Colors.amber,
                  sub: "Maths",
                ),

                // SubjectIndicatorWidget(),
                // SubjectIndicatorWidget(),
                // SubjectIndicatorWidget(),
                // SubjectIndicatorWidget(),
                // SubjectIndicatorWidget(),
                // SubjectIndicatorWidget(),
                // SubjectIndicatorWidget(),
                // SubjectIndicatorWidget(),
              ],
            ),
            const SizedBox(
              height: 36.0,
            ),
            MSkollBtn(
              title: "Generate PDF",
              onPress: () {},
            ),
          ],
        ),
      ),
    );
  }

  DataRow populateTimetable() {
    return const DataRow(
      cells: [
        DataCell(
          Center(child: Text("P1")),
        ),
        DataCell(
          Center(
              child: Icon(
            Icons.circle,
            size: 14.0,
          )),
        ),
        DataCell(
          Center(
              child: Icon(
            Icons.circle,
            size: 14.0,
          )),
        ),
        DataCell(
          Center(
              child: Icon(
            Icons.circle,
            size: 14.0,
          )),
        ),
        DataCell(
          Center(
              child: Icon(
            Icons.circle,
            size: 14.0,
          )),
        ),
        DataCell(
          Center(
              child: Icon(
            Icons.circle,
            size: 14.0,
          )),
        ),
        DataCell(
          Center(
              child: Icon(
            Icons.circle,
            size: 14.0,
          )),
        ),
      ],
    );
  }
}

class SubjectIndicatorWidget extends StatelessWidget {
  final Color color;
  final String sub;
  const SubjectIndicatorWidget({
    Key? key,
    required this.color,
    required this.sub,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width * 0.25,
      child: Row(
        children: [
          Icon(
            Icons.circle,
            size: 18,
            color: color,
          ),
          const SizedBox(
            width: 8.0,
          ),
          Expanded(
              child: Text(
            sub,
            style: Theme.of(context).textTheme.titleSmall,
          )),
        ],
      ),
    );
  }
}
