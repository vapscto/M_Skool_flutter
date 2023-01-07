import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/interaction/tabs/compose_tab_staff.dart';
import 'package:m_skool_flutter/staffs/interaction/tabs/inbox_tab_staff.dart';
import 'package:m_skool_flutter/student/interaction/widget/custom_tab_bar.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';

class InteractionHome extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final bool showAppBar;
  const InteractionHome(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      this.showAppBar = true});

  @override
  State<InteractionHome> createState() => _InteractionHomeState();
}

class _InteractionHomeState extends State<InteractionHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(
        initialIndex: 0,
        length: 2,
        vsync: this,
        animationDuration: const Duration(milliseconds: 300));

    super.initState();
  }

  List<CustomTab> tabs = const [
    CustomTab(name: "Compose", asset: "assets/svg/edit.svg"),
    CustomTab(name: "Inbox", asset: "assets/svg/inbox.svg"),
    // CustomTab(name: "All", asset: "layersall.svg"),
    // CustomTab(name: "Unread", asset: "assets/svg/unread.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.showAppBar)
          ? AppBar(
              elevation: 0,
              leadingWidth: 30,
              title: const Text("interaction"),
              leading: const CustomGoBackButton(),
            )
          : null,
      body: Column(children: [
        CustomTabBar(
          tabs: tabs,
          tabController: _tabController,
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: const [
            ComposeTabStaff(),
            InboxTabStaff(),
          ]),
        )
      ]),
    );
  }
}
