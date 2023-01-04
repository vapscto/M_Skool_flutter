import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/manager/staff_leave_approval/widget/leave_approval_item.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class StaffLeaveApproval extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final String title;

  const StaffLeaveApproval(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: title).getAppBar(),
      body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (_, index) {
            return const AppliedLeaveAprovalItem();
          },
          separatorBuilder: (_, index) {
            return const SizedBox(
              height: 16.0,
            );
          },
          itemCount: 10),
    );
  }
}
