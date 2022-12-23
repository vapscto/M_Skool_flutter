import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/homework/api/home_work_api.dart';
import 'package:m_skool_flutter/homework/api/update_hw_seen.dart';
import 'package:m_skool_flutter/homework/model/date_wise.dart';
import 'package:m_skool_flutter/homework/screen/hwcw_detail_screen.dart';
import 'package:m_skool_flutter/homework/widget/filtred_hw.dart';
import 'package:m_skool_flutter/information/controller/hwcwnb_controller.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class HomeWork extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final HwCwNbController hwCwNbController;
  const HomeWork(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.hwCwNbController});

  @override
  State<HomeWork> createState() => _HomeWorkState();
}

class _HomeWorkState extends State<HomeWork> {
  final ScrollController listViewCtrl = ScrollController();

  int color = -1;
  @override
  void initState() {
    DateTime endDate = DateTime.now();

    DateTime startDate = DateTime(
      endDate.month == 1 ? endDate.year - 1 : endDate.year,
      endDate.month == 1 ? 12 : endDate.month - 1,
      getMonthWithCount[endDate.month == 1 ? "12" : "${endDate.month - 1}"],
    );

    if (startDate.weekday == 7) {
      startDate = DateTime(startDate.year, startDate.month, startDate.day - 1);
    }
    DateWiseModel startBy = DateWiseModel(
        day: startDate.day,
        dayName: dayName["${startDate.weekday}"],
        date: startDate.toLocal().toString());

    widget.hwCwNbController.dateWiseModelList.clear();
    widget.hwCwNbController.dateWiseModelList.add(startBy);

    for (int i = 1; i <= endDate.day; i++) {
      widget.hwCwNbController.dateWiseModelList.add(
        DateWiseModel(
          day: i,
          dayName:
              dayName["${DateTime(endDate.year, endDate.month, i).weekday}"],
          date: DateTime(endDate.year, endDate.month, i).toLocal().toString(),
        ),
      );
    }
    widget.hwCwNbController.selectedIndex.value =
        widget.hwCwNbController.dateWiseModelList.length - 1;

    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        if (listViewCtrl.hasClients) {
          listViewCtrl.animateTo(listViewCtrl.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn);
        }
      },
    );

    if (widget.hwCwNbController.filter.value == 0) {
      showHw(
        DateTime.now(),
        DateTime.now(),
      );
    }
    super.initState();
  }

  DateTime startDt = DateTime.now();
  DateTime endDt = DateTime.now();
  void showHw(DateTime startDate, DateTime endDate) async {
    await GetHomeWorkApi.instance.getHomeAssignment(
      miId: widget.loginSuccessModel.mIID!,
      amstId: widget.loginSuccessModel.amsTId!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      baseUrl: baseUrlFromInsCode("portal", widget.mskoolController),
      endDate: endDate.toLocal().toString(),
      startDate: startDate.toLocal().toString(),
      hwCwNbController: widget.hwCwNbController,
    );
  }

  @override
  Widget build(BuildContext context) {
    // GetHomeWorkApi.instance.getHomeAssignment(
    //   miId: widget.loginSuccessModel.mIID!,
    //   amstId: widget.loginSuccessModel.amsTId!,
    //   asmayId: widget.loginSuccessModel.asmaYId!,
    //   baseUrl: baseUrlFromInsCode("portal", widget.mskoolController),
    //   endDate: '2022-11-23 00:00:00.000',
    //   startDate: '2022-11-23 00:00:00.000',
    // );
    return Obx(
      () {
        return widget.hwCwNbController.filter.value > 0
            ? FiltredHw(
                hwCwNbController: widget.hwCwNbController,
                loginSuccessModel: widget.loginSuccessModel,
                mskoolController: widget.mskoolController)
            : SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      getCurrentMonth(DateTime.now()),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    SizedBox(
                        height: 120,
                        child: Obx(() {
                          return ListView.separated(
                            controller: listViewCtrl,

                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(() {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 8.0),
                                      height: widget.hwCwNbController
                                                  .selectedIndex.value ==
                                              index
                                          ? 90
                                          : 80,
                                      padding: widget.hwCwNbController
                                                  .selectedIndex.value ==
                                              index
                                          ? const EdgeInsets.all(12.0)
                                          : const EdgeInsets.all(8.0),
                                      decoration: BoxDecoration(
                                          color: widget.hwCwNbController
                                                      .selectedIndex.value ==
                                                  index
                                              ? Theme.of(context).primaryColor
                                              : Theme.of(context)
                                                  .scaffoldBackgroundColor,
                                          borderRadius:
                                              BorderRadius.circular(30.0),
                                          boxShadow: const [
                                            BoxShadow(
                                              offset: Offset(0, 1),
                                              blurRadius: 4,
                                              color: Colors.black12,
                                            )
                                          ]),
                                      child: SizedBox(
                                        width: 36.0,
                                        child: InkWell(
                                            onTap: () async {
                                              widget.hwCwNbController
                                                  .selectedIndex.value = index;
                                              startDt = DateTime.parse(widget
                                                  .hwCwNbController
                                                  .dateWiseModelList
                                                  .elementAt(index)
                                                  .date);
                                              endDt = DateTime.parse(widget
                                                  .hwCwNbController
                                                  .dateWiseModelList
                                                  .elementAt(index)
                                                  .date);
                                              await GetHomeWorkApi.instance
                                                  .getHomeAssignment(
                                                miId: widget
                                                    .loginSuccessModel.mIID!,
                                                amstId: widget
                                                    .loginSuccessModel.amsTId!,
                                                asmayId: widget
                                                    .loginSuccessModel.asmaYId!,
                                                baseUrl: baseUrlFromInsCode(
                                                    "portal",
                                                    widget.mskoolController),
                                                endDate: widget.hwCwNbController
                                                    .dateWiseModelList
                                                    .elementAt(index)
                                                    .date,
                                                startDate: widget
                                                    .hwCwNbController
                                                    .dateWiseModelList
                                                    .elementAt(index)
                                                    .date,
                                                hwCwNbController:
                                                    widget.hwCwNbController,
                                              );
                                            },
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  widget.hwCwNbController
                                                      .dateWiseModelList
                                                      .elementAt(index)
                                                      .day
                                                      .toString(),
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .merge(TextStyle(
                                                          color: widget
                                                                      .hwCwNbController
                                                                      .selectedIndex
                                                                      .value ==
                                                                  index
                                                              ? Colors.white
                                                              : Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .color)),
                                                ),
                                                const SizedBox(
                                                  height: 8.0,
                                                ),
                                                Text(
                                                  widget.hwCwNbController
                                                      .dateWiseModelList
                                                      .elementAt(index)
                                                      .dayName,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall!
                                                      .merge(TextStyle(
                                                          color: widget
                                                                      .hwCwNbController
                                                                      .selectedIndex
                                                                      .value ==
                                                                  index
                                                              ? Colors.white
                                                              : Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .titleMedium!
                                                                  .color)),
                                                ),
                                              ],
                                            )),
                                      ),
                                    ),
                                    // const SizedBox(
                                    //   height: 6.0,
                                    // ),
                                    Icon(
                                      Icons.circle,
                                      size: 8,
                                      color: widget.hwCwNbController
                                                  .selectedIndex.value ==
                                              index
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .scaffoldBackgroundColor,
                                    ),
                                  ],
                                );
                              });
                            },
                            // itemCount: DateTime.now()
                            //     .difference(DateTime(
                            //         DateTime.now().year, DateTime.now().month + 1, 1))
                            //     .inDays,
                            itemCount: widget
                                .hwCwNbController.dateWiseModelList.length,
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const SizedBox(
                                width: 12.0,
                              );
                            },
                          );
                        })),
                    const SizedBox(
                      height: 24.0,
                    ),

                    Obx(() {
                      return widget.hwCwNbController
                              .isErrorHappendInHomeWorkLoading.value
                          ? const ErrWidget(err: {
                              "errorTitle": "Unable to connect to server.",
                              "errorMsg":
                                  "Sorry! but we are unable to connect to server right now, Try again later",
                            })
                          : widget.hwCwNbController.isHomeWorkLoading.value
                              ? const AnimatedProgressWidget(
                                  animationPath: "assets/json/hwanim.json",
                                  title: "Please wait",
                                  desc:
                                      "We are getting your homework, please wait while we do it for you")
                              : widget.hwCwNbController.homeWorkList.isEmpty
                                  ? Column(
                                      children: [
                                        // SizedBox(
                                        //   height: Get.height * 0.2,
                                        // ),
                                        Image.asset(
                                          'assets/images/hw_cw_not.jpg',
                                          height: Get.height * 0.3,
                                        ),
                                        Text(
                                          "No homework found",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .merge(const TextStyle(
                                                  fontSize: 22.0)),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                            "Hurray! We couldn't find any homework for this particular date. So Enjoy",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall!
                                                .merge(const TextStyle(
                                                    letterSpacing: 0.2,
                                                    fontSize: 16))),
                                      ],
                                    )
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (_, index) {
                                        color += 1;
                                        if (index % 6 == 0) {
                                          color = 0;
                                        }
                                        if (color > 6) {
                                          color = 0;
                                        }

                                        return InkWell(
                                          onTap: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(builder: (_) {
                                              return HwCwDetailScreen(
                                                topic: widget.hwCwNbController
                                                    .homeWorkList
                                                    .elementAt(index)
                                                    .ihWTopic!,
                                                ihcId: widget.hwCwNbController
                                                    .homeWorkList
                                                    .elementAt(index)
                                                    .ihWId!,
                                                assignment: widget
                                                    .hwCwNbController
                                                    .homeWorkList
                                                    .elementAt(index)
                                                    .ihWAssignment!,
                                                date: widget.hwCwNbController
                                                    .homeWorkList
                                                    .elementAt(index)
                                                    .ihWDate!,
                                                subject: widget.hwCwNbController
                                                    .homeWorkList
                                                    .elementAt(index)
                                                    .ismSSubjectName!,
                                                attachmentUrl: widget
                                                    .hwCwNbController
                                                    .homeWorkList
                                                    .elementAt(index)
                                                    .ihWAttachment,
                                                attachmentType: widget
                                                            .hwCwNbController
                                                            .homeWorkList
                                                            .elementAt(index)
                                                            .ihWFilePath ==
                                                        null
                                                    ? null
                                                    : widget.hwCwNbController
                                                            .homeWorkList
                                                            .elementAt(index)
                                                            .ihWFilePath!
                                                            .endsWith(".pdf")
                                                        ? "PDF"
                                                        : "OTHERS",
                                                attachmentName: widget
                                                    .hwCwNbController
                                                    .homeWorkList
                                                    .elementAt(index)
                                                    .ihWFilePath,
                                                loginSuccessModel:
                                                    widget.loginSuccessModel,
                                                mskoolController:
                                                    widget.mskoolController,
                                                screenType: 'homework',
                                              );
                                            })).then((value) {
                                              if (value == null) {}
                                              if (widget.hwCwNbController
                                                      .homeWorkList
                                                      .elementAt(index)
                                                      .iHWUPLViewedFlg ==
                                                  1) {
                                                return;
                                              }
                                              showHw(startDt, endDt);
                                            });
                                            if (widget.hwCwNbController
                                                    .homeWorkList
                                                    .elementAt(index)
                                                    .iHWUPLViewedFlg ==
                                                1) {
                                              return;
                                            }

                                            UpdateHwSeenApi.instance.markAsSeen(
                                                amstId: widget
                                                    .loginSuccessModel.amsTId!,
                                                miId: widget
                                                    .loginSuccessModel.mIID!,
                                                asmayId: widget
                                                    .loginSuccessModel.asmaYId!,
                                                userId: widget
                                                    .loginSuccessModel.userId!,
                                                roleId: widget
                                                    .loginSuccessModel.roleId!,
                                                flag: "Homework",
                                                ihwId: widget.hwCwNbController
                                                    .homeWorkList
                                                    .elementAt(index)
                                                    .ihWId!,
                                                asmclId: widget.hwCwNbController
                                                    .homeWorkList
                                                    .elementAt(index)
                                                    .asmcLId!,
                                                asmsId: widget.hwCwNbController
                                                    .homeWorkList
                                                    .elementAt(index)
                                                    .asmSId!,
                                                base: baseUrlFromInsCode(
                                                    "portal",
                                                    widget.mskoolController));
                                          },
                                          child: HwCwItem(
                                            isRead: widget.hwCwNbController
                                                        .homeWorkList
                                                        .elementAt(index)
                                                        .iHWUPLViewedFlg ==
                                                    1
                                                ? true
                                                : false,
                                            sub: widget
                                                .hwCwNbController.homeWorkList
                                                .elementAt(index)
                                                .ismSSubjectName!,
                                            topic: widget
                                                .hwCwNbController.homeWorkList
                                                .elementAt(index)
                                                .ihWAssignment!,
                                            color: noticeColor.elementAt(color),
                                          ),
                                        );
                                      },
                                      separatorBuilder: (_, index) {
                                        return const SizedBox(
                                          height: 16.0,
                                        );
                                      },
                                      itemCount: widget.hwCwNbController
                                          .homeWorkList.length);
                    }),
                    // InkWell(
                    //   onTap: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (_) {
                    //       return const HwCwDetailScreen(
                    //         topic: '',
                    //         assignment: '',
                    //         date: '',
                    //         subject: '',
                    //       );
                    //     }));
                    //   },
                    //   child: const HwCwItem(
                    //     sub: "",
                    //     topic: "",
                    //   ),
                    // ),
                  ],
                ),
              );
      },
    );
  }

  String getCurrentMonth(DateTime dateTime) {
    return "${fullMonths.elementAt(dateTime.month - 1)}, ${dateTime.year}";
  }
}

class HwCwItem extends StatelessWidget {
  final bool isRead;
  final String sub;
  final String topic;
  final Color color;
  const HwCwItem({
    Key? key,
    required this.sub,
    required this.topic,
    required this.isRead,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        height: 90,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          //color: colors.elementAt(2).withOpacity(0.05),
        ),
        child: Row(
          children: [
            // Container(
            //   height: 80,
            //   width: 10,
            //   decoration: BoxDecoration(
            //     color: isRead ? Colors.grey.shade600 : Colors.green,
            //     borderRadius: const BorderRadius.only(
            //       topLeft: Radius.circular(12.0),
            //       bottomLeft: Radius.circular(12.0),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   width: 12.0,
            // ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Chip(
                    //   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    //   backgroundColor: color.withOpacity(0.3),
                    //   avatar: Image.asset(
                    //     getIconFromSubject(sub.trim().toLowerCase()),
                    //     color: color,
                    //     height: 24.0,
                    //   ),
                    //   label: Text(
                    //     sub.capitalizeFirst!,
                    //     style: Theme.of(context).textTheme.titleSmall!.merge(
                    //           TextStyle(
                    //             fontWeight: FontWeight.w500,
                    //             fontSize: 15,
                    //             color: color,
                    //           ),
                    //         ),
                    //   ),
                    // ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 6.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: getIconFromSubject(
                              sub.trim().toLowerCase())['chipBgColor']),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            getIconFromSubject(
                                sub.trim().toLowerCase())['icon'],
                            color: getIconFromSubject(
                                sub.trim().toLowerCase())['chipColor'],
                            height: 24.0,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            sub.capitalizeFirst!,
                            style:
                                Theme.of(context).textTheme.labelMedium!.merge(
                                      TextStyle(
                                          fontSize: 14.0,
                                          color: getIconFromSubject(sub
                                              .trim()
                                              .toLowerCase())['chipColor']),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    // const SizedBox(
                    //   height: .0,
                    // ),
                    Text(
                      topic,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelSmall!.merge(
                            TextStyle(
                                fontWeight: FontWeight.w400,
                                letterSpacing: 0.2,
                                color: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .color,
                                fontSize: 16),
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            // Icon(
            //   Icons.chevron_right_outlined,
            //   color: Theme.of(context).primaryColor,
            // ),
            // const SizedBox(
            //   width: 12.0,
            // )

            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  // width: 48.0,
                  // height: 24.0,
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(16.0),
                        bottomLeft: Radius.circular(12.0),
                      ),
                      color: Theme.of(context).primaryColor),
                  child: const Icon(
                    Icons.chevron_right_outlined,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.done_all,
                  color: isRead ? Colors.green : Colors.grey.shade600,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
