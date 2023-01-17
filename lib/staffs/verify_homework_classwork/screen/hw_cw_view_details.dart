import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/api/get_cw_api.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/api/get_hw_api.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/model/verify_cw_model.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/model/verify_hw_model.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/widget/verify_item.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class VerifyHwCwViewDetails extends StatelessWidget {
  final String title;
  final bool forHw;
  final MskoolController mskoolController;
  final LoginSuccessModel loginSuccessModel;
  final int asmayId;
  final int asmclId;
  final int asmsId;
  final int ismsId;
  final String fromDate;
  final String toDate;
  const VerifyHwCwViewDetails(
      {super.key,
      required this.title,
      required this.forHw,
      required this.mskoolController,
      required this.loginSuccessModel,
      required this.asmayId,
      required this.asmclId,
      required this.asmsId,
      required this.ismsId,
      required this.fromDate,
      required this.toDate});

  @override
  Widget build(BuildContext context) {
    int color = -1;
    return Scaffold(
      appBar: CustomAppBar(title: title).getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            forHw
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xFFFBCFCF)),
                    child: Text(
                      "Maximum Marks : 20",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .merge(const TextStyle(color: Color(0xFFA83232))),
                    ),
                  ),
            forHw
                ? const SizedBox()
                : const SizedBox(
                    height: 16.0,
                  ),
            forHw
                ? FutureBuilder<List<VerifyHwListModelValues>>(
                    future: GetHwApi.instance.getHwForVerification(
                      miId: loginSuccessModel.mIID!,
                      hrmeId: loginSuccessModel.empcode!,
                      loginId: loginSuccessModel.userId!,
                      userId: loginSuccessModel.userId!,
                      ivrmrtId: loginSuccessModel.roleId!,
                      roleFlag: "Staff",
                      asmayId: asmayId,
                      ismsId: ismsId,
                      asmclId: asmclId,
                      asmsId: asmsId,
                      fromDate: fromDate,
                      toDate: toDate,
                      base: baseUrlFromInsCode(
                        "portal",
                        mskoolController,
                      ),
                    ),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              color += 1;
                              if (color % 6 == 0) {
                                color = 0;
                              }
                              return VerifyHwCwItem(
                                forHw: forHw,
                                model: snapshot.data!.elementAt(index),
                                color: lighterColor.elementAt(color),
                                base: baseUrlFromInsCode(
                                    "portal", mskoolController),
                                miId: loginSuccessModel.mIID!,
                                loginSuccessModel: loginSuccessModel,
                                asmayId: asmayId,
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(
                                height: 16.0,
                              );
                            },
                            itemCount: snapshot.data!.length);
                      }

                      if (snapshot.hasError) {
                        return ErrWidget(
                            err: snapshot.error as Map<String, dynamic>);
                      }
                      return const AnimatedProgressWidget(
                          title: "Loading uploaded Homework",
                          desc:
                              "Please wait while we load uploaded assignments for you.",
                          animationPath: "assets/json/default.json");
                    },
                  )
                : FutureBuilder<List<VerifyClassworkListValues>>(
                    future: GetCwApi.instance.getCwList(
                        miId: loginSuccessModel.mIID!,
                        hrmeId: loginSuccessModel.empcode!,
                        loginId: loginSuccessModel.userId!,
                        userId: loginSuccessModel.userId!,
                        ivrmrtId: loginSuccessModel.roleId!,
                        roleFlag: "Staff",
                        asmayId: asmayId,
                        ismsId: ismsId,
                        asmclId: asmclId,
                        asmsId: asmsId,
                        fromDate: fromDate,
                        toDate: toDate,
                        base: baseUrlFromInsCode("portal", mskoolController)),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              color += 1;
                              if (color % 6 == 0) {
                                color = 0;
                              }
                              return VerifyHwCwItem(
                                asmayId: asmayId,
                                base: baseUrlFromInsCode(
                                    "portal", mskoolController),
                                color: lighterColor.elementAt(color),
                                forHw: forHw,
                                loginSuccessModel: loginSuccessModel,
                                miId: loginSuccessModel.mIID!,
                                cwList: snapshot.data!.elementAt(index),
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(
                                height: 16.0,
                              );
                            },
                            itemCount: snapshot.data!.length);
                      }
                      if (snapshot.hasError) {
                        return ErrWidget(
                            err: snapshot.error as Map<String, dynamic>);
                      }
                      return const AnimatedProgressWidget(
                          title: "Loading uploaded Classwork",
                          desc:
                              "Please wait while we load uploaded assignments for you.",
                          animationPath: "assets/json/default.json");
                    }),
          ],
        ),
      ),
    );
  }
}
