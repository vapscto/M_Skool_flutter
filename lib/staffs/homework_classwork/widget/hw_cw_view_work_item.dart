import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/hw_cw_content_item.dart';
import 'package:m_skool_flutter/staffs/punch_report/widget/punch_report_item.dart';

class HwCwViewWorkItem extends StatelessWidget {
  const HwCwViewWorkItem({
    Key? key,
    required this.color,
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
                    const Icon(
                      Icons.circle,
                      color: Colors.green,
                      size: 20.0,
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Text(
                      "Active",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.green)),
                    ),
                  ],
                ),
                PopupMenuButton(itemBuilder: (_) {
                  return [
                    PopupMenuItem(
                      child: const Text("Active"),
                      onTap: () {},
                    ),
                    PopupMenuItem(
                      child: const Text("Deactive"),
                      onTap: () {},
                    )
                  ];
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
                      "02 Nov to 08 Nov",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                          TextStyle(color: noticeColor.elementAt(color))),
                    )),
                const SizedBox(
                  height: 12.0,
                ),
                const PunchReportItem(
                  title: "Subject",
                  time: "Subject will come here",
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const PunchReportItem(
                  title: "Topic",
                  time: "Topic will come here",
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const PunchReportItem(
                  title: "Chapter",
                  time: "Chapter will come here",
                ),
                const SizedBox(
                  height: 12.0,
                ),
                const PunchReportItem(
                  title: "Content",
                  time: "Content will come here",
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
                    title: "Eye Diagram.png",
                    isPdf: false)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
