import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/manager/student_details/controller/view_student_details_controller.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class ExamTab extends StatelessWidget {
  final ViewStudentDetailsController controller;
  const ExamTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isErrorOccured.value
          ? Center(
              child: ErrWidget(
                err: {
                  "errorTitle": "Unexpected Error Occured",
                  "errorMsg": controller.status.value,
                },
              ),
            )
          : controller.isLoading.value
              ? Center(
                  child: AnimatedProgressWidget(
                    animationPath: 'assets/json/default.json',
                    desc: controller.status.value,
                    title: "Please wait we are loading.",
                  ),
                )
              : controller.managerExam.isEmpty
                  ? const Center(
                      child: AnimatedProgressWidget(
                        title: "No Exam Found",
                        desc:
                            "There is no exam data available currently.. Please ask your technical team to add some",
                        animationPath: "assets/json/nodata.json",
                        animatorHeight: 250,
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(16.0),
                      itemBuilder: (_, index) {
                        return CustomContainer(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Chip(
                                  label: Text(
                                    controller.managerExam
                                        .elementAt(index)
                                        .examName!,
                                  ),
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: Container(),
                                    ),
                                    Expanded(
                                      flex: 7,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Total Marks",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .merge(
                                                            TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelMedium!
                                                                  .color,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 6.0,
                                                    ),
                                                    Text(
                                                      controller.managerExam
                                                          .elementAt(index)
                                                          .totalmarks
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .merge(
                                                            const TextStyle(
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 12.0,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Marks Obtained",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .merge(
                                                            TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelMedium!
                                                                  .color,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 6.0,
                                                    ),
                                                    Text(
                                                      controller.managerExam
                                                          .elementAt(index)
                                                          .obtainmarks
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .merge(
                                                            const TextStyle(
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 16.0,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Percentage",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .merge(
                                                            TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelMedium!
                                                                  .color,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 6.0,
                                                    ),
                                                    Text(
                                                      "${controller.managerExam.elementAt(index).persentage.toString()}%",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .merge(
                                                            const TextStyle(
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 12.0,
                                              ),
                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      "Final Result",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .merge(
                                                            TextStyle(
                                                              color: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .labelMedium!
                                                                  .color,
                                                              fontSize: 15.0,
                                                            ),
                                                          ),
                                                    ),
                                                    const SizedBox(
                                                      height: 6.0,
                                                    ),
                                                    Text(
                                                      controller.managerExam
                                                          .elementAt(index)
                                                          .result
                                                          .toString(),
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleSmall!
                                                          .merge(
                                                            TextStyle(
                                                              fontSize: 20.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              color: controller
                                                                          .managerExam
                                                                          .elementAt(
                                                                              index)
                                                                          .result
                                                                          .toString()
                                                                          .toLowerCase() ==
                                                                      "pass"
                                                                  ? Colors.green
                                                                  : Colors.red,
                                                            ),
                                                          ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(
                          height: 16.0,
                        );
                      },
                      itemCount: controller.managerExam.length,
                    );
    });
  }
}
