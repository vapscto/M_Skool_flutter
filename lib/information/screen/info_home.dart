import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/classwork/screen/classwork_home.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/homework/screen/home_work.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/notice/screen/notice_home.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class InfoHome extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const InfoHome(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<InfoHome> createState() => _InfoHomeState();
}

class _InfoHomeState extends State<InfoHome> with TickerProviderStateMixin {
  TabController? tabController;
  final PageController pageController = PageController();
  List<Widget> pages = [];
  @override
  void initState() {
    pages.addAll([
      HomeWorkScreen(),
      ClassworkHome(),
      NoticeHome(
        showAppBar: false,
        loginSuccessModel: widget.loginSuccessModel,
        mskoolController: widget.mskoolController,
      ),
    ]);
    tabController = TabController(length: 3, vsync: this);
    // tabController!.addListener(() {
    //   pageController.animateToPage(tabController!.index,
    //       duration: const Duration(milliseconds: 800),
    //       curve: Curves.fastLinearToSlowEaseIn);
    // });
    // pageController.addListener(() {
    //   currentPage.value = tabController!.index;
    // });

    // tabController!.addListener(() {

    // });
    super.initState();
  }

  RxInt currentPage = RxInt(0);

  RxBool showFilter = RxBool(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Info",
        action: [
          IconButton(
            onPressed: () {
              showFilter.value = !showFilter.value;
              setState(() {});
            },
            icon: SvgPicture.asset('assets/svg/filter.svg'),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(showFilter.value ? 130 : 0.0),
          child: !showFilter.value
              ? const SizedBox()
              : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Filter",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .merge(const TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding:
                                  const EdgeInsets.only(left: 12.0, right: 8.0),
                              alignment: Alignment.centerLeft,
                              width: double.infinity,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Theme.of(context).cardColor,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: Text(
                                "Start Date",
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Expanded(
                              child: Container(
                            width: double.infinity,
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            height: 50,
                            decoration: BoxDecoration(
                              color: Theme.of(context).cardColor,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: Text(
                              "End Date",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ).getAppBar(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Obx(() {
              return TabBar(
                  isScrollable: true,
                  controller: tabController,
                  unselectedLabelColor: Colors.white,
                  labelColor: Colors.black,
                  indicator: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  onTap: (e) {
                    currentPage.value = e;
                    pageController.animateToPage(e,
                        duration: const Duration(milliseconds: 800),
                        curve: Curves.fastLinearToSlowEaseIn);
                  },
                  tabs: [
                    Tab(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          currentPage.value == 0
                              ? SvgPicture.asset(
                                  'assets/svg/hwcw.svg',
                                  color: Theme.of(context).iconTheme.color,
                                )
                              : const SizedBox(),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            "Homework",
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      TextStyle(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.1,
                                          color: currentPage.value != 0
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
                          currentPage.value == 1
                              ? SvgPicture.asset('assets/svg/hwcw.svg')
                              : const SizedBox(),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            "Classwork",
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      TextStyle(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.1,
                                          color: currentPage.value != 1
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
                          currentPage.value == 2
                              ? SvgPicture.asset('assets/svg/notice.svg')
                              : const SizedBox(),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            "Noticeboard",
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      TextStyle(
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 0.1,
                                          color: currentPage.value != 2
                                              ? Colors.white
                                              : Colors.black),
                                    ),
                          ),
                        ],
                      ),
                    )
                  ]);
            }),
          ),
          Flexible(
              child: SizedBox(
            height: Get.height,
            child: PageView.builder(
              controller: pageController,
              itemCount: pages.length,
              itemBuilder: (_, index) {
                return pages.elementAt(index);
              },
              onPageChanged: (v) {
                currentPage.value = v;
                tabController!.animateTo(v);
              },
            ),
          ))
        ],
      ),
    );
  }
}
