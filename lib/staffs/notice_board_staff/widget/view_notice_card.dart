import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/hw_cw_content_item.dart';
import 'package:m_skool_flutter/staffs/punch_report/widget/punch_report_item.dart';

class ViewNoticeCard extends StatelessWidget {
  const ViewNoticeCard({
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
                  height: 6.0,
                ),
                Text(
                  'Notice Type',
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
                  'Our school is going to celebrate the annual day on 19th October - 21st October, 20XX and the timings would be 9:00 am to 4:30 pm. Students from VI to X are invited to participate in the events. The programme is held in our school auditorium. All the students of our school are invited to attend this programme Read more..',
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
                      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
                ),
                const SizedBox(
                  height: 12.0,
                ),
                PunchReportItem(
                  title: "End Date",
                  time:
                      "${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}",
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
                    onDownloadClicked: () {}, title: "Grammer.pdf", isPdf: true)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
