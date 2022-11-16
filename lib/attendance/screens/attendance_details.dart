import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:m_skool_flutter/attendance/widgets/attendance_area_chart.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class AttendanceDetails extends StatefulWidget {
  const AttendanceDetails({super.key});

  @override
  State<AttendanceDetails> createState() => _AttendanceDetailsState();
}

class _AttendanceDetailsState extends State<AttendanceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Attendance".tr),
        leadingWidth: 30,
        leading: const CustomGoBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12.0,
            ),
            RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.labelSmall!.merge(
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
                    style: Theme.of(context).textTheme.labelSmall!.merge(
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
                style: Theme.of(context).textTheme.labelSmall!.merge(
                      const TextStyle(
                        fontSize: 15.0,
                        letterSpacing: 0.3,
                      ),
                    ),
                text: "Total Class Attended : ".tr,
                children: [
                  TextSpan(
                    text: "0",
                    style: Theme.of(context).textTheme.labelSmall!.merge(
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
                style: Theme.of(context).textTheme.labelSmall!.merge(
                      const TextStyle(
                        fontSize: 15.0,
                        letterSpacing: 0.3,
                      ),
                    ),
                text: "Total Class Percentage : ".tr,
                children: [
                  TextSpan(
                    text: "0.00%",
                    style: Theme.of(context).textTheme.labelSmall!.merge(
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
              height: 16.0,
            ),
            // LineChart(
            //   LineChartData(
            //       minX: 0,
            //       maxX: 80000,
            //       minY: 0,
            //       maxY: 6,
            //       lineBarsData: [
            //         LineChartBarData(spots: [
            //           FlSpot(
            //             67000,
            //             0,
            //           ),
            //         ])
            //       ]),
            // ),
            const CustomContainer(child: AttendanceAreaChart()),
          ],
        ),
      ),
    );
  }
}
