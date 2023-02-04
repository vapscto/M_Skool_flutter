import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/manager/controller/manager_dashboard_controller.dart';
import 'package:m_skool_flutter/manager/widget/dashboard_fee_mode.dart';
import 'package:m_skool_flutter/manager/widget/dashboard_leave.dart';

class DashStaffLeavesAndModeofFeePaid extends StatelessWidget {
  final ManagerDashboardController dashboardController;
  const DashStaffLeavesAndModeofFeePaid(
      {super.key, required this.dashboardController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Obx(() {
          return dashboardController.dashboardLeave.isEmpty
              ? const SizedBox()
              : DashboardLeaveWidget(
                  dashboardController: dashboardController,
                );
        })),
        const SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: Obx(
            () {
              return dashboardController.feeDetails.isEmpty
                  ? const SizedBox()
                  : DashboardFeeMode(
                      dashboardController: dashboardController,
                    );
            },
          ),
        ),
      ],
    );
  }
}
