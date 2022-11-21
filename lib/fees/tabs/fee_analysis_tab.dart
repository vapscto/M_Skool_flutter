import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import 'headwise_analysis_tab.dart';
import 'overallAnalysis_tab.dart';

class FeeAnalysisTab extends StatefulWidget {
  const FeeAnalysisTab({super.key});

  @override
  State<FeeAnalysisTab> createState() => _FeeAnalysisTabState();
}

class _FeeAnalysisTabState extends State<FeeAnalysisTab>
    with TickerProviderStateMixin {
  TabController? tabController;

  List<Widget> pages = const [
    OverallAnalysisTab(),
    HeadwiseAnalysisTab(),
  ];

  RxInt currentPage = RxInt(0);

  final PageController pageController = PageController();
  @override
  void initState() {
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
