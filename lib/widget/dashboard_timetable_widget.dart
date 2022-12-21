import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/model/student_dashboard_model.dart';
import 'package:m_skool_flutter/timetable/screens/time_table_home.dart';
import 'package:m_skool_flutter/widget/card_widget.dart';

class DashboardTimetable extends StatefulWidget {
  final TimeTableList timeTableList;
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const DashboardTimetable({
    super.key,
    required this.timeTableList,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<DashboardTimetable> createState() => _DashboardTimetableState();
}

class _DashboardTimetableState extends State<DashboardTimetable> {
  @override
  Widget build(BuildContext context) {
    return (widget.timeTableList.values!.isNotEmpty)
        ? CardWidget(
            padding: const EdgeInsets.all(8.0),
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Timetable",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => TimeTableHome(
                          loginSuccessModel: widget.loginSuccessModel,
                          mskoolController: widget.mskoolController));
                    },
                    child: Text(
                      "Know more",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              Text("${widget.timeTableList.values!.first.tTMDDayName}"),
              const SizedBox(
                height: 8,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(widget.timeTableList.values!.length,
                        (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 5.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: getDashBoardIconByName(widget
                                          .timeTableList
                                          .values![index]
                                          .iSMSSubjectName!
                                          .toLowerCase())
                                      .withOpacity(0.1),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 8.0,
                                    right: 8.0,
                                    top: 4,
                                    bottom: 4,
                                  ),
                                  child: Text(
                                      "${widget.timeTableList.values![index].iSMSSubjectName}"),
                                )),
                            SizedBox(
                              height: 30,
                              child: DottedLine(
                                dashColor: getDashBoardIconByName(widget
                                    .timeTableList
                                    .values![index]
                                    .iSMSSubjectName!
                                    .toLowerCase()),
                                lineThickness: 2,
                                direction: Axis.vertical,
                              ),
                            ),
                            Container(
                              width: 80,
                              height: 10,
                              color: getDashBoardIconByName(widget
                                  .timeTableList.values![index].iSMSSubjectName!
                                  .toLowerCase()),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  right: 8.0,
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: Text(
                                    "${widget.timeTableList.values![index].iSMSSubjectName}"),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              "${widget.timeTableList.values![index].tTMDPTEndTime}",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(fontSize: 14),
                            )
                          ],
                        ),
                      );
                    })
                  ],
                ),
              )
            ],
          )
        : Container();
    // ]);
  }
}
