import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/manager/overall_fee/tabs/classwise_fee_details.dart';
import 'package:m_skool_flutter/manager/overall_fee/tabs/fee_details.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/student/fees/model/feeModel.dart';
import 'package:m_skool_flutter/student/interaction/widget/custom_tab_bar.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class OverallFeeHome extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final String title;
  const OverallFeeHome(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.title});

  @override
  State<OverallFeeHome> createState() => _OverallFeeHomeState();
}

class _OverallFeeHomeState extends State<OverallFeeHome>
    with SingleTickerProviderStateMixin {
  TabController? overallFeeTabController;

  @override
  void initState() {
    overallFeeTabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: CustomTabBar(
              tabController: overallFeeTabController!,
              tabs: const [
                CustomTab(
                    name: "Fee Details", asset: "assets/svg/calendar.svg"),
                CustomTab(
                    name: "Classwise Fee Details",
                    asset: "assets/svg/calendar.svg"),
              ],
            ),
          ),
        ),
      ).getAppBar(),
      body: TabBarView(
        controller: overallFeeTabController!,
        children: const [
          ManagerFeeDetails(),
          ManagerClassWiseFeeDetails(),
        ],
      ),
    );
  }
}
