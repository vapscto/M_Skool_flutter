import 'package:flutter/material.dart';
import 'package:m_skool_flutter/manager/controller/manager_dashboard_controller.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class DashboardPreAdmissionWidget extends StatefulWidget {
  final ManagerDashboardController dashboardController;
  const DashboardPreAdmissionWidget(
      {super.key, required this.dashboardController});

  @override
  State<DashboardPreAdmissionWidget> createState() =>
      _DashboardPreAdmissionWidgetState();
}

class _DashboardPreAdmissionWidgetState
    extends State<DashboardPreAdmissionWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
        ),
        child: const ListTile(
          title: Text("Pre Admission"),
        ),
      ),
    );
  }
}
