import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/manager/api/dashboard_api.dart';
import 'package:m_skool_flutter/manager/coe/screen/manager_coe.dart';
import 'package:m_skool_flutter/manager/controller/manager_dashboard_controller.dart';
import 'package:m_skool_flutter/manager/employee_details/screens/employee_details_home_screen.dart';
import 'package:m_skool_flutter/manager/overall_fee/screen/overall_fee_home.dart';
import 'package:m_skool_flutter/manager/staff_leave_approval/screen/staff_leave_approval_home.dart';
import 'package:m_skool_flutter/manager/student_details/screen/student_details_home.dart';
import 'package:m_skool_flutter/manager/widget/manager_dashboard_container.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/screen/notice_board_staff_home.dart';
import 'package:m_skool_flutter/widget/custom_elevated_button.dart';
import 'package:m_skool_flutter/widget/logout_confirmation.dart';

class ManagerDashboard extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ManagerDashboard(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<ManagerDashboard> createState() => _ManagerDashboardState();
}

class _ManagerDashboardState extends State<ManagerDashboard> {
  final ManagerDashboardController dashboardController =
      Get.put(ManagerDashboardController());
  @override
  void initState() {
    ManagerDashboardApi.instance.getDashboardData(
        miId: widget.loginSuccessModel.mIID!,
        asmayId: widget.loginSuccessModel.asmaYId!,
        base: baseUrlFromInsCode("portal", widget.mskoolController),
        dashboardController: dashboardController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await ManagerDashboardApi.instance.getDashboardData(
            miId: widget.loginSuccessModel.mIID!,
            asmayId: widget.loginSuccessModel.asmaYId!,
            base: baseUrlFromInsCode("portal", widget.mskoolController),
            dashboardController: dashboardController);
      },
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ManagerDashboardContainer(
            dashboardController: dashboardController,
          ),
          const SizedBox(
            height: 12.0,
          ),
          Text(
            "Dashboard",
            style: Theme.of(context).textTheme.titleSmall!.merge(
                  const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ),
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
                  // logger.d(widget
                  //     .loginSuccessModel.staffmobileappprivileges!.values!
                  //     .elementAt(index)
                  //     .pagename);

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
                      "Employee Details") {
                    Get.to(
                      () => EmployeeDetailsHomeScreen(
                        loginSuccessModel: widget.loginSuccessModel,
                        mskoolController: widget.mskoolController,
                      ),
                    );
                    return;
                  }
                  if (widget.loginSuccessModel.staffmobileappprivileges!.values!
                          .elementAt(index)
                          .pagename ==
                      'Notice Board Staff') {
                    Get.to(() => NoticeBoardStaffHome(
                          loginSuccessModel: widget.loginSuccessModel,
                          mskoolController: widget.mskoolController,
                          title: widget.loginSuccessModel
                              .staffmobileappprivileges!.values!
                              .elementAt(index)
                              .pagename!,
                        ));
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
                  if (widget.loginSuccessModel.staffmobileappprivileges!.values!
                          .elementAt(index)
                          .pagename ==
                      "COE Report") {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return ManagerCoeHome(
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
