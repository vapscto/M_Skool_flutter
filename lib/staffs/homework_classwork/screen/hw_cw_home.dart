import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/tabs/assign_work.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/tabs/view_work.dart';
import 'package:m_skool_flutter/student/interaction/widget/custom_tab_bar.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class HwCwHome extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final String title;
  final bool forHw;
  const HwCwHome({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
    required this.title,
    required this.forHw,
  });

  @override
  State<HwCwHome> createState() => _HwCwHomeState();
}

class _HwCwHomeState extends State<HwCwHome>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: widget.title,
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 55),
            child: Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: CustomTabBar(tabController: tabController!, tabs: const [
                CustomTab(
                    name: "AssignWork", asset: "assets/svg/file-text.svg"),
                CustomTab(name: "ViewWork", asset: "assets/svg/eye_svg.svg"),
              ]),
            ),
          )).getAppBar(),
      body: TabBarView(
        controller: tabController,
        children: const [
          HwCwAssignWork(),
          HwCwViewWork(),
        ],
      ),
    );
  }
}
