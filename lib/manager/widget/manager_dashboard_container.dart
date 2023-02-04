import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/manager/controller/manager_dashboard_controller.dart';
import 'package:m_skool_flutter/manager/widget/dashboard_preadmission.dart';
import 'package:m_skool_flutter/manager/widget/dashboard_staff_leave_and_fee.dart';

class ManagerDashboardContainer extends StatelessWidget {
  final ManagerDashboardController dashboardController;
  const ManagerDashboardContainer(
      {super.key, required this.dashboardController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DashStaffLeavesAndModeofFeePaid(
          dashboardController: dashboardController,
        ),
        Obx(() {
          return dashboardController.preAdmission.isEmpty
              ? const SizedBox()
              : DashboardPreAdmissionWidget(
                  dashboardController: dashboardController,
                );
        })
      ],
    );
  }
}
