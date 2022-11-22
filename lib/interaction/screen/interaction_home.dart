import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/interaction/screen/all_tab.dart';
import 'package:m_skool_flutter/interaction/screen/compose_tab.dart';
import 'package:m_skool_flutter/interaction/screen/inbox_tab.dart';
import 'package:m_skool_flutter/interaction/screen/unread_tab.dart';

import '../../widget/custom_back_btn.dart';

class InteractionHomeScreen extends StatefulWidget {
  const InteractionHomeScreen({super.key});

  @override
  State<InteractionHomeScreen> createState() => _InteractionHomeScreenState();
}

class _InteractionHomeScreenState extends State<InteractionHomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final tabNotifier = ValueNotifier<int>(0);
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
        ValueListenableBuilder(
            valueListenable: tabNotifier,
            builder: (context, value, c) {
              return Material(
                color: Theme.of(context).primaryColor,
                child: TabBar(
                    onTap: (index) => tabNotifier.value = index,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    controller: _tabController,
                    unselectedLabelColor: Colors.white,
                    labelColor: Colors.black,
                    indicator: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                      color: Colors.white,
                    ),
                    tabs: [
                      tab("Compose", "compose.svg", 0),
                      tab("Index", "compose.svg", 1),
                      tab("All", "compose.svg", 2),
                      tab("Unread", "compose.svg", 3)
                    ]),
              );
            }),
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
            width: 4.0,
          ),
          AutoSizeText(
            title,
            style: Theme.of(context).textTheme.titleSmall!.merge(
                  TextStyle(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.1,
                      fontSize: 13.5,
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
