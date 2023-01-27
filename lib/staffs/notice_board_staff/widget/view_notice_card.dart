import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/hw_cw_content_item.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/api/active_deactive_nb.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/api/get_attachment_api.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/model/nb_attachment_model.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/model/view_notice_data_model.dart';
import 'package:m_skool_flutter/staffs/punch_report/widget/punch_report_item.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class ViewNoticeCard extends StatelessWidget {
  final ViewNoticeDetailsModelValuesValues values;
  final String base;
  final int miId;
  final Function() func;
  const ViewNoticeCard({
    Key? key,
    required this.color,
    required this.values,
    required this.base,
    required this.func,
    required this.miId,
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
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .merge(TextStyle(
                            fontWeight: FontWeight.w600,
                            color: values.intBActiveFlag == true
                                ? Colors.green
                                : Colors.grey.shade400,
                          )),
                    ),
                  ],
                ),
                PopupMenuButton(itemBuilder: (_) {
                  List<PopupMenuEntry> entries = [];
                  if (values.intBActiveFlag == true) {
                    entries.add(PopupMenuItem(
                      child: const Text("Deactive"),
                      onTap: () async {
                        await ActivateDeactivateNbApi.instance
                            .activateDeactivate(
                                base: base,
                                intBId: values.intBId!,
                                flag: false,
                                miId: miId);
                        func();
                      },
                    ));
                  } else {
                    entries.add(
                      PopupMenuItem(
                        child: const Text("Active"),
                        onTap: () async {
                          await ActivateDeactivateNbApi.instance
                              .activateDeactivate(
                                  base: base,
                                  intBId: values.intBId!,
                                  flag: true,
                                  miId: miId);
                          func();
                          func();
                        },
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
                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return Dialog(
                                  insetPadding: const EdgeInsets.all(16.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 16.0),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Attachment's",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .merge(
                                                    const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18.0),
                                                  ),
                                            ),
                                            IconButton(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                visualDensity:
                                                    const VisualDensity(
                                                        horizontal:
                                                            VisualDensity
                                                                .minimumDensity,
                                                        vertical: VisualDensity
                                                            .minimumDensity),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                      FutureBuilder<
                                              List<NBAttachmentModelValues>>(
                                          future: GetNbAttachmentApi.instance
                                              .getNbAtt(
                                            intbId: values.intBId!,
                                            base: base,
                                          ),
                                          builder: (_, snapshot) {
                                            if (snapshot.hasData) {
                                              return ListView.separated(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  shrinkWrap: true,
                                                  itemBuilder: (_, index) {
                                                    return HwCwContentItem(
                                                        onDownloadClicked:
                                                            () {},
                                                        title: snapshot.data!
                                                            .elementAt(index)
                                                            .intbfLFileName!,
                                                        isPdf: true);
                                                  },
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return const SizedBox(
                                                      height: 12.0,
                                                    );
                                                  },
                                                  itemCount:
                                                      snapshot.data!.length);
                                            }
                                            if (snapshot.hasError) {
                                              return ErrWidget(
                                                  err: snapshot.error
                                                      as Map<String, dynamic>);
                                            }
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                AnimatedProgressWidget(
                                                  title: "Loading Attachment",
                                                  desc:
                                                      "We are loading attachment for this particular notice",
                                                  animationPath:
                                                      "assets/json/default.json",
                                                ),
                                              ],
                                            );
                                          }),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: CustomContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.attachment,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                const Expanded(
                                  child: Text("View Attachment"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(flex: 3, child: SizedBox())
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
