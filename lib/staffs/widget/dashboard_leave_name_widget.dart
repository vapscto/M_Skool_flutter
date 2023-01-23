import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/staffs/model/dashboard_leave_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class DashboardLeaveNames extends StatelessWidget {
  final int backgroundColor;
  final DashboardLeaveModelValues values;
  const DashboardLeaveNames(
      {super.key, required this.backgroundColor, required this.values});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.4,
      child: InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (_) {
          //   return const ApplyForLeave();
          // }));
        },
        child: CustomContainer(
            child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircularProgressIndicator(
                    value: (values.hRELSTotalLeaves! /
                            values.hRELSCBLeaves!.toDouble())
                        .toDouble(),
                    backgroundColor: noticeBackgroundColor
                        .elementAt(backgroundColor)
                        .withOpacity(0.8),
                    color: noticeColor.elementAt(backgroundColor),
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        values.hRMLLeaveCode!.toLowerCase() == "sl"
                            ? "assets/svg/medication.svg"
                            : values.hRMLLeaveCode!.toLowerCase() == "cl"
                                ? "assets/svg/casual_leave.svg"
                                : "assets/svg/earned_leaves.svg",
                        color: noticeColor.elementAt(backgroundColor),
                      )),
                ],
              ),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${values.hRELSTotalLeaves!.toInt()}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "${values.hRMLLeaveName}",
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
