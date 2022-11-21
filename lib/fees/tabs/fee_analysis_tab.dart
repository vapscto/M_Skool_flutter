import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/fees/controller/fee_related_controller.dart';

import '../../controller/mskoll_controller.dart';
import '../../model/login_success_model.dart';
import 'headwise_analysis_tab.dart';
import 'overallAnalysis_tab.dart';

class FeeAnalysisTab extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const FeeAnalysisTab({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<FeeAnalysisTab> createState() => _FeeAnalysisTabState();
}

class _FeeAnalysisTabState extends State<FeeAnalysisTab>
    with TickerProviderStateMixin {
  final feeController = Get.put(FeeController());
  TabController? tabController;
  final PageController pageController = PageController();
  RxInt currentPage = RxInt(0);

  List<Widget> pages = const [
    OverallAnalysisTab(),
    HeadwiseAnalysisTab(),
  ];

  Future<void> getOverallData() async {
    feeController.isloading(true);
    await feeController
        .getFeeAnalysisData(
      miId: widget.loginSuccessModel.mIID!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      amstId: widget.loginSuccessModel.amsTId!,
      base: baseUrlFromInsCode('portal', widget.mskoolController),
    )
        .then((value) {
      debugPrint(value.toString());
    });
    feeController.isloading(false);
  }

  @override
  void initState() {
    getOverallData();

    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      pageController.animateToPage(tabController!.index,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastLinearToSlowEaseIn);
    });
    pageController.addListener(() {
      currentPage.value = tabController!.index;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          child: Obx(() {
            return TabBar(
              controller: tabController!,
              unselectedLabelColor: Colors.white,
              labelColor: Colors.black,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(
                  color: Get.theme.primaryColor,
                  width: 3,
                  style: BorderStyle.solid,
                ),
              ),
              tabs: [
                Tab(
                  child: Text(
                    "Overall Analysis",
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.1,
                              color: currentPage.value != 0
                                  ? const Color.fromRGBO(0, 0, 0, 0.6)
                                  : Get.theme.primaryColor),
                        ),
                  ),
                ),
                Tab(
                  child: Text(
                    "Headwise Analysis",
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              letterSpacing: 0.1,
                              color: currentPage.value != 1
                                  ? const Color.fromRGBO(0, 0, 0, 0.6)
                                  : Get.theme.primaryColor),
                        ),
                  ),
                )
              ],
            );
          }),
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
    );
  }
}
