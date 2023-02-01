import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/manager/student_details/controller/view_student_details_controller.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AttendanceTab extends StatelessWidget {
  final ViewStudentDetailsController controller;
  const AttendanceTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isErrorOccured.value
          ? Center(
              child: ErrWidget(
                err: {
                  "errorTitle": "Unexpected Error Occured",
                  "errorMsg": controller.status.value,
                },
              ),
            )
          : controller.isLoading.value
              ? Center(
                  child: AnimatedProgressWidget(
                    animationPath: 'assets/json/default.json',
                    desc: controller.status.value,
                    title: "Please wait we are loading.",
                  ),
                )
              : controller.personalData.isEmpty
                  ? const Center(
                      child: AnimatedProgressWidget(
                        title: "No Attendance Found",
                        desc:
                            "There is no attendance available currently.. Please ask your technical team to add some",
                        animationPath: "assets/json/nodata.json",
                        animatorHeight: 250,
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: const [
                          // CustomContainer(
                          //   child: SfCartesianChart(
                          //     series: [
                          //       ColumnSeries(
                          //         dataSource: [],
                          //         xValueMapper: xValueMapper,
                          //         yValueMapper: yValueMapper,
                          //       ),
                          //       ColumnSeries(
                          //         dataSource: dataSource,
                          //         xValueMapper: xValueMapper,
                          //         yValueMapper: yValueMapper,
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                    );
    });
  }
}
