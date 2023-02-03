import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/manager/overall_fee/screen/overall_fee_home.dart';
import 'package:m_skool_flutter/manager/staff_leave_approval/screen/staff_leave_approval_home.dart';
import 'package:m_skool_flutter/manager/student_details/screen/student_details_home.dart';
import 'package:m_skool_flutter/manager/student_notice_board/screen/student_notice_board_home.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_elevated_button.dart';
import 'package:m_skool_flutter/widget/logout_confirmation.dart';

import '../../controller/global_utilities.dart';

class ManagerHome extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ManagerHome(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<ManagerHome> createState() => _ManagerHomeState();
}

class _ManagerHomeState extends State<ManagerHome> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/menu.svg'),
          onPressed: () {
            _scaffold.currentState!.openDrawer();
          },
        ),
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 0.8,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  logger.d(widget
                      .loginSuccessModel.staffmobileappprivileges!.values!
                      .elementAt(index)
                      .pagename);

                  if (widget.loginSuccessModel.staffmobileappprivileges!.values!
                          .elementAt(index)
                          .pagename ==
                      "Student Birth Day Report") {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ManagerStudentDetails(
                        loginSuccessModel: widget.loginSuccessModel,
                        mskoolController: widget.mskoolController,
                        title: widget
                            .loginSuccessModel.staffmobileappprivileges!.values!
                            .elementAt(index)
                            .pagename!,
                      );
                    }));

                    return;
                  }
                  if (widget.loginSuccessModel.staffmobileappprivileges!.values!
                          .elementAt(index)
                          .pagename ==
                      "Leave Approval Staff") {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return StaffLeaveApproval(
                        loginSuccessModel: widget.loginSuccessModel,
                        mskoolController: widget.mskoolController,
                        title: widget
                            .loginSuccessModel.staffmobileappprivileges!.values!
                            .elementAt(index)
                            .pagename!,
                      );
                    }));

                    return;
                  }
                  if (widget.loginSuccessModel.staffmobileappprivileges!.values!
                          .elementAt(index)
                          .pagename ==
                      'Notice Board') {
                    Get.to(() => const StudentNoticeBoardHome());
                  }

                  if (widget.loginSuccessModel.staffmobileappprivileges!.values!
                          .elementAt(index)
                          .pagename ==
                      "Overall Fee") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return OverallFeeHome(
                            loginSuccessModel: widget.loginSuccessModel,
                            mskoolController: widget.mskoolController,
                            title: widget.loginSuccessModel
                                .staffmobileappprivileges!.values!
                                .elementAt(index)
                                .pagename!,
                          );
                        },
                      ),
                    );

                    return;
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: SizedBox(
                    width: 80,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(
                            getDashBoardIconByName(
                                "${widget.loginSuccessModel.staffmobileappprivileges!.values![index].pagename}"),
                            height: 60,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${widget.loginSuccessModel.staffmobileappprivileges!.values![index].pagename}",
                            //maxLines: 1,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .merge(const TextStyle(fontSize: 13.0)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            itemCount: widget
                .loginSuccessModel.staffmobileappprivileges!.values!.length,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
            child: SizedBox(
              width: 180,
              height: 40,
              child: CustomElevatedButton(
                  isGradient: false,
                  boxShadow: const BoxShadow(),
                  color: const Color(0xFFFFDFD6),
                  child: Row(mainAxisSize: MainAxisSize.min, children: const [
                    Icon(
                      Icons.logout,
                      color: Color(0xffF24E1E),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Log Out",
                      style: TextStyle(
                          color: Color(0xffF24E1E),
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )
                  ]),
                  onPressed: () {
                    Get.dialog(const LogoutConfirmationPopup());
                  }),
            ),
          ),
        ]),
      ),
    );
  }
}
