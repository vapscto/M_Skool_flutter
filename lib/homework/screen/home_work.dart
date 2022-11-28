import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/homework/api/home_work_api.dart';
import 'package:m_skool_flutter/homework/model/date_wise.dart';
import 'package:m_skool_flutter/homework/screen/hwcw_detail_screen.dart';
import 'package:m_skool_flutter/homework/widget/filtred_hw.dart';
import 'package:m_skool_flutter/information/controller/hwcwnb_controller.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class HomeWorkScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final HwCwNbController hwCwNbController;
  const HomeWorkScreen(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.hwCwNbController});

  @override
  State<HomeWorkScreen> createState() => _HomeWorkScreenState();
}

class _HomeWorkScreenState extends State<HomeWorkScreen> {
  final ScrollController listViewCtrl = ScrollController();
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
      showHw();
    }
    super.initState();
  }

  void showHw() async {
    await GetHomeWorkApi.instance.getHomeAssignment(
      miId: widget.loginSuccessModel.mIID!,
      amstId: widget.loginSuccessModel.amsTId!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      baseUrl: baseUrlFromInsCode("portal", widget.mskoolController),
      endDate: DateTime.now().toLocal().toString(),
      startDate: DateTime.now().toLocal().toString(),
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
    return Scaffold(
      body: Obx(() {
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
                      height: 16.0,
                    ),
                    Text(
                      getCurrentMonth(DateTime.now()),
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    SizedBox(
                        height: 100,
                        child: Obx(() {
                          return ListView.separated(
                            controller: listViewCtrl,

                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return Obx(() {
                                return Container(
                                  padding: const EdgeInsets.all(12.0),
                                  decoration: BoxDecoration(
                                      color: widget.hwCwNbController
                                                  .selectedIndex.value ==
                                              index
                                          ? Theme.of(context).primaryColor
                                          : Theme.of(context)
                                              .scaffoldBackgroundColor,
                                      borderRadius: BorderRadius.circular(30.0),
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
                                          widget.hwCwNbController.selectedIndex
                                              .value = index;

                                          await GetHomeWorkApi.instance
                                              .getHomeAssignment(
                                            miId:
                                                widget.loginSuccessModel.mIID!,
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
                                            startDate: widget.hwCwNbController
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
                                                  .titleMedium!
                                                  .merge(TextStyle(
                                                      color: widget
                                                                  .hwCwNbController
                                                                  .selectedIndex
                                                                  .value ==
                                                              index
                                                          ? Colors.white
                                                          : Theme.of(context)
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
                                                  .titleMedium!
                                                  .merge(TextStyle(
                                                      color: widget
                                                                  .hwCwNbController
                                                                  .selectedIndex
                                                                  .value ==
                                                              index
                                                          ? Colors.white
                                                          : Theme.of(context)
                                                              .textTheme
                                                              .titleMedium!
                                                              .color)),
                                            ),
                                          ],
                                        )),
                                  ),
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
                              ? const CustomPgrWidget(
                                  title: "Please wait",
                                  desc:
                                      "We are getting your homework, please wait while we do it for you")
                              : widget.hwCwNbController.homeWorkList.isEmpty
                                  ? Column(
                                      children: [
                                        SizedBox(
                                          height: Get.height * 0.2,
                                        ),
                                        Text(
                                          "No homework found",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium!
                                              .merge(const TextStyle(
                                                  fontSize: 20.0)),
                                        ),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                            "Hurray! We couldn't find any homework for this particular date. So Enjoy",
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelMedium!),
                                      ],
                                    )
                                  : ListView.separated(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemBuilder: (_, index) {
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
                                              );
                                            }));
                                          },
                                          child: HwCwItem(
                                            sub: widget
                                                .hwCwNbController.homeWorkList
                                                .elementAt(index)
                                                .ismSSubjectName!,
                                            topic: widget
                                                .hwCwNbController.homeWorkList
                                                .elementAt(index)
                                                .ihWAssignment!,
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
      }),
    );
  }

  String getCurrentMonth(DateTime dateTime) {
    return "${fullMonths.elementAt(dateTime.month - 1)}, ${dateTime.year}";
  }
}

class HwCwItem extends StatelessWidget {
  final String sub;
  final String topic;
  const HwCwItem({
    Key? key,
    required this.sub,
    required this.topic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: colors.elementAt(2).withOpacity(0.05),
        ),
        child: Row(
          children: [
            Container(
              height: 80,
              width: 10,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
            ),
            const SizedBox(
              width: 12.0,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sub,
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 17,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      topic,
                      maxLines: 2,
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
            Icon(
              Icons.chevron_right_outlined,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 12.0,
            )
          ],
        ),
      ),
    );
  }
}
