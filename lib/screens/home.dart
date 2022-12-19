import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/apis/fee_reminder_api.dart';
import 'package:m_skool_flutter/attendance/screens/home_page.dart';
import 'package:m_skool_flutter/certificates/screens/cert_home.dart';
import 'package:m_skool_flutter/classwork/screen/classwork_home_screen.dart';
import 'package:m_skool_flutter/coe/screen/coe_home.dart';
import 'package:m_skool_flutter/controller/dashboard_controller.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/exam/screen/exam_home.dart';
import 'package:m_skool_flutter/feedback/screens/feedback_home.dart';
import 'package:m_skool_flutter/fees/screens/fee_analysis_screen.dart';
import 'package:m_skool_flutter/fees/screens/fee_receipt_home.dart';
import 'package:m_skool_flutter/fees/screens/online_payment_screen.dart';
import 'package:m_skool_flutter/homework/screen/home_work_screen.dart';
import 'package:m_skool_flutter/information/controller/hwcwnb_controller.dart';
import 'package:m_skool_flutter/information/screen/info_home.dart';
import 'package:m_skool_flutter/interaction/screen/interaction_home.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/notice/screen/notice_home.dart';
import 'package:m_skool_flutter/screens/home_page_drawer.dart';
import 'package:m_skool_flutter/tabs/profile_tab.dart';
import 'package:m_skool_flutter/timetable/screens/time_table_home.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../fees/screens/fee_home_screen.dart';

class Home extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const Home(
      {Key? key,
      required this.loginSuccessModel,
      required this.mskoolController})
      : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RxInt pageNumber = 0.obs;
  RxString keyWord = "".obs;
  TextEditingController textEditingController = TextEditingController();
  DashboardController dashboardController = Get.put(DashboardController());
  ScrollController scrollController = ScrollController();
  RxList<LoginValues> values = RxList<LoginValues>();
  final HwCwNbController hwCwNbController = Get.put(HwCwNbController());

  RxList<Map<String, dynamic>> homeViewPage = RxList<Map<String, dynamic>>();
  final PageController pageController = PageController();
  @override
  void initState() {
    dashboardController.studentDashBoardDetails(
        miId: widget.loginSuccessModel.mIID!,
        asmayId: widget.loginSuccessModel.asmaYId!,
        amstId: widget.loginSuccessModel.amsTId!,
        base: baseUrlFromInsCode("portal", widget.mskoolController),
        asmcLId: widget.loginSuccessModel.asmcLId!,
        asmSId: widget.loginSuccessModel.asmSId!);
    FeeReminderApi.instance.showFeeReminder(
        miId: widget.loginSuccessModel.mIID!,
        asmayId: widget.loginSuccessModel.asmaYId!,
        amstId: widget.loginSuccessModel.amsTId!,
        asmclId: widget.loginSuccessModel.asmcLId!,
        asmsId: widget.loginSuccessModel.asmSId!,
        base: baseUrlFromInsCode("portal", widget.mskoolController),
        context: context,
        loginSuccessModel: widget.loginSuccessModel,
        mskoolController: widget.mskoolController);
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      homeViewPage.clear();
      homeViewPage.add({
        "title": const Text("Dashboard"),
        "color": const Color(0xFF9900F0),
        "navTitle": const Text(
          "Home",
        ),
        "page": HomeTab(
          loginSuccessModel: widget.loginSuccessModel,
          mskoolController: widget.mskoolController,
          hwCwNbController: hwCwNbController,
        ),
        "icon": SvgPicture.asset(
          'assets/svg/home.svg',
          color:
              (pageNumber.value == 0) ? const Color(0xFF9900F0) : Colors.grey,
        ),
      });
      homeViewPage.add({
        "title": const Text("Interaction"),
        "color": const Color(0xFFFF008C),
        "navTitle": const Text(
          "Interaction",
        ),
        "page": InteractionHomeScreen(
          loginSuccessModel: widget.loginSuccessModel,
          mskoolController: widget.mskoolController,
          showAppBar: false,
        ),
        "icon": const Icon(
          Icons.message_outlined,
        ),
      });
      homeViewPage.add({
        "title": const Text("COE"),
        "color": const Color(0xFFFFA901),
        "navTitle": const Text(
          "COE",
        ),
        "page": CoeHome(
          loginSuccessModel: widget.loginSuccessModel,
          mskoolController: widget.mskoolController,
          pageController: pageController,
          showAppBar: false,
        ),
        "icon": const Icon(Icons.calendar_today_outlined),
      });
      homeViewPage.add({
        "title": const Text("Profile"),
        "color": const Color(0xFF3D9292),
        "navTitle": const Text(
          "Profile",
        ),
        "page": ProfileTab(
          loginSuccessModel: widget.loginSuccessModel,
          mskoolController: widget.mskoolController,
          pageController: pageController,
        ),
        "icon": SvgPicture.asset(
          'assets/svg/profile.svg',
          color:
              (pageNumber.value == 3) ? const Color(0xFF3D9292) : Colors.grey,
        ),
      });
      return Scaffold(
        key: _scaffold,
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset('assets/svg/menu.svg'),
            onPressed: () {
              _scaffold.currentState!.openDrawer();
            },
          ),
          title: homeViewPage.elementAt(pageNumber.value)["title"]!,
          actions: [
            IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                'assets/svg/bell.svg',
              ),
            ),
            const SizedBox(
              width: 6.0,
            ),
          ],
        ),
        drawer: HomePageDrawer(
          loginSuccessModel: widget.loginSuccessModel,
          hwCwNbController: hwCwNbController,
          mskoolController: widget.mskoolController,
        ),
        body: PageView.builder(
          controller: pageController,
          itemBuilder: (_, index) {
            logger.d(homeViewPage.length);
            return homeViewPage.elementAt(index)["page"]!;
          },
          itemCount: homeViewPage.length,
          onPageChanged: (e) {
            pageNumber.value = e;
          },
        ),
        bottomNavigationBar: Obx(() {
          return SalomonBottomBar(
            selectedColorOpacity: 0.2,
            unselectedItemColor: Colors.grey,
            // selectedItemColor: Colors.white,
            // itemShape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(10),
            // ),
            currentIndex: pageNumber.value,
            onTap: (i) {
              pageController.animateToPage(i,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastLinearToSlowEaseIn);
              pageNumber.value = i;
            },
            items: [
              ...List.generate(homeViewPage.length, (index) {
                return SalomonBottomBarItem(
                    icon: homeViewPage.elementAt(index)["icon"]!,
                    title: homeViewPage.elementAt(index)["navTitle"]!,
                    selectedColor: homeViewPage.elementAt(index)["color"]!);
              })
            ],
          );
        }),
      );
    });
  }
}

class HomeTab extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final HwCwNbController hwCwNbController;

  const HomeTab({
    Key? key,
    required this.loginSuccessModel,
    required this.mskoolController,
    required this.hwCwNbController,
  }) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  DashboardController dashboardController = Get.find<DashboardController>();
  final ValueNotifier<int> carouselNotifier = ValueNotifier<int>(0);
  List<String> icons = [
    // "attendance",
    "compose",
    "exam_icon",
    "fee",
    "information",
    // "library",
    // "timetable"
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // return Obx(() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // DashboardProfile(loginSuccessModel: widget.loginSuccessModel),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.2,
                    width: double.infinity,
                    child: CarouselSlider.builder(
                      itemCount: 2,
                      itemBuilder: (_, index, i) {
                        return Container(
                          padding: const EdgeInsets.all(20.0),
                          height: Get.height * 0.2,
                          width: Get.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.circular(16.0),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/banner.png"),
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    Text(
                                      "IT’S SAKSHI’S BIRTHDAY",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium!
                                          .merge(
                                            const TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      "Wohoo! It’s your friends birthday! Make their day by wishing them on this special day",
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .merge(
                                            const TextStyle(
                                              fontSize: 15.0,
                                            ),
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              const Expanded(flex: 2, child: SizedBox()),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        aspectRatio: 16 / 9,
                        autoPlay: true,
                        initialPage: 0,
                        onPageChanged: (i, _) => carouselNotifier.value = i,
                        viewportFraction: 1,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: true,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ValueListenableBuilder(
                      valueListenable: carouselNotifier,
                      builder: (_, index, c) {
                        return Center(
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    color: const Color(0xffDFEFFD),
                                    borderRadius: BorderRadius.circular(10)),
                                height: 10,
                                width: 2 * 21, //itemCount * chuckWidth
                              ),
                              AnimatedPositioned(
                                top: 0,
                                left: index * 21,
                                duration: const Duration(microseconds: 500),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: const Color(0xff1E38FC),
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 10,
                                  width: 21,
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 36.0,
                  ),
                  // const DashBoardExamChart(),
                  // (dashboardController.attendance.isNotEmpty)
                  //     ? SizedBox(
                  //         width: Get.width * 0.4329,
                  //         height: Get.width * 0.4329,
                  //         child: SingleChildCardWidget(
                  //           child: DashBoardAttendance(
                  //             attendanceValue: dashboardController
                  //                 .attendance.first.values!.first.score!,
                  //           ),
                  //         ),
                  //       )
                  //     : Container(),
                  Text(
                    "Dashboard",
                    style: Theme.of(context).textTheme.titleMedium!.merge(
                          const TextStyle(fontSize: 20.0),
                        ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Wrap(
                    alignment: WrapAlignment.spaceAround,
                    spacing: 3,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: List.generate(
                        widget.loginSuccessModel.staffmobileappprivileges!
                            .values!.length,
                        (i) => InkWell(
                              onTap: () {
                                switch (widget
                                    .loginSuccessModel
                                    .staffmobileappprivileges!
                                    .values![i]
                                    .pagename) {
                                  case "Student Attendance":
                                    Get.to(() => AttendanceHomeScreen(
                                        loginSuccessModel:
                                            widget.loginSuccessModel,
                                        mskoolController:
                                            widget.mskoolController));
                                    break;
                                  case "Fee Details":
                                    // Get.to(() => FeeHomeScreen(
                                    //     loginSuccessModel:
                                    //         widget.loginSuccessModel,
                                    //     mskoolController:
                                    //         widget.mskoolController));
                                    break;
                                  case "Online Fee Payment":
                                    Get.to(
                                      () => OnlinePaymentScreen(
                                        loginSuccessModel:
                                            widget.loginSuccessModel,
                                        mskoolController:
                                            widget.mskoolController,
                                        title:
                                            "${widget.loginSuccessModel.staffmobileappprivileges!.values![i].pagename}",
                                      ),
                                    );
                                    break;
                                  case "Fee Analysis":
                                    Get.to(() => FeeAnalysisScreen(
                                          loginSuccessModel:
                                              widget.loginSuccessModel,
                                          mskoolController:
                                              widget.mskoolController,
                                          title:
                                              "${widget.loginSuccessModel.staffmobileappprivileges!.values![i].pagename}",
                                        ));
                                    break;
                                  case "Classwork":
                                    Get.to(() => ClassWorkHomeScreen(
                                        loginSuccessModel:
                                            widget.loginSuccessModel,
                                        mskoolController:
                                            widget.mskoolController,
                                        // hwCwNbController:
                                        //     widget.hwCwNbController,
                                        title:
                                            "${widget.loginSuccessModel.staffmobileappprivileges!.values![i].pagename}"));
                                    break;
                                  case "Homework":
                                    Get.to(
                                      () => HomeWorkScreen(
                                        loginSuccessModel:
                                            widget.loginSuccessModel,
                                        mskoolController:
                                            widget.mskoolController,
                                        // hwCwNbController:
                                        //     widget.hwCwNbController,
                                        title:
                                            "${widget.loginSuccessModel.staffmobileappprivileges!.values![i].pagename}",
                                      ),
                                    );
                                    break;
                                  case "COE":
                                    Get.to(() => CoeHome(
                                          loginSuccessModel:
                                              widget.loginSuccessModel,
                                          mskoolController:
                                              widget.mskoolController,
                                          // hwCwNbController:
                                          //     widget.hwCwNbController,
                                          // title:
                                          //     "${widget.loginSuccessModel.staffmobileappprivileges!.values![i].pagename}"
                                        ));
                                    break;
                                  case "Student Notice Board":
                                    Get.to(
                                      () => NoticeHome(
                                        loginSuccessModel:
                                            widget.loginSuccessModel,
                                        mskoolController:
                                            widget.mskoolController,
                                        hwCwNbController:
                                            widget.hwCwNbController,
                                        appBarTitle:
                                            "${widget.loginSuccessModel.staffmobileappprivileges!.values![i].pagename}",
                                      ),
                                    );
                                    break;
                                  case "Library":
                                    String base = baseUrlFromInsCode(
                                        "portal", widget.mskoolController);
                                    Get.to(
                                      () => LibraryHome(
                                        miId: widget.loginSuccessModel.mIID!,
                                        asmayId:
                                            widget.loginSuccessModel.asmaYId!,
                                        asmtId:
                                            widget.loginSuccessModel.amsTId!,
                                        base: base,
                                        title:
                                            "${widget.loginSuccessModel.staffmobileappprivileges!.values![i].pagename}",
                                      ),
                                    );
                                    break;
                                  case "Syllabus":
                                    break;
                                  case "Exam":
                                    Get.to(() => ExamHome(
                                          loginSuccessModel:
                                              widget.loginSuccessModel,
                                          mskoolController:
                                              widget.mskoolController,
                                        ));
                                    break;
                                  case "Interaction":
                                    Get.to(() => InteractionHomeScreen(
                                          loginSuccessModel:
                                              widget.loginSuccessModel,
                                          mskoolController:
                                              widget.mskoolController,
                                        ));
                                    break;
                                  case "Apply Certificate":
                                    Get.to(() => CertificateHomeScreen(
                                          loginSuccessModel:
                                              widget.loginSuccessModel,
                                          mskoolController:
                                              widget.mskoolController,
                                        ));
                                    break;
                                  case "Time Table":
                                    Get.to(() => TimeTableHome(
                                          loginSuccessModel:
                                              widget.loginSuccessModel,
                                          mskoolController:
                                              widget.mskoolController,
                                        ));
                                    break;
                                  case "Fee Receipt":
                                    Get.to(
                                      () => FeeReceiptHome(
                                        loginSuccessModel:
                                            widget.loginSuccessModel,
                                        mskoolController:
                                            widget.mskoolController,
                                        title:
                                            "${widget.loginSuccessModel.staffmobileappprivileges!.values![i].pagename}",
                                      ),
                                    );
                                    break;
                                  default:
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: SizedBox(
                                  width: 80,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          getDashBoardIconByName(
                                              "${widget.loginSuccessModel.staffmobileappprivileges!.values![i].pagename}"),
                                          height: 60,
                                        ),
                                      ),
                                      Text(
                                        "${widget.loginSuccessModel.staffmobileappprivileges!.values![i].pagename}",
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                  ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: widget.loginSuccessModel
                          .staffmobileappprivileges!.values!.length,
                      shrinkWrap: true,
                      itemBuilder: (_, index) {
                        final LoginValues values = widget
                            .loginSuccessModel.staffmobileappprivileges!.values!
                            .elementAt(index);
                        final String category = values.pageurl!.toLowerCase();
                        return ListTile(
                          onTap: () {
                            if (category == "attendance") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return AttendanceHomeScreen(
                                      loginSuccessModel:
                                          widget.loginSuccessModel,
                                      mskoolController: widget.mskoolController,
                                    );
                                  },
                                ),
                              );
                              return;
                            }
                            if (category == 'fees') {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (_) {
                                  return FeeHomeScreen(
                                    loginSuccessModel: widget.loginSuccessModel,
                                    mskoolController: widget.mskoolController,
                                  );
                                }),
                              );
                            }

                            if (category == "exam") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return ExamHome(
                                      loginSuccessModel:
                                          widget.loginSuccessModel,
                                      mskoolController: widget.mskoolController,
                                    );
                                  },
                                ),
                              );
                              return;
                            }

                            if (category == "task") {
                              return;
                            }

                            // if (category == "events") {
                            //   Navigator.push(
                            //     context,
                            //     MaterialPageRoute(
                            //       builder: (_) {
                            //         return CoeHome(
                            //           pageController: ,
                            //           loginSuccessModel: widget.loginSuccessModel,
                            //           mskoolController: widget.mskoolController,
                            //         );
                            //       },
                            //     ),
                            //   );
                            //   return;
                            // }

                            if (category == "library") {
                              String base = baseUrlFromInsCode(
                                  "portal", widget.mskoolController);
                              // debugPrint(base);
                              // debugPrint("Miid -> ${widget.loginSuccessModel.mIID}");
                              // debugPrint(
                              //     "asmayId -> ${widget.loginSuccessModel.asmaYId}");
                              // debugPrint(
                              //     "amstId -> ${widget.loginSuccessModel.amsTId}");
                              if (base.isEmpty) {
                                return;
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return LibraryHome(
                                      miId: widget.loginSuccessModel.mIID!,
                                      asmayId:
                                          widget.loginSuccessModel.asmaYId!,
                                      asmtId: widget.loginSuccessModel.amsTId!,
                                      base: base,
                                      title: "Library",
                                    );
                                  },
                                ),
                              );
                              return;
                            }

                            if (category == "classwork") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return InfoHome(
                                      loginSuccessModel:
                                          widget.loginSuccessModel,
                                      mskoolController: widget.mskoolController,
                                    );
                                  },
                                ),
                              );
                              return;
                            }
                            if (category == "homework") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return TimeTableHome(
                                      loginSuccessModel:
                                          widget.loginSuccessModel,
                                      mskoolController: widget.mskoolController,
                                    );
                                  },
                                ),
                              );
                              return;
                            }
                            if (category == "notice") {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (_) {
                              //       return NoticeHome(
                              //         showAppBar: true,
                              //         loginSuccessModel: widget.loginSuccessModel,
                              //         mskoolController: widget.mskoolController,
                              //       );
                              //     },
                              //   ),
                              // );
                              return;
                            }
                            if (category == "certificate") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return CertificateHomeScreen(
                                      loginSuccessModel:
                                          widget.loginSuccessModel,
                                      mskoolController: widget.mskoolController,
                                    );
                                  },
                                ),
                              );
                              return;
                            }

                            if (category == "syllabus") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return FeedBackHome(
                                      loginSuccessModel:
                                          widget.loginSuccessModel,
                                      mskoolController: widget.mskoolController,
                                    );
                                  },
                                ),
                              );
                              return;
                            }
                            if (category == "interaction") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) {
                                    return InteractionHomeScreen(
                                      loginSuccessModel:
                                          widget.loginSuccessModel,
                                      mskoolController: widget.mskoolController,
                                    );
                                  },
                                ),
                              );
                              return;
                            }
                          },
                          title: Text(widget.loginSuccessModel
                              .staffmobileappprivileges!.values!
                              .elementAt(index)
                              .pagename!),
                        );
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // });
  }
}

class BtmNavItem extends StatelessWidget {
  final bool selected;
  final String title;
  final String img;
  final Function() func;
  const BtmNavItem({
    Key? key,
    required this.selected,
    required this.title,
    required this.img,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Column(
        children: [
          SvgPicture.asset(
            img,
            color: selected
                ? Theme.of(context).primaryColor
                : Colors.grey.shade700,
          ),
          const SizedBox(
            height: 4.0,
          ),
          Text(title),
        ],
      ),
      onPressed: func,
    );
  }
}
