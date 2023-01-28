import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/online_leave/api/get_leaves_name.dart';
import 'package:m_skool_flutter/staffs/online_leave/model/leave_name_model.dart';
import 'package:m_skool_flutter/staffs/online_leave/widget/all_applied_leave.dart';
import 'package:m_skool_flutter/staffs/online_leave/widget/leaves.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';

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
      floatingActionButton: const HomeFab(),
      appBar: CustomAppBar(title: widget.title).getAppBar(),
      body: SingleChildScrollView(
        //padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FutureBuilder<List<LeaveNamesModelValues>>(
                future: GetLeaveNameApi.instance.getLeaves(
                  miId: widget.loginSuccessModel.mIID!,
                  userId: widget.loginSuccessModel.userId!,
                  base: baseUrlFromInsCode(
                    "leave",
                    widget.mskoolController,
                  ),
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Leaves(
                      leaves: snapshot.data!,
                      loginSuccessModel: widget.loginSuccessModel,
                      mskoolController: widget.mskoolController,
                    );
                  }
                  if (snapshot.hasError) {
                    return ErrWidget(
                        err: snapshot.error as Map<String, dynamic>);
                  }

                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        const CircularProgressIndicator(),
                        const SizedBox(
                          width: 12.0,
                        ),
                        Expanded(
                          child: Text(
                              "Please wait we are loading leaves for which you can apply",
                              style: Theme.of(context).textTheme.titleSmall),
                        )
                      ],
                    ),
                  );
                }),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: AppliedLeaveWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
