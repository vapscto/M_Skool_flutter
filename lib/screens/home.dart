import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/attendance/screens/home_page.dart';
import 'package:m_skool_flutter/certificates/screens/cert_home.dart';
import 'package:m_skool_flutter/coe/screen/coe_home.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/exam/screen/exam_home.dart';
import 'package:m_skool_flutter/feedback/screens/feedback_home.dart';
import 'package:m_skool_flutter/information/screen/info_home.dart';
import 'package:m_skool_flutter/interaction/screen/interaction_home.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/dashboard_item_model.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/notice/screen/notice_home.dart';
import 'package:m_skool_flutter/tabs/profile_tab.dart';
import 'package:m_skool_flutter/timetable/screens/time_table_home.dart';

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
  ScrollController scrollController = ScrollController();
  RxList<LoginValues> values = RxList<LoginValues>();

  // List<DashboardItemModel> dashBoard = [
  //   DashboardItemModel(assetLoc: "assets/svg/task.svg", title: "Attendance"),
  //   DashboardItemModel(assetLoc: "assets/svg/exam.svg", title: "Exam"),
  //   DashboardItemModel(assetLoc: "assets/svg/task.svg", title: "Task"),
  //   DashboardItemModel(assetLoc: "assets/svg/exam.svg", title: "COE"),
  //   DashboardItemModel(
  //       assetLoc: "assets/svg/timetable.svg", title: "Timetable"),
  //   DashboardItemModel(assetLoc: "assets/svg/exam.svg", title: "Library"),
  //   DashboardItemModel(assetLoc: "assets/svg/task.svg", title: "Noticeboard"),
  //   DashboardItemModel(
  //       assetLoc: "assets/svg/exam.svg", title: "Apply Certificate"),
  //   DashboardItemModel(assetLoc: "assets/svg/task.svg", title: "Feedback"),
  // ];

  RxList<Widget> homeViewPage = RxList<Widget>();
  final PageController pageController = PageController();
  @override
  void initState() {
    homeViewPage.add(
      HomeTab(
        loginSuccessModel: widget.loginSuccessModel,
        mskoolController: widget.mskoolController,
      ),
    );
    homeViewPage.add(Container(
      child: Text("Interaction"),
    ));
    homeViewPage.add(
      CoeHome(
        loginSuccessModel: widget.loginSuccessModel,
        mskoolController: widget.mskoolController,
        pageController: pageController,
      ),
    );
    homeViewPage.add(
      ProfileTab(
        loginSuccessModel: widget.loginSuccessModel,
        mskoolController: widget.mskoolController,
        pageController: pageController,
      ),
    );

    // for (int i = 0;
    //     i < widget.loginSuccessModel.staffmobileappprivileges!.values!.length;
    //     i++) {
    //   LoginValues loginValues = widget
    //       .loginSuccessModel.staffmobileappprivileges!.values!
    //       .elementAt(i);
    //   // if () {
    //   values.add(loginValues);
    //   // }

    // }
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffold,
        // appBar: AppBar(
        //   centerTitle: true,
        //   leading: IconButton(
        //     icon: SvgPicture.asset('assets/svg/menu.svg'),
        //     onPressed: () {
        //       _scaffold.currentState!.openDrawer();
        //     },
        //   ),
        //   title: const Text("Dashboard"),
        //   actions: [
        //     IconButton(
        //       onPressed: () {},
        //       icon: SvgPicture.asset(
        //         'assets/svg/bell.svg',
        //       ),
        //     ),
        //     const SizedBox(
        //       width: 6.0,
        //     ),
        //   ],
        // ),
        //drawer: Drawer(),
        // body: SingleChildScrollView(
        //   padding: const EdgeInsets.all(16.0),
        //   child: HomeTab(
        //     loginSuccessModel: widget.loginSuccessModel,
        //     mskoolController: widget.mskoolController,
        //   ),
        // ),

        body: Obx(() {
          return PageView.builder(
            controller: pageController,
            itemBuilder: (_, index) {
              logger.d(homeViewPage.length);
              return homeViewPage.elementAt(index);
            },
            itemCount: homeViewPage.length,
            onPageChanged: (e) {
              pageNumber.value = e;
            },
          );
        }),
        bottomNavigationBar: Obx(() {
          return SizedBox(
            height: 60,
            child: BottomNavigationBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              type: BottomNavigationBarType.fixed,
              onTap: (e) {
                pageNumber.value = e;
                pageController.animateToPage(e,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn);
              },
              currentIndex: pageNumber.value,
              selectedItemColor: Theme.of(context).primaryColor,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svg/home.svg',
                      color: Colors.grey.shade600,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/home.svg',
                      color: Theme.of(context).primaryColor,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.message_outlined,
                      color: Colors.grey.shade600,
                    ),
                    activeIcon: Icon(
                      Icons.message_outlined,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: 'Interaction'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svg/calendar.svg',
                      height: 24,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/calendar.svg',
                      height: 24,
                      color: Theme.of(context).primaryColor,
                    ),
                    label: 'COE'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'assets/svg/profile.svg',
                      color: Colors.grey.shade600,
                    ),
                    activeIcon: SvgPicture.asset(
                      'assets/svg/profile.svg',
                      color: Theme.of(context).primaryColor,
                    ),
                    label: 'Profile'),
              ],
            ),
          );
        }));
  }
}

class HomeTab extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;

  const HomeTab({
    Key? key,
    required this.loginSuccessModel,
    required this.mskoolController,
  }) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
        title: const Text("Dashboard"),
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
      drawer: Drawer(),
      body: SingleChildScrollView(
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
                    padding: const EdgeInsets.all(24.0),
                    height: Get.height * 0.2,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
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
                        Expanded(flex: 3, child: const SizedBox()),
                      ],
                    ),
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 16 / 9,
                  autoPlay: true,
                  initialPage: 0,
                  viewportFraction: 1,
                  enlargeCenterPage: true,
                  enableInfiniteScroll: true,
                ),
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            Text(
              "Dashboard",
              style: Theme.of(context).textTheme.titleMedium!.merge(
                    const TextStyle(fontSize: 20.0),
                  ),
            ),
            const SizedBox(
              height: 16.0,
            ),

            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget
                    .loginSuccessModel.staffmobileappprivileges!.values!.length,
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
                                loginSuccessModel: widget.loginSuccessModel,
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
                                loginSuccessModel: widget.loginSuccessModel,
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
                                asmayId: widget.loginSuccessModel.asmaYId!,
                                asmtId: widget.loginSuccessModel.amsTId!,
                                base: base,
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
                                loginSuccessModel: widget.loginSuccessModel,
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
                              return const TimeTableHome();
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
                                loginSuccessModel: widget.loginSuccessModel,
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
                                loginSuccessModel: widget.loginSuccessModel,
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
                                loginSuccessModel: widget.loginSuccessModel,
                                mskoolController: widget.mskoolController,
                              );
                            },
                          ),
                        );
                        return;
                      }
                    },
                    title: Text(widget
                        .loginSuccessModel.staffmobileappprivileges!.values!
                        .elementAt(index)
                        .pagename!),
                  );
                }),

            // GridView.builder(
            //   shrinkWrap: true,
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: dashBoard.length,
            //   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 2,
            //     mainAxisSpacing: 8.0,
            //     crossAxisSpacing: 4.0,
            //     mainAxisExtent: 85,
            //   ),
            //   itemBuilder: (_, index) {
            //     // LoginValues val = values.elementAt(index);

            //     // String pageName = val.pagename!.toLowerCase();
            //     // if (pageName == "student attendance") {
            //     //   pageName = "Attendance";
            //     // } else if (pageName == "fee details") {
            //     //   return const SizedBox();
            //     // }
            //     return InkWell(
            //       onTap: () {
            //         String category =
            //             dashBoard.elementAt(index).title.toLowerCase();
            //         if (category == "attendance") {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) {
            //                 return const AttendanceHomeScreen();
            //               },
            //             ),
            //           );
            //           return;
            //         }

            //         if (category == "exam") {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) {
            //                 return const ExamHome();
            //               },
            //             ),
            //           );
            //           return;
            //         }

            //         if (category == "task") {
            //           return;
            //         }

            //         if (category == "coe") {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) {
            //                 return const CoeHome();
            //               },
            //             ),
            //           );
            //           return;
            //         }

            //         if (category == "library") {
            //           String base = baseUrlFromInsCode(
            //               "portal", widget.mskoolController);
            //           // debugPrint(base);
            //           // debugPrint("Miid -> ${widget.loginSuccessModel.mIID}");
            //           // debugPrint(
            //           //     "asmayId -> ${widget.loginSuccessModel.asmaYId}");
            //           // debugPrint(
            //           //     "amstId -> ${widget.loginSuccessModel.amsTId}");
            //           if (base.isEmpty) {
            //             return;
            //           }
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) {
            //                 return LibraryHome(
            //                   miId: widget.loginSuccessModel.mIID!,
            //                   asmayId: widget.loginSuccessModel.asmaYId!,
            //                   asmtId: widget.loginSuccessModel.amsTId!,
            //                   base: base,
            //                 );
            //               },
            //             ),
            //           );
            //           return;
            //         }
            //         if (category == "timetable") {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) {
            //                 return const TimeTableHome();
            //               },
            //             ),
            //           );
            //           return;
            //         }
            //         if (category == "noticeboard") {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) {
            //                 return const NoticeHome();
            //               },
            //             ),
            //           );
            //           return;
            //         }
            //         if (category == "apply certificate") {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) {
            //                 return CertificateHomeScreen(
            //                   loginSuccessModel: widget.loginSuccessModel,
            //                   mskoolController: widget.mskoolController,
            //                 );
            //               },
            //             ),
            //           );
            //           return;
            //         }

            //         if (category == "feedback") {
            //           Navigator.push(
            //             context,
            //             MaterialPageRoute(
            //               builder: (_) {
            //                 return const FeedBackHome();
            //               },
            //             ),
            //           );
            //           return;
            //         }
            //       },
            //       child: Container(
            //         height: 85,
            //         decoration: BoxDecoration(
            //             borderRadius: BorderRadius.circular(12.0)),
            //         child: Stack(
            //           children: [
            //             SizedBox(
            //               width: double.infinity,
            //               height: 85,
            //               child: ClipRRect(
            //                 borderRadius: BorderRadius.circular(12.0),
            //                 child: SvgPicture.asset(
            //                   dashBoard.elementAt(index).assetLoc,
            //                   fit: BoxFit.cover,
            //                 ),
            //               ),
            //             ),
            //             Align(
            //               alignment: Alignment.bottomRight,
            //               child: Padding(
            //                 padding: const EdgeInsets.all(16.0),
            //                 child: Column(
            //                   mainAxisAlignment: MainAxisAlignment.end,
            //                   crossAxisAlignment: CrossAxisAlignment.end,
            //                   children: [
            //                     Text(
            //                       dashBoard.elementAt(index).title,
            //                       style: Theme.of(context)
            //                           .textTheme
            //                           .titleSmall!
            //                           .merge(
            //                             const TextStyle(
            //                               fontWeight: FontWeight.w600,
            //                               color: Colors.white,
            //                             ),
            //                           ),
            //                     )
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
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
