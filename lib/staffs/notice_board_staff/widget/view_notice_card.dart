import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/model/view_notice_data_model.dart';
import 'package:m_skool_flutter/staffs/punch_report/widget/punch_report_item.dart';

class ViewNoticeCard extends StatelessWidget {
  final ViewNoticeDetailsModelValuesValues values;
  const ViewNoticeCard({
    Key? key,
    required this.color,
    required this.values,
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
                      color: values.intBActiveFlag == true
                          ? Colors.green
                          : Colors.grey.shade400,
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      values.intBActiveFlag == true ? "Active" : "Deactive",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green)),
                    ),
                  ],
                ),
                PopupMenuButton(itemBuilder: (_) {
                  List<PopupMenuEntry> entries = [];
                  if (values.intBActiveFlag == true) {
                    entries.add(PopupMenuItem(
                      child: const Text("Deactive"),
                      onTap: () {},
                    ));
                  } else {
                    entries.add(
                      PopupMenuItem(
                        child: const Text("Active"),
                        onTap: () {},
                      ),
                    );
                  }
                  return entries;
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
                    backgroundColor: noticeBackgroundColor.elementAt(color),
                    label: Text(
                      "${getFormatedDate(DateTime.parse(values.intBStartDate.toString())).substring(0, getFormatedDate(DateTime.parse(values.intBStartDate.toString())).length - 2).trim()} to ${getFormatedDate(DateTime.parse(values.intBEndDate.toString())).substring(0, getFormatedDate(DateTime.parse(values.intBEndDate.toString())).length - 2).trim()}",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                          TextStyle(color: noticeColor.elementAt(color))),
                    )),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  values.intBTitle.toString(),
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            letterSpacing: 0.2),
                      ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  values.intBDescription!,
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            letterSpacing: 0.2),
                      ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                PunchReportItem(
                  title: "Start Date",
                  time:
                      "${DateTime.parse(values.intBStartDate!).day}-${DateTime.parse(values.intBStartDate!).month}-${DateTime.parse(values.intBStartDate!).year}",
                ),
                const SizedBox(
                  height: 12.0,
                ),
                PunchReportItem(
                  title: "End Date",
                  time:
                      "${DateTime.parse(values.intBEndDate!).day}-${DateTime.parse(values.intBEndDate!).month}-${DateTime.parse(values.intBEndDate!).year}",
                ),
                const SizedBox(
                  height: 12.0,
                ),
                // const PunchReportItem(
                //   title: "Url",
                //   time: "Url will come here",
                // ),
                // const SizedBox(
                //   height: 16.0,
                // ),
                // HwCwContentItem(
                //     onDownloadClicked: () {}, title: "Grammer.pdf", isPdf: true)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
