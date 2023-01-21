import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/api/get_attachment_api.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/classwork_attachment_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/classwork_view_work_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/homework_attachment_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/homework_view_work_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/hw_cw_content_item.dart';
import 'package:m_skool_flutter/staffs/punch_report/widget/punch_report_item.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HwCwViewWorkItem extends StatelessWidget {
  final bool forHw;
  final ClassWorkViewWorkValues? classwork;
  final HomeWorkViewWorkValues? homeWork;
  final MskoolController mskoolController;
  const HwCwViewWorkItem({
    Key? key,
    required this.color,
    required this.forHw,
    this.classwork,
    this.homeWork,
    required this.mskoolController,
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
                    onDownloadClicked: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return Dialog(
                              child: forHw
                                  ? FutureBuilder<
                                          List<HomeWorkAttachmentModelValues>>(
                                      builder: (_, snapshot) {
                                      if (snapshot.hasData) {
                                        return ListView.separated(
                                            padding: const EdgeInsets.all(16.0),
                                            itemBuilder: (_, index) {
                                              return HwCwContentItem(
                                                  onDownloadClicked: () async {
                                                    if (await canLaunchUrl(
                                                        Uri.parse(snapshot.data!
                                                            .elementAt(index)
                                                            .ihwatTAttachment!))) {
                                                      await launchUrl(Uri.parse(
                                                          snapshot.data!
                                                              .elementAt(index)
                                                              .ihwatTAttachment!));
                                                    }
                                                  },
                                                  title: snapshot.data!
                                                      .elementAt(index)
                                                      .ihwatTFileName!,
                                                  isPdf: snapshot.data!
                                                      .elementAt(index)
                                                      .ihwatTFileName!
                                                      .endsWith(".pdf"));
                                            },
                                            separatorBuilder: (_, index) {
                                              return const SizedBox(
                                                height: 16.0,
                                              );
                                            },
                                            itemCount: snapshot.data!.length);
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
                                            title: "Loading Attachment's",
                                            desc:
                                                "Please wait while we are loading attachment's",
                                            animationPath:
                                                "assets/json/default.json",
                                          ),
                                        ],
                                      );
                                    })
                                  : FutureBuilder<
                                      List<ClassWorkAttachmentModelValues>>(
                                      future: GetAttachmentApi.instance
                                          .getClassWorkAttachment(
                                              icwId: classwork!.icWId!,
                                              base: baseUrlFromInsCode(
                                                  "portal", mskoolController)),
                                      builder: (_, snapshot) {
                                        if (snapshot.hasData) {
                                          return ListView.separated(
                                              itemBuilder: (_, index) {
                                                return HwCwContentItem(
                                                    onDownloadClicked:
                                                        () async {
                                                      if (await canLaunchUrl(
                                                          Uri.parse(snapshot
                                                              .data!
                                                              .elementAt(index)
                                                              .icwatTAttachment!))) {
                                                        await launchUrl(
                                                            Uri.parse(snapshot
                                                                .data!
                                                                .elementAt(
                                                                    index)
                                                                .icwatTAttachment!));
                                                      }
                                                    },
                                                    title: snapshot.data!
                                                        .elementAt(index)
                                                        .icwatTAttachment!,
                                                    isPdf: snapshot.data!
                                                        .elementAt(index)
                                                        .icwatTFileName!
                                                        .endsWith(".pdf"));
                                              },
                                              separatorBuilder: (_, index) {
                                                return const SizedBox(
                                                  height: 16.0,
                                                );
                                              },
                                              itemCount: snapshot.data!.length);
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
                                              title: "Loading Attachment's",
                                              desc:
                                                  "Please wait while we are loading attachment's",
                                              animationPath:
                                                  "assets/json/default.json",
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                            );
                          });
                    },
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
