import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/classwork/api/get_class_work.dart';
import 'package:m_skool_flutter/classwork/model/class_work_model.dart';
import 'package:m_skool_flutter/classwork/widget/filtered_classwork_widget.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';

import 'package:m_skool_flutter/homework/screen/home_work.dart';
import 'package:m_skool_flutter/homework/screen/hwcw_detail_screen.dart';
import 'package:m_skool_flutter/information/controller/hwcwnb_controller.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class ClassworkHome extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final HwCwNbController hwCwNbController;
  const ClassworkHome(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.hwCwNbController});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return hwCwNbController.errorHappendWhileLoadingClsWrk.value
            ? const Center(
                child: ErrWidget(err: {
                  "errorTitle": "Unable to connect to server.",
                  "errorMsg":
                      "Sorry! but we are unable to connect to server right now. Try again later."
                }),
              )
            : Obx(() {
                return hwCwNbController.filter.value > 0
                    ? FilteredClassWork(
                        loginSuccessModel: loginSuccessModel,
                        mskoolController: mskoolController,
                        hwCwNbController: hwCwNbController)
                    : FutureBuilder<List<ClassWorkModelValues>>(
                        future: GetClassWorkApi.instance.getClassWorks(
                          miId: loginSuccessModel.mIID!,
                          asmayId: loginSuccessModel.asmaYId!,
                          amstId: loginSuccessModel.amsTId!,
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
                              padding: const EdgeInsets.all(16.0),
                              itemBuilder: (_, index) {
                                return InkWell(
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (_) {
                                        return HwCwDetailScreen(
                                          loginSuccessModel: loginSuccessModel,
                                          mskoolController: mskoolController,
                                          ihcId: snapshot.data!
                                              .elementAt(index)
                                              .icWId!,
                                          subject: snapshot.data!
                                              .elementAt(index)
                                              .ismSSubjectName!,
                                          topic: snapshot.data!
                                              .elementAt(index)
                                              .icWTopic!,
                                          assignment: snapshot.data!
                                                      .elementAt(index)
                                                      .icWAssignment ==
                                                  null
                                              ? "N/A"
                                              : snapshot.data!
                                                  .elementAt(index)
                                                  .icWAssignment!,
                                          date: snapshot.data!
                                              .elementAt(index)
                                              .icWFromDate!,
                                          screenType: 'classwork',
                                        );
                                      }));
                                    },
                                    child: HwCwItem(
                                      isRead: snapshot.data!
                                                  .elementAt(index)
                                                  .iCWUPLViewedFlg ==
                                              1
                                          ? true
                                          : false,
                                      sub: snapshot.data!
                                          .elementAt(index)
                                          .ismSSubjectName!,
                                      topic: snapshot.data!
                                          .elementAt(index)
                                          .icWContent!,
                                    ));
                              },
                              itemCount: snapshot.data!.length,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const SizedBox(
                                  height: 12.0,
                                );
                              },
                            );
                          }

                          if (snapshot.hasError) {
                            return ErrWidget(
                                err: snapshot.error as Map<String, dynamic>);
                          }
                          return const CustomPgrWidget(
                              title: "Getting Your Assignments",
                              desc:
                                  "We are fetching your classwork form whiteboard, it will be shown here");
                        },
                      );
              });
      },

      //  ListView.separated(
      //   padding: const EdgeInsets.all(16.0),
      //   itemBuilder: (_, index) {
      //     return InkWell(
      //         onTap: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (_) {
      //             return HwCwDetailScreen();
      //           }));
      //         },
      //         child: HwCwItem());
      //   },
      //   itemCount: 5,
      //   separatorBuilder: (BuildContext context, int index) {
      //     return const SizedBox(
      //       height: 12.0,
      //     );
      //   },
      // ),
    );
  }
}
