import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/manager/staff_leave_approval/api/get_leaves_api.dart';
import 'package:m_skool_flutter/manager/staff_leave_approval/model/leave_approval_model.dart';
import 'package:m_skool_flutter/manager/staff_leave_approval/widget/leave_approval_item.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

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
      body: FutureBuilder<List<LeaveApprovalModelValues>>(
          future: GetAppliesLeavesApi.instance.getAppliedLeaves(
            base: baseUrlFromInsCode("hrms", mskoolController),
            miId: loginSuccessModel.mIID!,
            loginId: loginSuccessModel.userId!,
          ),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (_, index) {
                  return AppliedLeaveAprovalItem(
                    value: snapshot.data!.elementAt(index),
                  );
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    height: 16.0,
                  );
                },
                itemCount: snapshot.data!.length,
              );
            }
            if (snapshot.hasError) {
              return ErrWidget(
                err: snapshot.error as Map<String, dynamic>,
              );
            }
            return const Center(
              child: AnimatedProgressWidget(
                animationPath: "assets/json/default.json",
                title: "Loading Applied Leaves",
                desc:
                    "We are loading leaves for you... Please wait while we do it for you",
              ),
            );
          }),
      // body: ListView.separated(
      //     padding: const EdgeInsets.all(16.0),
      //     itemBuilder: (_, index) {
      //       return const AppliedLeaveAprovalItem();
      //     },
      //     separatorBuilder: (_, index) {
      //       return const SizedBox(
      //         height: 16.0,
      //       );
      //     },
      //     itemCount: 10),
    );
  }
}
