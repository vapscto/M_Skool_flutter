import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/manager/controller/manager_dashboard_controller.dart';
import 'package:m_skool_flutter/manager/widget/dashboard_fee_chart.dart';
import 'package:m_skool_flutter/manager/widget/dashboard_preadmission.dart';
import 'package:m_skool_flutter/manager/widget/dashboard_staff_leave_and_fee.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/widget/staff_carasouel.dart';

class ManagerDashboardContainer extends StatelessWidget {
  final ManagerDashboardController dashboardController;
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ManagerDashboardContainer(
      {super.key,
      required this.dashboardController,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        dashboardController.dashboardCoe.isEmpty
            ? const SizedBox()
            : StaffCarasouel(
                loginSuccessModel: loginSuccessModel,
                mList: dashboardController.dashboardCoe,
                mskoolController: mskoolController,
              ),
        DashStaffLeavesAndModeofFeePaid(
          dashboardController: dashboardController,
        ),
        Obx(() {
          return dashboardController.fee.isEmpty
              ? const SizedBox()
              : DashboardFeeChart(dashboardController: dashboardController);
        }),
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
