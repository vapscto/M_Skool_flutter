import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';
import '../../controller/mskoll_controller.dart';
import '../../model/login_success_model.dart';
import '../controller/exam_controller.dart';
import '../tabs/exam_wise_tab.dart';
import '../tabs/subject_wise_tab.dart';

class ExamHome extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ExamHome({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<ExamHome> createState() => _ExamHomeState();
}

class _ExamHomeState extends State<ExamHome> {
  final examController = Get.put(ExamController());
  int selectedTab = 0;

  getAcademicYear() async {
    examController.isloading(true);
    await examController
        .getAcademicYearData(
            miID: widget.loginSuccessModel.mIID!,
            amstID: widget.loginSuccessModel.amsTId!,
            base: baseUrlFromInsCode(
              'portal',
              widget.mskoolController,
            ))
        .then((value) async {
      if (value) {
        await examController
            .getExamListData(
                miID: widget.loginSuccessModel.mIID!,
                amstID: widget.loginSuccessModel.amsTId!,
                asmayID: examController.selectedYear!.asmaYId!,
                base: baseUrlFromInsCode(
                  'portal',
                  widget.mskoolController,
                ))
            .then((value) async {
          if (value) {
            examController.examwiseMarkOverview.clear();
            examController.isDataListloading(true);
            await examController.getMarkOverviewData(
                miID: widget.loginSuccessModel.mIID!,
                asmayID: examController.selectedYear!.asmaYId!,
                asmtID: widget.loginSuccessModel.amsTId!,
                emeID: examController.examList.first.emEId!,
                base: baseUrlFromInsCode(
                  'portal',
                  widget.mskoolController,
                ));
            examController.isDataListloading(false);
          }
        });
      }
    });
    examController.isloading(false);
  }

  @override
  void initState() {
    super.initState();
    getAcademicYear();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Build");
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 30,
          title: Text("Exam".tr),
          leading: const CustomGoBackButton(),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50.0),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
              ),
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: TabBar(
                onTap: (index) {
                  setState(() {
                    selectedTab = index;
                    if (selectedTab == 0) {
                      getAcademicYear();
                    }
                  });
                },
                unselectedLabelColor: Colors.white,
                labelColor: Colors.black,
                indicator: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  color: Colors.white,
                ),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        selectedTab == 0
                            ? SvgPicture.asset('assets/svg/exam_ic.svg')
                            : const SizedBox(),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "Exam Wise",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                TextStyle(
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.1,
                                    color: selectedTab != 0
                                        ? Colors.white
                                        : Colors.black),
                              ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        selectedTab == 1
                            ? SvgPicture.asset('assets/svg/exam_ic.svg')
                            : const SizedBox(),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "Subject Wise",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                TextStyle(
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.1,
                                    color: selectedTab != 1
                                        ? Colors.white
                                        : Colors.black),
                              ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            ExamWiseTab(
              loginSuccessModel: widget.loginSuccessModel,
              mskoolController: widget.mskoolController,
            ),
            SubjectWiseTab(
              loginSuccessModel: widget.loginSuccessModel,
              mskoolController: widget.mskoolController,
            ),
          ],
        ),
        floatingActionButton: const HomeFab(),
      ),
    );
  }
}

// class OldRow extends StatelessWidget {
//   const OldRow({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               Get.to(() => ResultDetail(resultType: 0));
//             },
//             child: CustomContainer(
//               gradient: const LinearGradient(
//                   colors: [Color(0xFF147278), Color(0xFFB7F1E7)]),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       "assets/images/exam.png",
//                       width: 100,
//                       height: 100,
//                     ),
//                     const SizedBox(
//                       height: 6.0,
//                     ),
//                     Text(
//                       "Exam Wise".tr,
//                       style: Theme.of(context).textTheme.titleMedium,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 12.0,
//         ),
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               Get.to(() => ResultDetail(resultType: 1));
//             },
//             child: CustomContainer(
//               gradient: const LinearGradient(
//                   colors: [Color(0xFFBe6D84), Color(0xFFFFD5c5)]),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       "assets/images/book.png",
//                       width: 100,
//                       height: 100,
//                     ),
//                     const SizedBox(
//                       height: 6.0,
//                     ),
//                     Text(
//                       "Subject Wise".tr,
//                       style: Theme.of(context).textTheme.titleMedium,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
