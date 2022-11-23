import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/interaction/screen/all_tab.dart';
import 'package:m_skool_flutter/interaction/screen/compose_tab.dart';
import 'package:m_skool_flutter/interaction/screen/inbox_tab.dart';
import 'package:m_skool_flutter/interaction/screen/unread_tab.dart';

import '../../widget/custom_back_btn.dart';
import '../widget/custom_tab_bar.dart';

class InteractionHomeScreen extends StatefulWidget {
  const InteractionHomeScreen({super.key});

  @override
  State<InteractionHomeScreen> createState() => _InteractionHomeScreenState();
}

class _InteractionHomeScreenState extends State<InteractionHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(initialIndex: 0, length: 4, vsync: this);
    super.initState();
  }

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
        CustomTabBar(onTabSelect: (value) => _tabController.animateTo(value)),
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

  Widget tab(String title, String asset, int isCurrentPage) {
    return Tab(
      height: 40,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _tabController.index == isCurrentPage
              ? SvgPicture.asset('assets/svg/$asset', width: 12, height: 12)
              : const SizedBox(),
          const SizedBox(
            width: 6.0,
          ),
          AutoSizeText(
            title,
            style: Theme.of(context).textTheme.titleSmall!.merge(
                  TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                      fontSize:
                          _tabController.index == isCurrentPage ? 13.5 : 10,
                      color: _tabController.index != isCurrentPage
                          ? Colors.white
                          : Colors.black),
                ),
          ),
        ],
      ),
    );
  }
}
