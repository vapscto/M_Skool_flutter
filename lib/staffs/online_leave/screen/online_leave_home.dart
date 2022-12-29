import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/online_leave/widget/all_applied_leave.dart';
import 'package:m_skool_flutter/staffs/online_leave/widget/leaves.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class OnlineLeaveApply extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final String title;
  const OnlineLeaveApply(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.title});

  @override
  State<OnlineLeaveApply> createState() => _OnlineLeaveApplyState();
}

class _OnlineLeaveApplyState extends State<OnlineLeaveApply> {
  // int color = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title).getAppBar(),
      body: SingleChildScrollView(
        //padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Leaves(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: AppliedLeaveWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
