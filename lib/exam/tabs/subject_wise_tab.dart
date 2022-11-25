import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/exam/controller/exam_controller.dart';
import '../../controller/global_utilities.dart';
import '../../controller/mskoll_controller.dart';
import '../../main.dart';
import '../../model/login_success_model.dart';
import '../apis/exam_related_api.dart';
import '../model/academic_year_model.dart';
import '../model/subject_list_model.dart';
import '../widget/result_analysis_item.dart';
import '../widget/subjectwise_container.dart';

class SubjectWiseTab extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const SubjectWiseTab({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<SubjectWiseTab> createState() => _SubjectWiseTabState();
}

class _SubjectWiseTabState extends State<SubjectWiseTab> {
  final examController = Get.put(ExamController());
  AcademicYearValues? selectedYear;

  SubjectListValue? selectedSubject;

  void getsubjecData(int ismsID) async {
    examController.subjectwiseMarkOverview.clear();
    examController.issubjectData(true);
    await examController.getSubjectWiseOverviewData(
        miID: widget.loginSuccessModel.mIID!,
        asmayID: selectedYear!.asmaYId!,
        asmtID: widget.loginSuccessModel.amsTId!,
        ismsID: ismsID,
        base: baseUrlFromInsCode(
          'portal',
          widget.mskoolController,
        ));
    examController.issubjectData(false);
  }

  void getsubList(int asmayID) async {
    examController.subjectList.clear();
    examController.issubjectwiseloading(true);
    await examController
        .getSubjectListData(
            miID: widget.loginSuccessModel.mIID!,
            amstID: widget.loginSuccessModel.amsTId!,
            asmayID: asmayID,
            base: baseUrlFromInsCode(
              'portal',
              widget.mskoolController,
            ))
        .then((value) {
      if (value) {
        selectedSubject = examController.subjectList.first;
        getsubjecData(selectedSubject!.ismSId!);
      }
    });
    examController.issubjectwiseloading(false);
  }

  getAcademicYear() async {
    examController.issubjectwiseloading(true);
    await examController
        .getAcademicYearData(
            miID: widget.loginSuccessModel.mIID!,
            amstID: widget.loginSuccessModel.amsTId!,
            base: baseUrlFromInsCode(
              'portal',
              widget.mskoolController,
            ))
        .then((value) async {
      if (value) {
        selectedYear = examController.academicYearList.first;
        getsubList(this.selectedYear!.asmaYId!);
      }
    });
    examController.issubjectwiseloading(false);
  }

  @override
  void initState() {
    super.initState();
    getAcademicYear();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Obx(
        () => examController.isSubjectWiseLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                children: [
                  Row(
                    children: [
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
                              getsubList(s!.asmaYId!);
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
                          child: DropdownButtonFormField<SubjectListValue>(
                            isExpanded: true,
                            value: selectedSubject,
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
                                'Select Subject',
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
                            items: List.generate(
                                examController.subjectList.length, (index) {
                              return DropdownMenuItem<SubjectListValue>(
                                value:
                                    examController.subjectList.elementAt(index),
                                child: Text(
                                  examController.subjectList
                                      .elementAt(index)
                                      .ismSSubjectName!,
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
                              selectedSubject = s;
                              getsubjecData(s!.ismSId!);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 16),
                  // const CircularProgressIndicator(),
                  examController.issubjectdata.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Exam - Wise Assessment',
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
                              examController.subjectwiseMarkOverview.isNotEmpty
                                  ? ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: examController
                                          .subjectwiseMarkOverview.length,
                                      itemBuilder: (context, index) {
                                        return SubjectWiseContainer(
                                          datamodel: examController
                                              .subjectwiseMarkOverview
                                              .elementAt(index),
                                        );
                                      },
                                    )
                                  : Center(
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 20.0),
                                        child: Text(
                                          'No data for selected subject....',
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
