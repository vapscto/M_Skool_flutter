import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/api/staff_dashboard_api.dart';
import 'package:m_skool_flutter/staffs/coe/screens/coe_home.dart';
import 'package:m_skool_flutter/staffs/controller/dashboard_controller.dart';
import 'package:m_skool_flutter/staffs/interaction/screen/interaction_home.dart';
import 'package:m_skool_flutter/staffs/tabs/dashboard_tab.dart';
import 'package:m_skool_flutter/staffs/tabs/staff_profile_tab.dart';
import 'package:m_skool_flutter/staffs/widget/drawer_widget.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../controller/global_utilities.dart';

class StaffHomeScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const StaffHomeScreen(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreen();
}

class _StaffHomeScreen extends State<StaffHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  final RxList<Widget> homeList = <Widget>[].obs;
  int color = -1;
  int ttColor = -1;
  final StaffDashboardController dashboardController =
      Get.put(StaffDashboardController());
  final PageController controller = PageController(initialPage: 0);

  @override
  void initState() {
    homeList.add(
      Dashboard(
        mskoolController: widget.mskoolController,
        dashboardController: dashboardController,
        loginSuccessModel: widget.loginSuccessModel,
      ),
    );
    homeList.add(
      InteractionHome(
        mskoolController: widget.mskoolController,
        //dashboardController: dashboardController,
        loginSuccessModel: widget.loginSuccessModel,
        showAppBar: false,
      ),
    );
    homeList.add(
      StaffCoeHome(
        mskoolController: widget.mskoolController,
        // dashboardController: dashboardController,
        loginSuccessModel: widget.loginSuccessModel, title: 'COE',
        showAppBar: false,
      ),
    );
    homeList.add(StaffProfileTab(
        loginSuccessModel: widget.loginSuccessModel,
        mskoolController: widget.mskoolController));

    StaffDashboardApi.instance.loadDashboard(
        miId: widget.loginSuccessModel.mIID!,
        userId: widget.loginSuccessModel.userId!,
        base: baseUrlFromInsCode("portal", widget.mskoolController),
        controller: dashboardController);

    super.initState();
  }

  @override
  void dispose() {
    Get.delete<StaffDashboardController>();
    controller.dispose();
    super.dispose();
  }

  RxInt index = RxInt(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffold,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Obx(() {
          return Text(index.value == 0
              ? "Dashboard"
              : index.value == 1
                  ? "Interaction"
                  : index.value == 2
                      ? "COE"
                      : "Profile");
        }),
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/menu.svg'),
          onPressed: () {
            _scaffold.currentState!.openDrawer();
          },
        ),
      ),
      drawer: Drawer(
        child: StaffDashboardDrawer(
          loginSuccessModel: widget.loginSuccessModel,
          mskoolController: widget.mskoolController,
        ),
      ),
      body: PageView.builder(
        controller: controller,
        itemBuilder: (_, index) {
          return homeList.elementAt(index);
        },
        itemCount: homeList.length,
        onPageChanged: (v) {
          index.value = v;
        },
      ),
      bottomNavigationBar: Material(
        elevation: 10.0,
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Obx(() {
          return SalomonBottomBar(
            currentIndex: index.value,
            items: [
              SalomonBottomBarItem(
                  unselectedColor: const Color(0xFFC0C0C0),
                  icon: SvgPicture.asset(
                    "assets/svg/home_icon.svg",
                    height: 24,
                    color: index.value == 0
                        ? Theme.of(context).primaryColor
                        : const Color(0xFFC0C0C0),
                  ),
                  title: const Text("Home")),
              SalomonBottomBarItem(
                  unselectedColor: const Color(0xFFC0C0C0),
                  icon: SvgPicture.asset(
                    "assets/svg/message.svg",
                    height: 24,
                    color: index.value == 1
                        ? Theme.of(context).primaryColor
                        : const Color(0xFFC0C0C0),
                  ),
                  title: const Text("Interaction")),
              SalomonBottomBarItem(
                  unselectedColor: const Color(0xFFC0C0C0),
                  icon: SvgPicture.asset(
                    "assets/svg/calendar.svg",
                    height: 26,
                    color: index.value == 2
                        ? Theme.of(context).primaryColor
                        : const Color(0xFFC0C0C0),
                  ),
                  title: const Text("COE")),
              SalomonBottomBarItem(
                  unselectedColor: const Color(0xFFC0C0C0),
                  icon: SvgPicture.asset(
                    "assets/svg/profile.svg",
                    height: 30,
                    color: index.value == 3
                        ? Theme.of(context).primaryColor
                        : const Color(0xFFC0C0C0),
                  ),
                  title: const Text("Profile")),
            ],
            onTap: (v) {
              index.value = v;
              controller.animateToPage(v,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastLinearToSlowEaseIn);
            },
          );
        }),
      ),
    );
  }
}
