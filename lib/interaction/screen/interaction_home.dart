import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/interaction/screen/all_tab.dart';
import 'package:m_skool_flutter/interaction/screen/compose_tab.dart';
import 'package:m_skool_flutter/interaction/screen/inbox_tab.dart';
import 'package:m_skool_flutter/interaction/screen/unread_tab.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';

import '../../widget/custom_back_btn.dart';
import '../widget/custom_tab_bar.dart';

class InteractionHomeScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const InteractionHomeScreen(
      {required this.loginSuccessModel,
      required this.mskoolController,
      super.key});

  @override
  State<InteractionHomeScreen> createState() => _InteractionHomeScreenState();
}

class _InteractionHomeScreenState extends State<InteractionHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(
        initialIndex: 0,
        length: 4,
        vsync: this,
        animationDuration: const Duration(milliseconds: 300));
    super.initState();
  }

  List<CustomTab> tabs = const [
    CustomTab(name: "Compose", asset: "edit.svg"),
    CustomTab(name: "Inbox", asset: "inbox.svg"),
    CustomTab(name: "All", asset: "layersall.svg"),
    CustomTab(name: "Unread", asset: "unread.svg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 30,
        title: Text("interaction".tr),
        leading: const CustomGoBackButton(),
      ),
      body: Column(children: [
        CustomTabBar(
          tabs: tabs,
          tabController: _tabController,
        ),
        Expanded(
          child: TabBarView(controller: _tabController, children: const [
            ComposeTabScreen(),
            InboxTabScreen(),
            AllTabScreen(),
            UnReadTabScreen()
          ]),
        )
      ]),
    );
  }
}
