import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/classwork_view_work_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/homework_view_work_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/hw_cw_content_item.dart';
import 'package:m_skool_flutter/staffs/punch_report/widget/punch_report_item.dart';

class HwCwViewWorkItem extends StatelessWidget {
  final bool forHw;
  final ClassWorkViewWorkValues? classwork;
  final HomeWorkViewWorkValues? homeWork;
  const HwCwViewWorkItem({
    Key? key,
    required this.color,
    required this.forHw,
    this.classwork,
    this.homeWork,
  }) : super(key: key);

  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: lighterColor.elementAt(color),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: forHw
                          ? homeWork!.ihWActiveFlag!
                              ? Colors.green
                              : Colors.grey.shade400
                          : classwork!.icWActiveFlag!
                              ? Colors.green
                              : Colors.grey.shade400,
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      forHw
                          ? homeWork!.ihWActiveFlag!
                              ? "Active"
                              : "Deactive"
                          : classwork!.icWActiveFlag!
                              ? "Active"
                              : "Deactive",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .merge(TextStyle(
                            fontWeight: FontWeight.w600,
                            color: forHw
                                ? homeWork!.ihWActiveFlag!
                                    ? Colors.green
                                    : Colors.grey.shade400
                                : classwork!.icWActiveFlag!
                                    ? Colors.green
                                    : Colors.grey.shade400,
                          )),
                    ),
                  ],
                ),
                PopupMenuButton(itemBuilder: (_) {
                  List<PopupMenuEntry<dynamic>> menuList = [];
                  if (forHw) {
                    if (homeWork!.ihWActiveFlag!) {
                      menuList.add(PopupMenuItem(
                        child: const Text("Deactive"),
                        onTap: () {},
                      ));
                    } else {
                      menuList.add(PopupMenuItem(
                        child: const Text("Active"),
                        onTap: () {},
                      ));
                    }
                  } else {
                    if (classwork!.icWActiveFlag!) {
                      menuList.add(PopupMenuItem(
                        child: const Text("Deactive"),
                        onTap: () {},
                      ));
                    } else {
                      menuList.add(PopupMenuItem(
                        child: const Text("Active"),
                        onTap: () {},
                      ));
                    }
                  }

                  return menuList;
                })
              ],
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                    backgroundColor: hwCwViewWorkColor.elementAt(color),
                    label: Text(
                      forHw
                          ? getFormatedDate(DateTime.parse(homeWork!.ihWDate!))
                          : "${getFormatedDate(DateTime.parse(classwork!.icWFromDate!))} to ${getFormatedDate(DateTime.parse(classwork!.icWToDate!))}",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                          TextStyle(color: noticeColor.elementAt(color))),
                    )),
                const SizedBox(
                  height: 12.0,
                ),
                PunchReportItem(
                  title: "Subject",
                  time: forHw
                      ? homeWork!.ismSSubjectName!.toString()
                      : classwork!.ismSSubjectName!.toString(),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                PunchReportItem(
                  title: "Topic",
                  time: forHw
                      ? homeWork!.ihWTopic!.toString()
                      : classwork!.icWTopic!.toString(),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                PunchReportItem(
                  title: "Chapter",
                  time: forHw ? "N/A" : "${classwork!.icWAssignment} ",
                ),
                const SizedBox(
                  height: 12.0,
                ),
                PunchReportItem(
                  title: "Content",
                  time: forHw
                      ? "${homeWork!.ihWAssignment} "
                      : "${classwork!.icWContent}",
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const PunchReportItem(
                  title: "Url",
                  time: "Url will come here",
                ),
                const SizedBox(
                  height: 16.0,
                ),
                HwCwContentItem(
                    onDownloadClicked: () {},
                    title: "View Attachment's",
                    isPdf: false)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
