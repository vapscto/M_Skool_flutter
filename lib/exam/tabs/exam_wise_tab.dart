import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/coe/apis/get_academic_year_api.dart';
import 'package:m_skool_flutter/exam/apis/exam_related_api.dart';
import 'package:m_skool_flutter/exam/controller/exam_controller.dart';
import 'package:m_skool_flutter/exam/model/markoverview_model.dart';
import 'package:m_skool_flutter/exam/model/pie_data_model.dart';
import 'package:m_skool_flutter/exam/widget/result_analysis_item.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../controller/global_utilities.dart';
import '../../controller/mskoll_controller.dart';
import '../../model/login_success_model.dart';
import '../model/academic_year_model.dart';
import '../model/exam_list_model.dart';

class ExamWiseTab extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ExamWiseTab({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<ExamWiseTab> createState() => _ExamWiseTabState();
}

class _ExamWiseTabState extends State<ExamWiseTab> {
  final examController = Get.put(ExamController());

  RxBool showGraph = RxBool(false);
  getExamList(int asmayID) async {
    examController.examList.clear();
    examController.isloading(true);
    await examController
        .getExamListData(
            miID: widget.loginSuccessModel.mIID!,
            amstID: widget.loginSuccessModel.amsTId!,
            asmayID: asmayID,
            base: baseUrlFromInsCode(
              'portal',
              widget.mskoolController,
            ))
        .then((value) {
      if (value) {
        getMarkOverviewData(examController.examList.first.emEId!);
      }
    });
    examController.isloading(false);
  }

  getMarkOverviewData(int emeID) async {
    examController.examwiseMarkOverview.clear();
    examController.isDataListloading(true);
    await examController.getMarkOverviewData(
        miID: widget.loginSuccessModel.mIID!,
        asmayID: examController.selectedYear!.asmaYId!,
        asmtID: widget.loginSuccessModel.amsTId!,
        emeID: emeID,
        base: baseUrlFromInsCode(
          'portal',
          widget.mskoolController,
        ));
    examController.isDataListloading(false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Obx(
        () => examController.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          //padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 8,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: DropdownButtonFormField<AcademicYearValues>(
                            isExpanded: true,
                            value: examController.selectedYear,
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(12.0),
                              // ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 12.0),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),

                              label: Text(
                                "Academic Year",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .merge(TextStyle(
                                      color: Colors.grey.shade600,
                                      fontSize: 19.0,
                                    )),
                              ),
                            ),
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 30,
                            ),
                            iconSize: 30,
                            items: List.generate(
                              examController.academicYearList.length,
                              (index) {
                                return DropdownMenuItem<AcademicYearValues>(
                                  value: examController.academicYearList
                                      .elementAt(index),
                                  child: Text(
                                    examController.academicYearList
                                        .elementAt(index)
                                        .asmaYYear!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .merge(const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0,
                                          letterSpacing: 0.3,
                                        )),
                                  ),
                                );
                              },
                            ),
                            onChanged: (s) {
                              examController.selectedYear = s;
                              getExamList(s!.asmaYId!);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                            borderRadius: BorderRadius.circular(16.0),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 8,
                                color: Colors.black12,
                              ),
                            ],
                          ),
                          child: DropdownButtonFormField<ExamListValue>(
                            isExpanded: true,
                            value: examController.selectedExam,
                            decoration: InputDecoration(
                              // border: OutlineInputBorder(
                              //   borderRadius: BorderRadius.circular(12.0),
                              // ),
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 12.0),

                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                ),
                              ),

                              label: Text(
                                'Select Exam',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .merge(TextStyle(
                                      color: Colors.grey.shade600,
                                    )),
                              ),
                            ),
                            icon: const Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 30,
                            ),
                            iconSize: 30,
                            items: List.generate(examController.examList.length,
                                (index) {
                              return DropdownMenuItem(
                                value: examController.examList.elementAt(index),
                                child: Text(
                                  examController.examList
                                      .elementAt(index)
                                      .emEExamName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .merge(const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 16.0,
                                          letterSpacing: 0.3)),
                                ),
                              );
                            }),
                            onChanged: (s) {
                              examController.selectedExam = s;
                              getMarkOverviewData(s!.emEId!);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  examController.isDataListLoading.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Marks Overview',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .merge(
                                          const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black,
                                          ),
                                        ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                            width: 1.5)),
                                    child: Row(
                                      children: [
                                        Obx(() {
                                          return InkWell(
                                            onTap: () {
                                              showGraph.value = false;
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 6.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    24.0,
                                                  ),
                                                  bottomLeft:
                                                      Radius.circular(24.0),
                                                ),
                                                color: showGraph.value
                                                    ? Colors.transparent
                                                    : Theme.of(context)
                                                        .primaryColor,
                                              ),
                                              child: Text(
                                                "Static",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .merge(TextStyle(
                                                        color: showGraph.value
                                                            ? Theme.of(context)
                                                                .textTheme
                                                                .titleSmall!
                                                                .color
                                                            : Colors.white)),
                                              ),
                                            ),
                                          );
                                        }),
                                        Obx(() {
                                          return InkWell(
                                            onTap: () {
                                              showGraph.value = true;
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 6.0),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight: Radius.circular(
                                                    24.0,
                                                  ),
                                                  bottomRight:
                                                      Radius.circular(24.0),
                                                ),
                                                color: showGraph.value
                                                    ? Theme.of(context)
                                                        .primaryColor
                                                    : Colors.transparent,
                                              ),
                                              child: Text(
                                                "Graph",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleSmall!
                                                    .merge(TextStyle(
                                                        color: showGraph.value
                                                            ? Colors.white
                                                            : Theme.of(context)
                                                                .textTheme
                                                                .titleSmall!
                                                                .color)),
                                              ),
                                            ),
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              examController.examwiseMarkOverview.isNotEmpty
                                  ? Obx(() {
                                      return showGraph.value
                                          ? ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount: examController
                                                  .examwiseMarkOverview.length,
                                              itemBuilder: (_, index) {
                                                return GraphResultAnalysisItem(
                                                  datamodel: examController
                                                      .examwiseMarkOverview
                                                      .elementAt(index),
                                                  chipColor: examController
                                                      .chipColor
                                                      .elementAt(index),
                                                  containerColor: examController
                                                      .containerColor
                                                      .elementAt(index),
                                                  gradeColor: examController
                                                      .gradeColor
                                                      .elementAt(index),
                                                );
                                              })
                                          : ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount: examController
                                                  .examwiseMarkOverview.length,
                                              itemBuilder: (context, index) {
                                                return ResultAnalysisItem(
                                                  datamodel: examController
                                                      .examwiseMarkOverview
                                                      .elementAt(index),
                                                  chipColor: examController
                                                      .chipColor
                                                      .elementAt(index),
                                                  containerColor: examController
                                                      .containerColor
                                                      .elementAt(index),
                                                  gradeColor: examController
                                                      .gradeColor
                                                      .elementAt(index),
                                                );
                                              },
                                            );
                                    })
                                  : Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: Text(
                                          'No data for selected Exam....',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium!
                                              .merge(
                                                TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black
                                                      .withOpacity(0.5),
                                                ),
                                              ),
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        )
                ],
              ),
      ),
    );
  }
}

class GraphResultAnalysisItem extends StatefulWidget {
  final ExamWiseReportListValue datamodel;

  final Color chipColor;
  final Color containerColor;
  final Color gradeColor;
  const GraphResultAnalysisItem(
      {super.key,
      required this.datamodel,
      required this.chipColor,
      required this.containerColor,
      required this.gradeColor});

  @override
  State<GraphResultAnalysisItem> createState() =>
      _GraphResultAnalysisItemState();
}

class _GraphResultAnalysisItemState extends State<GraphResultAnalysisItem> {
  List<PieDataModel> pie = [];

  @override
  void initState() {
    // TODO: implement initState

    pie.add(PieDataModel(
        marks: widget.datamodel.estmpsMaxMarks!.toInt(),
        name: "Max Marks",
        color: Colors.grey.shade100));
    pie.add(PieDataModel(
        marks: widget.datamodel.estmpsObtainedMarks!.toInt(),
        name: "Mark Obtained",
        color: widget.chipColor));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        color: widget.containerColor,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 6.0),
                  backgroundColor: widget.chipColor,
                  label: Text(widget.datamodel.ismsSubjectName!),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Text(
                    //   "Grade",
                    //   style: Theme.of(context).textTheme.labelMedium,
                    // ),
                    // const SizedBox(
                    //   height: 6.0,
                    // ),
                    Text(
                      "${widget.datamodel.estmpsObtainedGrade}  ",
                      style: Theme.of(context).textTheme.titleMedium!.merge(
                            TextStyle(fontSize: 20.0, color: widget.gradeColor),
                          ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Row(
              children: [
                SizedBox(
                  width: Get.width * 0.4,
                  height: Get.width * 0.4,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SfCircularChart(
                        series: <CircularSeries>[
                          PieSeries<PieDataModel, String>(
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true),
                              dataSource: pie,
                              pointColorMapper: ((datum, index) => datum.color),
                              xValueMapper: ((datum, index) => datum.name),
                              yValueMapper: ((datum, index) => datum.marks)),
                          PieSeries<PieDataModel, String>(
                              dataSource: pie,
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true),
                              pointColorMapper: ((datum, index) => datum.color),
                              xValueMapper: ((datum, index) => datum.name),
                              yValueMapper: ((datum, index) => datum.marks)),
                        ],
                      ),
                      // Column(
                      //   crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     Text(
                      //       "${widget.datamodel.estmpsObtainedMarks!.toInt()}",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .labelMedium!
                      //           .merge(const TextStyle(
                      //               fontWeight: FontWeight.w700,
                      //               color: Colors.black)),
                      //     ),
                      //     const SizedBox(
                      //       height: 6.0,
                      //     ),
                      //     Text(
                      //       "Marks Obtained",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .labelSmall!
                      //           .merge(const TextStyle(
                      //               fontSize: 13,
                      //               fontWeight: FontWeight.w400,
                      //               letterSpacing: 0.2,
                      //               color: Color.fromRGBO(124, 124, 124, 1))),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                Expanded(
                  child: Wrap(
                    runSpacing: 12.0,
                    spacing: 10.0,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Maximum ",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .merge(const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.2,
                                    color: Color.fromRGBO(124, 124, 124, 1))),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "${widget.datamodel.estmpsMaxMarks!.toInt()}",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .merge(const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Minimum",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .merge(const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.2,
                                    color: Color.fromRGBO(124, 124, 124, 1))),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "${widget.datamodel.eycesMinMarks!.toInt()}",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .merge(const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Class Highest",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .merge(const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.2,
                                    color: Color.fromRGBO(124, 124, 124, 1))),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "${widget.datamodel.estmpsClassHighest!.toInt()}",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .merge(const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Section Highest",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .merge(const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.2,
                                    color: Color.fromRGBO(124, 124, 124, 1))),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "${widget.datamodel.estmpsSectionHighest!.toInt()}",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .merge(const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Section Avg",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .merge(const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.2,
                                    color: Color.fromRGBO(124, 124, 124, 1))),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "${widget.datamodel.estmpsSectionAverage!.toInt()}",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .merge(const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Class avg",
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .merge(const TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.2,
                                    color: Color.fromRGBO(124, 124, 124, 1))),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "${widget.datamodel.estmpsClassAverage!.toInt()}",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .merge(const TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
