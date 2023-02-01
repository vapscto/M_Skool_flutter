import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/manager/student_details/controller/view_student_details_controller.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class AcademicTab extends StatelessWidget {
  final ViewStudentDetailsController controller;
  const AcademicTab({super.key, required this.controller});

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
              : const SizedBox();
    });
  }
}
