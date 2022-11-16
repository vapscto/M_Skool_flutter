import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:m_skool_flutter/certificates/screens/apply_now.dart';
import 'package:m_skool_flutter/certificates/screens/view_details.dart';
import 'package:m_skool_flutter/controller/tab_controller.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class CertificateHomeScreen extends StatefulWidget {
  const CertificateHomeScreen({super.key});

  @override
  State<CertificateHomeScreen> createState() => _CertificateHomeScreenState();
}

class _CertificateHomeScreenState extends State<CertificateHomeScreen>
    with TickerProviderStateMixin {
  TabController? tabController;
  final TabStateController tabStateController =
      Get.put<TabStateController>(TabStateController());

  final List<Widget> tabsChildren = const [
    ApplyNow(),
    ViewDetails(),
  ];

  final PageController pageViewController = PageController();

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      tabStateController.updateSelectedIndex(tabController!.index);
      pageViewController.animateToPage(
        tabController!.index,
        duration: const Duration(
          milliseconds: 300,
        ),
        curve: Curves.fastOutSlowIn,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    tabController!.dispose();
    pageViewController.dispose();
    tabStateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Certificate").getAppBar(),
      body: Column(
        children: [
          SizedBox(
            height: 60,
            child: Obx(() {
              return TabBar(
                controller: tabController,
                indicatorColor: Get.theme.primaryColor,
                indicatorWeight: 3,

                // unselectedLabelStyle: Theme.of(context)
                //     .textTheme
                //     .labelMedium!
                //     .merge(const TextStyle(fontSize: 14.0)),
                tabs: [
                  Tab(
                    child: Text(
                      "Apply",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .merge(TextStyle(
                            color: tabStateController.selectedIndex.value == 0
                                ? Get.theme.primaryColor
                                : Colors.black54,
                          )),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "View Details",
                      style: Theme.of(context).textTheme.titleMedium!.merge(
                            TextStyle(
                              color: tabStateController.selectedIndex.value == 1
                                  ? Get.theme.primaryColor
                                  : Colors.black54,
                            ),
                          ),
                    ),
                  ),
                ],
              );
            }),
          ),
          const Divider(
            thickness: 2,
            height: 1,
          ),
          Expanded(
            child: SizedBox(
              height: Get.height,
              child: PageView.builder(
                controller: pageViewController,
                itemCount: tabsChildren.length,
                itemBuilder: (_, index) {
                  return tabsChildren.elementAt(index);
                },
                onPageChanged: (index) {
                  tabController!.animateTo(index);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
