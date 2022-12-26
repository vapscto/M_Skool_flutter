import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/interaction/widget/custom_tab_bar.dart';
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

class _ExamHomeState extends State<ExamHome> with TickerProviderStateMixin {
  final examController = Get.put(ExamController());
  TabController? tabController;
  final PageController pageController = PageController();
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
    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      pageController.animateToPage(tabController!.index,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastLinearToSlowEaseIn);
    });
    pageController.addListener(() {
      selectedTab = tabController!.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var pages = [
      ExamWiseTab(
        loginSuccessModel: widget.loginSuccessModel,
        mskoolController: widget.mskoolController,
      ),
      SubjectWiseTab(
        loginSuccessModel: widget.loginSuccessModel,
        mskoolController: widget.mskoolController,
      ),
    ];
    debugPrint("Build");
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leadingWidth: 30,
          title: Text("Exam".tr),
          leading: const CustomGoBackButton(),
        ),
        body: Column(
          children: [
            CustomTabBar(
              tabs: const [
                CustomTab(
                  name: "Exam wise",
                  asset: "assets/svg/exam_ic.svg",
                ),
                CustomTab(
                  name: "Subject wise",
                  asset: "assets/svg/exam_ic.svg",
                )
              ],
              tabController: tabController!,
            ),
            Expanded(
              child: SizedBox(
                width: double.infinity,
                height: Get.height,
                child: PageView.builder(
                    onPageChanged: (newPage) {
                      tabController!.animateTo(newPage);
                    },
                    controller: pageController,
                    itemCount: pages.length,
                    itemBuilder: (_, index) {
                      return pages.elementAt(index);
                    }),
              ),
            ),
          ],
        ),
        floatingActionButton: const HomeFab(),
      ),
    );
  }
}
