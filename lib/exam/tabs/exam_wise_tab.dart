import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/coe/apis/get_academic_year_api.dart';
import 'package:m_skool_flutter/exam/apis/exam_related_api.dart';
import 'package:m_skool_flutter/exam/controller/exam_controller.dart';
import 'package:m_skool_flutter/exam/widget/result_analysis_item.dart';
import 'package:m_skool_flutter/main.dart';

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
                              examController.examwiseMarkOverview.isNotEmpty
                                  ? ListView.builder(
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
                                          chipColor: examController.chipColor
                                              .elementAt(index),
                                          containerColor: examController
                                              .containerColor
                                              .elementAt(index),
                                          gradeColor: examController.gradeColor
                                              .elementAt(index),
                                        );
                                      },
                                    )
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
