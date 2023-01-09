import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/view_notice/api/view_notice_circular.dart';
import 'package:m_skool_flutter/staffs/view_notice/api/view_notice_get_session.dart';
import 'package:m_skool_flutter/staffs/view_notice/controller/view_notice_data_controller.dart';
import 'package:m_skool_flutter/staffs/view_notice/widget/academic_year_dd.dart';
import 'package:m_skool_flutter/staffs/view_notice/widget/circular_notice_widget.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class CirculaNotice extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final ViewNoticeDataController dataController;
  const CirculaNotice(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.dataController});

  @override
  State<CirculaNotice> createState() => _CirculaNoticeState();
}

class _CirculaNoticeState extends State<CirculaNotice> {
  @override
  void initState() {
    loadCircularNT();
    super.initState();
  }

  Future<void> loadCircularNT() async {
    await ViewNoticeGetSession.instance.getViewNoticeSession(
      miId: widget.loginSuccessModel.mIID!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      amstId: widget.loginSuccessModel.amsTId!,
      flag: "O",
      base: baseUrlFromInsCode("portal", widget.mskoolController),
      dataController: widget.dataController,
    );
    if (widget.dataController.isErrorOccuredWhileLoadingCircular.value) {
      return;
    }
    await ViewCircularNoticeApi.instance.getCircularNotice(
        miId: widget.loginSuccessModel.mIID!,
        userId: widget.loginSuccessModel.userId!,
        asmayId: widget.dataController.selectedSession.value.asmaYId!,
        flag: "O",
        base: baseUrlFromInsCode("portal", widget.mskoolController),
        dataController: widget.dataController);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return widget.dataController.isErrorOccuredWhileLoadingCircular.value
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  ErrWidget(err: {
                    "errorTitle": "An error Occured",
                    "errorMsg":
                        "Sorry but while loading Academic year, we encountered an error."
                  }),
                ],
              ),
            )
          : widget.dataController.isCircularPageLoading.value
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      AnimatedProgressWidget(
                          title: "Loading Academic Year",
                          desc:
                              "We are loading Academic year to get circular.. Your content will be visisble here.",
                          animationPath: "assets/json/Noticeboard.json"),
                    ],
                  ),
                )
              : widget.dataController.circularSession.isEmpty
                  ? const Center(
                      child: AnimatedProgressWidget(
                        title: "No Academic Year Found",
                        desc:
                            "Unfortunately, we couldn't find any academic year, Please contact to your technical team to solve this issue",
                        animationPath: "assets/json/nodata.json",
                        animatorHeight: 250,
                      ),
                    )
                  : Column(
                      children: [
                        AcademicYearDD(
                          dataController: widget.dataController,
                          loginSuccessModel: widget.loginSuccessModel,
                          mskoolController: widget.mskoolController,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        CircularNoticeWidget(
                          datController: widget.dataController,
                        ),
                      ],
                    );
    });
    // return Column(children: [
    //   FutureBuilder<Object>(
    //       future: ViewNoticeGetSession.instance.getViewNoticeSession(
    //         miId: widget.loginSuccessModel.mIID!,
    //         asmayId: widget.loginSuccessModel.asmaYId!,
    //         amstId: widget.loginSuccessModel.amsTId!,
    //         flag: "O",
    //         base: baseUrlFromInsCode(
    //           "portal",
    //           widget.mskoolController,
    //         ),
    //       ),
    //       builder: (context, snapshot) {
    //         return Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 16.0),
    //           child: CustomContainer(
    //             child: DropdownButtonFormField(
    //                 value: selectedValue,
    //                 style: Theme.of(context).textTheme.titleSmall!.merge(
    //                       const TextStyle(fontSize: 16.0),
    //                     ),
    //                 decoration: InputDecoration(
    //                   focusedBorder: const OutlineInputBorder(
    //                     borderSide: BorderSide(
    //                       color: Colors.transparent,
    //                     ),
    //                   ),
    //                   enabledBorder: const OutlineInputBorder(
    //                     borderSide: BorderSide(
    //                       color: Colors.transparent,
    //                     ),
    //                   ),
    //                   label: Container(
    //                     decoration: BoxDecoration(
    //                       color: const Color(0xFFDFFBFE),
    //                       borderRadius: BorderRadius.circular(24.0),
    //                     ),
    //                     padding: const EdgeInsets.symmetric(
    //                         horizontal: 12.0, vertical: 6.0),
    //                     child: Row(
    //                       mainAxisSize: MainAxisSize.min,
    //                       children: [
    //                         Image.asset(
    //                           "assets/images/cap.png",
    //                           height: 24.0,
    //                         ),
    //                         const SizedBox(
    //                           width: 6.0,
    //                         ),
    //                         Text(
    //                           " Academic Year ",
    //                           style: Theme.of(context)
    //                               .textTheme
    //                               .labelMedium!
    //                               .merge(
    //                                 const TextStyle(
    //                                     backgroundColor: Color(0xFFDFFBFE),
    //                                     fontSize: 20.0,
    //                                     color: Color(0xFF28B6C8)),
    //                               ),
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   border: const OutlineInputBorder(),
    //                 ),
    //                 icon: const Padding(
    //                   padding: EdgeInsets.only(top: 4.5),
    //                   child: Icon(
    //                     Icons.keyboard_arrow_down_outlined,
    //                     size: 30,
    //                   ),
    //                 ),
    //                 items: sessions
    //                     .map((e) => DropdownMenuItem(
    //                         value: e,
    //                         child: Padding(
    //                           padding: const EdgeInsets.only(top: 8, left: 5),
    //                           child: Text(e),
    //                         )))
    //                     .toList(),
    //                 onChanged: (e) {
    //                   selectedValue = e!;
    //                 }),
    //           ),
    //         );
    //       }),
    //   CircularNoticeWidget(
    //       loginSuccessModel: widget.loginSuccessModel,
    //       mskoolController: widget.mskoolController),
    // ]);
  }
}
