import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/api/hw_cw_get_class.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/api/hw_cw_get_section.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/api/hw_cw_get_subject.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/api/hw_cw_get_year.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/controller/hw_cw_controller.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/hw_cw_academic_dd.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/api/verify_cw_subject_api.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/widget/verify_class_dd.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class VerifyHwCwHome extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final String title;
  final bool forHw;
  const VerifyHwCwHome(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.title,
      required this.forHw});

  @override
  State<VerifyHwCwHome> createState() => _VerifyHwCwHomeState();
}

class _VerifyHwCwHomeState extends State<VerifyHwCwHome> {
  final List<String> sessions = [
    "2023",
    "2022",
    "2021",
  ];

  final List<String> section = ["A", "B", "C", "D", "E", "F"];
  final List<String> className = [
    "X",
    "IX",
    "VIII",
  ];

  final List<String> subject = [
    "Biology",
    "Physics",
    "Chemistry",
    "Mathematics",
  ];
  String selectedValue = "2023";
  String secSelectedValue = "A";
  String clsSelectedValue = "VIII";
  String subSelectedValue = "Biology";

  final HwCwController verifyController = Get.put(HwCwController());

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await loadVHw();
    });
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<HwCwController>();
    super.dispose();
  }

  Future<void> loadVHw() async {
    await HwCwGetAcademicYear.instance.getAcademicYear(
      miId: widget.loginSuccessModel.mIID!,
      userId: widget.loginSuccessModel.userId!,
      loginId: widget.loginSuccessModel.userId!,
      ivrmrtId: widget.loginSuccessModel.roleId!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      hrmeId: widget.loginSuccessModel.empcode!,
      base: baseUrlFromInsCode(
        "portal",
        widget.mskoolController,
      ),
      hwCwController: verifyController,
    );
    if (verifyController.isErrorOccuredLoadingAcademicYear.value ||
        verifyController.session.isEmpty) {
      return;
    }

    await HwCwGetClassApi.instance.getHwCwClasses(
      miId: widget.loginSuccessModel.mIID!,
      loginId: widget.loginSuccessModel.userId!,
      asmayId: verifyController.selectedSession.value.asmaYId!,
      ivrmrtId: widget.loginSuccessModel.roleId!,
      hrmeId: widget.loginSuccessModel.empcode!,
      base: baseUrlFromInsCode(
        "portal",
        widget.mskoolController,
      ),
      hwCwController: verifyController,
    );

    if (verifyController.isErrorOccuredLoadingClass.value ||
        verifyController.classes.isEmpty) {
      return;
    }

    await HwCwGetSection.instance.getSections(
      miId: widget.loginSuccessModel.mIID!,
      ivrmrtId: widget.loginSuccessModel.roleId!,
      asmayId: verifyController.selectedSession.value.asmaYId!,
      userId: widget.loginSuccessModel.userId!,
      hrmeId: widget.loginSuccessModel.empcode!,
      loginId: widget.loginSuccessModel.userId!,
      asmclId: verifyController.selectedClass.value.asmcLId!,
      base: baseUrlFromInsCode("portal", widget.mskoolController),
      hwCwController: verifyController,
      fromVerifyCat: true,
    );
    if (verifyController.isErrorOccuredLoadingSection.value ||
        verifyController.sections.isEmpty) {
      return;
    }
    if (widget.forHw) {
      await HwCwGetSubjectsApi.instance.getSubjects(
        miId: widget.loginSuccessModel.mIID!,
        asmayId: verifyController.selectedSession.value.asmaYId!,
        asmclId: verifyController.selectedClass.value.asmcLId!,
        hrmeId: widget.loginSuccessModel.empcode!,
        sections: [
          {"ASMS_Id": verifyController.selectedSection.first.asmSId!}
        ],
        ivrmrtId: widget.loginSuccessModel.roleId!,
        loginId: widget.loginSuccessModel.userId!,
        base: baseUrlFromInsCode("portal", widget.mskoolController),
        hwCwController: verifyController,
      );
      return;
    }
    await VerifyCwSubjectListApi.instance.getCwSubjects(
        miId: widget.loginSuccessModel.mIID!,
        hrme: widget.loginSuccessModel.empcode!,
        loginId: widget.loginSuccessModel.userId!,
        userId: widget.loginSuccessModel.userId!,
        ivrmrtId: widget.loginSuccessModel.roleId!,
        asmayId: verifyController.selectedSession.value.asmaYId!,
        asmscld: verifyController.selectedClass.value.asmcLId!,
        asmsId: verifyController.selectedSection.first.asmSId!,
        base: baseUrlFromInsCode("portal", widget.mskoolController),
        hwCwController: verifyController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: widget.title).getAppBar(),
        body: Obx(() {
          return verifyController.isErrorOccuredLoadingAcademicYear.value
              ? Center(
                  child: ErrWidget(err: {
                    "errorTitle": "Error Occured Loading Academic's",
                    "errorMsg": verifyController.errorStatus.value
                  }),
                )
              : verifyController.isAcademicYearLoading.value
                  ? Center(
                      child: AnimatedProgressWidget(
                        title: "Loading Academic's",
                        desc: verifyController.loadingStatus.value,
                        animationPath: "assets/json/default.json",
                      ),
                    )
                  : verifyController.session.isEmpty
                      ? const Center(
                          child: AnimatedProgressWidget(
                            title: "No Academic's Found",
                            desc:
                                "There are no academic session present in record.",
                            animationPath: "assets/json/nodata.json",
                            animatorHeight: 250,
                          ),
                        )
                      : SingleChildScrollView(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 16.0,
                              ),
                              HwCwAcademicYearDD(
                                hwCwController: verifyController,
                                loginSuccessModel: widget.loginSuccessModel,
                                mskoolController: widget.mskoolController,
                                forHw: widget.forHw,
                              ),
                              Obx(() {
                                return verifyController.isClassLoading.value
                                    ? Center(
                                        child: AnimatedProgressWidget(
                                          title: "Loading Available Classes",
                                          desc: verifyController
                                              .loadingStatus.value,
                                          animationPath:
                                              "assets/json/hwanim.json",
                                        ),
                                      )
                                    : verifyController
                                            .isErrorOccuredLoadingClass.value
                                        ? ErrWidget(err: {
                                            "errorTitle":
                                                "Unexpected Error Occured",
                                            "errorMsg": verifyController
                                                .errorStatus.value
                                          })
                                        : verifyController.classes.isEmpty
                                            ? const Center(
                                                child: AnimatedProgressWidget(
                                                  title: "No Classes Available",
                                                  desc:
                                                      "Sorry but there are no classes available, try changing academic year",
                                                  animationPath:
                                                      "assets/json/nodata.json",
                                                  animatorHeight: 250,
                                                ),
                                              )
                                            : VerifyClassDD(
                                                verifyController:
                                                    verifyController,
                                                loginSuccessModel:
                                                    widget.loginSuccessModel,
                                                mskoolController:
                                                    widget.mskoolController,
                                                forHw: widget.forHw,
                                              );
                              }),
                            ],
                          ),
                        );
        })

        // body: SingleChildScrollView(
        //   padding: const EdgeInsets.all(16.0),
        //   child: Column(
        //     children: [
        //       const SizedBox(
        //         height: 16.0,
        //       ),
        //       CustomContainer(
        //         child: DropdownButtonFormField(
        //             value: selectedValue,
        //             style: Theme.of(context).textTheme.titleSmall!.merge(
        //                   const TextStyle(fontSize: 16.0),
        //                 ),
        //             decoration: InputDecoration(
        //               focusedBorder: const OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                   color: Colors.transparent,
        //                 ),
        //               ),
        //               enabledBorder: const OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                   color: Colors.transparent,
        //                 ),
        //               ),
        //               label: Container(
        //                 decoration: BoxDecoration(
        //                   color: const Color(0xFFDFFBFE),
        //                   borderRadius: BorderRadius.circular(24.0),
        //                 ),
        //                 padding: const EdgeInsets.symmetric(
        //                     horizontal: 12.0, vertical: 6.0),
        //                 child: Row(
        //                   mainAxisSize: MainAxisSize.min,
        //                   children: [
        //                     Image.asset(
        //                       "assets/images/cap.png",
        //                       height: 24.0,
        //                     ),
        //                     const SizedBox(
        //                       width: 6.0,
        //                     ),
        //                     Text(
        //                       " Academic Year ",
        //                       style:
        //                           Theme.of(context).textTheme.labelMedium!.merge(
        //                                 const TextStyle(
        //                                     backgroundColor: Color(0xFFDFFBFE),
        //                                     fontSize: 20.0,
        //                                     color: Color(0xFF28B6C8)),
        //                               ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               border: const OutlineInputBorder(),
        //             ),
        //             icon: const Padding(
        //               padding: EdgeInsets.only(top: 4.5),
        //               child: Icon(
        //                 Icons.keyboard_arrow_down_outlined,
        //                 size: 30,
        //               ),
        //             ),
        //             items: sessions
        //                 .map((e) => DropdownMenuItem(
        //                     value: e,
        //                     child: Padding(
        //                       padding: const EdgeInsets.only(top: 8, left: 5),
        //                       child: Text(e),
        //                     )))
        //                 .toList(),
        //             onChanged: (e) {
        //               selectedValue = e!;
        //             }),
        //       ),
        //       const SizedBox(
        //         height: 32.0,
        //       ),
        //       CustomContainer(
        //         child: DropdownButtonFormField(
        //             value: clsSelectedValue,
        //             style: Theme.of(context).textTheme.titleSmall!.merge(
        //                   const TextStyle(fontSize: 16.0),
        //                 ),
        //             decoration: InputDecoration(
        //               focusedBorder: const OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                   color: Colors.transparent,
        //                 ),
        //               ),
        //               enabledBorder: const OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                   color: Colors.transparent,
        //                 ),
        //               ),
        //               label: Container(
        //                 decoration: BoxDecoration(
        //                   color: const Color(0xFFFFEBEA),
        //                   borderRadius: BorderRadius.circular(24.0),
        //                 ),
        //                 padding: const EdgeInsets.symmetric(
        //                     horizontal: 12.0, vertical: 6.0),
        //                 child: Row(
        //                   mainAxisSize: MainAxisSize.min,
        //                   children: [
        //                     SvgPicture.asset(
        //                       "assets/svg/class_.svg",
        //                       height: 24.0,
        //                       color: const Color(0xFFFF6F67),
        //                     ),
        //                     const SizedBox(
        //                       width: 6.0,
        //                     ),
        //                     Text(
        //                       " Class ",
        //                       style:
        //                           Theme.of(context).textTheme.labelMedium!.merge(
        //                                 const TextStyle(
        //                                     fontSize: 20.0,
        //                                     color: Color(0xFFFF6F67)),
        //                               ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               border: const OutlineInputBorder(),
        //             ),
        //             icon: const Padding(
        //               padding: EdgeInsets.only(top: 4.5),
        //               child: Icon(
        //                 Icons.keyboard_arrow_down_outlined,
        //                 size: 30,
        //               ),
        //             ),
        //             items: className
        //                 .map((e) => DropdownMenuItem(
        //                     value: e,
        //                     child: Padding(
        //                       padding: const EdgeInsets.only(top: 8, left: 5),
        //                       child: Text(e),
        //                     )))
        //                 .toList(),
        //             onChanged: (e) {
        //               clsSelectedValue = e!;
        //             }),
        //       ),
        //       const SizedBox(
        //         height: 32.0,
        //       ),
        //       CustomContainer(
        //         child: DropdownButtonFormField(
        //             value: secSelectedValue,
        //             style: Theme.of(context).textTheme.titleSmall!.merge(
        //                   const TextStyle(fontSize: 16.0),
        //                 ),
        //             decoration: InputDecoration(
        //               focusedBorder: const OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                   color: Colors.transparent,
        //                 ),
        //               ),
        //               enabledBorder: const OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                   color: Colors.transparent,
        //                 ),
        //               ),
        //               label: Container(
        //                 decoration: BoxDecoration(
        //                   color: const Color(0xFFDBFDF5),
        //                   borderRadius: BorderRadius.circular(24.0),
        //                 ),
        //                 padding: const EdgeInsets.symmetric(
        //                     horizontal: 12.0, vertical: 6.0),
        //                 child: Row(
        //                   mainAxisSize: MainAxisSize.min,
        //                   children: [
        //                     SvgPicture.asset(
        //                       "assets/svg/section_.svg",
        //                       height: 24.0,
        //                       color: const Color(0xFF47BA9E),
        //                     ),
        //                     const SizedBox(
        //                       width: 6.0,
        //                     ),
        //                     Text(
        //                       " Section ",
        //                       style:
        //                           Theme.of(context).textTheme.labelMedium!.merge(
        //                                 const TextStyle(
        //                                     //backgroundColor: Color(0xFFDFFBFE),
        //                                     fontSize: 20.0,
        //                                     color: Color(0xFF47BA9E)),
        //                               ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               border: const OutlineInputBorder(),
        //             ),
        //             icon: const Padding(
        //               padding: EdgeInsets.only(top: 4.5),
        //               child: Icon(
        //                 Icons.keyboard_arrow_down_outlined,
        //                 size: 30,
        //               ),
        //             ),
        //             items: section
        //                 .map((e) => DropdownMenuItem(
        //                     value: e,
        //                     child: Padding(
        //                       padding: const EdgeInsets.only(top: 8, left: 5),
        //                       child: Text(e),
        //                     )))
        //                 .toList(),
        //             onChanged: (e) {
        //               secSelectedValue = e!;
        //             }),
        //       ),
        //       const SizedBox(
        //         height: 32.0,
        //       ),
        //       CustomContainer(
        //         child: DropdownButtonFormField(
        //             value: subSelectedValue,
        //             style: Theme.of(context).textTheme.titleSmall!.merge(
        //                   const TextStyle(fontSize: 16.0),
        //                 ),
        //             decoration: InputDecoration(
        //               focusedBorder: const OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                   color: Colors.transparent,
        //                 ),
        //               ),
        //               enabledBorder: const OutlineInputBorder(
        //                 borderSide: BorderSide(
        //                   color: Colors.transparent,
        //                 ),
        //               ),
        //               label: Container(
        //                 decoration: BoxDecoration(
        //                   color: const Color(0xFFF0EBFF),
        //                   borderRadius: BorderRadius.circular(24.0),
        //                 ),
        //                 padding: const EdgeInsets.symmetric(
        //                     horizontal: 12.0, vertical: 6.0),
        //                 child: Row(
        //                   mainAxisSize: MainAxisSize.min,
        //                   children: [
        //                     Image.asset(
        //                       "assets/images/HINDI.png",
        //                       height: 24.0,
        //                       color: const Color(0xFF7757D9),
        //                     ),
        //                     const SizedBox(
        //                       width: 6.0,
        //                     ),
        //                     Text(
        //                       " Subject ",
        //                       style:
        //                           Theme.of(context).textTheme.labelMedium!.merge(
        //                                 const TextStyle(
        //                                   color: Color(0xFF7757D9),
        //                                   fontSize: 20.0,
        //                                 ),
        //                               ),
        //                     ),
        //                   ],
        //                 ),
        //               ),
        //               border: const OutlineInputBorder(),
        //             ),
        //             icon: const Padding(
        //               padding: EdgeInsets.only(top: 4.5),
        //               child: Icon(
        //                 Icons.keyboard_arrow_down_outlined,
        //                 size: 30,
        //               ),
        //             ),
        //             items: subject
        //                 .map((e) => DropdownMenuItem(
        //                     value: e,
        //                     child: Padding(
        //                       padding: const EdgeInsets.only(top: 8, left: 5),
        //                       child: Text(e),
        //                     )))
        //                 .toList(),
        //             onChanged: (e) {
        //               subSelectedValue = e!;
        //             }),
        //       ),
        //       const SizedBox(
        //         height: 32.0,
        //       ),
        //       Row(
        //         children: [
        //           Expanded(
        //             child: CustomContainer(
        //               child: TextField(
        //                 style: Theme.of(context).textTheme.titleSmall,
        //                 readOnly: true,
        //                 //maxLines: 4,
        //                 decoration: InputDecoration(
        //                   suffixIcon: IconButton(
        //                     onPressed: () {},
        //                     icon: SvgPicture.asset(
        //                       'assets/svg/calendar_icon.svg',
        //                       color: const Color(0xFF3E78AA),
        //                       height: 22.0,
        //                     ),
        //                   ),
        //                   contentPadding:
        //                       const EdgeInsets.only(top: 48.0, left: 12),
        //                   border: const OutlineInputBorder(),
        //                   label: Container(
        //                     margin: const EdgeInsets.only(bottom: 5),
        //                     padding: const EdgeInsets.symmetric(
        //                         horizontal: 12.0, vertical: 8.0),
        //                     decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(24.0),
        //                         color: const Color(0xFFE5F3FF)),
        //                     child: Row(
        //                       mainAxisSize: MainAxisSize.min,
        //                       children: [
        //                         SvgPicture.asset(
        //                           "assets/svg/calendar_icon.svg",
        //                           color: const Color(0xFF3E78AA),
        //                           height: 24.0,
        //                         ),
        //                         const SizedBox(
        //                           width: 6.0,
        //                         ),
        //                         Text(
        //                           " Start Date ",
        //                           style: Theme.of(context)
        //                               .textTheme
        //                               .labelMedium!
        //                               .merge(
        //                                 const TextStyle(
        //                                   fontSize: 20.0,
        //                                   color: Color(0xFF3E78AA),
        //                                 ),
        //                               ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   hintText: 'Select Date',
        //                   floatingLabelBehavior: FloatingLabelBehavior.always,
        //                   enabledBorder: const OutlineInputBorder(
        //                     borderSide: BorderSide(
        //                       color: Colors.transparent,
        //                     ),
        //                   ),
        //                   focusedBorder: const OutlineInputBorder(
        //                     borderSide: BorderSide(
        //                       color: Colors.transparent,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //           const SizedBox(
        //             width: 12.0,
        //           ),
        //           Expanded(
        //             child: CustomContainer(
        //               child: TextField(
        //                 readOnly: true,
        //                 style: Theme.of(context).textTheme.titleSmall,

        //                 //maxLines: 4,
        //                 decoration: InputDecoration(
        //                   isDense: true,
        //                   contentPadding:
        //                       const EdgeInsets.only(top: 48.0, left: 12),
        //                   suffixIcon: IconButton(
        //                     onPressed: () {},
        //                     icon: SvgPicture.asset(
        //                       'assets/svg/calendar_icon.svg',
        //                       color: const Color(0xFF3E78AA),
        //                       height: 22.0,
        //                     ),
        //                   ),
        //                   border: const OutlineInputBorder(),
        //                   label: Container(
        //                     margin: const EdgeInsets.only(bottom: 5),
        //                     padding: const EdgeInsets.symmetric(
        //                         horizontal: 12.0, vertical: 8.0),
        //                     decoration: BoxDecoration(
        //                         borderRadius: BorderRadius.circular(24.0),
        //                         color: const Color(0xFFE5F3FF)),
        //                     child: Row(
        //                       mainAxisSize: MainAxisSize.min,
        //                       children: [
        //                         SvgPicture.asset(
        //                           "assets/svg/calendar_icon.svg",
        //                           color: const Color(0xFF3E78AA),
        //                           height: 24.0,
        //                         ),
        //                         const SizedBox(
        //                           width: 6.0,
        //                         ),
        //                         Text(
        //                           " End Date ",
        //                           style: Theme.of(context)
        //                               .textTheme
        //                               .labelMedium!
        //                               .merge(
        //                                 const TextStyle(
        //                                     fontSize: 20.0,
        //                                     color: Color(0xFF3E78AA)),
        //                               ),
        //                         ),
        //                       ],
        //                     ),
        //                   ),
        //                   hintText: 'Select Date',
        //                   floatingLabelBehavior: FloatingLabelBehavior.always,
        //                   enabledBorder: const OutlineInputBorder(
        //                     borderSide: BorderSide(
        //                       color: Colors.transparent,
        //                     ),
        //                   ),
        //                   focusedBorder: const OutlineInputBorder(
        //                     borderSide: BorderSide(
        //                       color: Colors.transparent,
        //                     ),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //           ),
        //         ],
        //       ),
        //       const SizedBox(
        //         height: 32.0,
        //       ),
        //       MSkollBtn(
        //         title: "View Details",
        //         onPress: () {
        //           Navigator.push(context, MaterialPageRoute(builder: (_) {
        //             return VerifyHwCwViewDetails(
        //                 title: widget.title, forHw: widget.forHw);
        //           }));
        //         },
        //         size: Size(
        //           Get.width * 0.5,
        //           50,
        //         ),
        //       ),
        //       const AnimatedProgressWidget(
        //         title: "",
        //         desc: "",
        //         animationPath: "assets/json/nodata.json",
        //         animatorHeight: 250,
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
