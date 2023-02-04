import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/manager/overall_fee/controller/overall_classwise_related_controller.dart';
import 'package:m_skool_flutter/manager/overall_fee/model/overallFeeAcademicYearModel.dart';
import 'package:m_skool_flutter/manager/overall_fee/model/overallFeeClassModel.dart';
import 'package:m_skool_flutter/manager/overall_fee/model/overallFeeSectionModel.dart';
import 'package:m_skool_flutter/manager/overall_fee/widget/manager_fee_bar_chart.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/dropdown_label.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';

class ManagerClassWiseFeeDetails extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ManagerClassWiseFeeDetails({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<ManagerClassWiseFeeDetails> createState() =>
      _ManagerClassWiseFeeDetailsState();
}

class _ManagerClassWiseFeeDetailsState
    extends State<ManagerClassWiseFeeDetails> {
  OverallClasswiseController overallClasswiseController =
      Get.put(OverallClasswiseController());

  RxBool showGraph = RxBool(false);

  YearlistValue? selectedYear;
  ClassarrayValue? selectedClass;
  FillsectionValue? selectedSection;

  void getAcademicYear() async {
    overallClasswiseController.isacademicyearloading(true);
    await overallClasswiseController
        .getAcademicList(
      miId: widget.loginSuccessModel.mIID!,
      base: baseUrlFromInsCode(
        'portal',
        widget.mskoolController,
      ),
    )
        .then((value) {
      if (value) {
        if (overallClasswiseController.academicYearList.isNotEmpty) {
          selectedYear = overallClasswiseController.academicYearList.first;
          getClassList(selectedYear!.asmaYId!);
        }
      }
    });
    overallClasswiseController.isacademicyearloading(false);
  }

  void getClassList(int asmayId) async {
    overallClasswiseController.isclassloading(true);
    await overallClasswiseController
        .getClassListData(
      base: baseUrlFromInsCode('portal', widget.mskoolController),
      miId: widget.loginSuccessModel.mIID!,
      asmayId: asmayId,
    )
        .then((value) {
      if (value) {
        if (overallClasswiseController.classList.isNotEmpty) {
          selectedClass = overallClasswiseController.classList.first;
          getSectionList(selectedClass!.asmcLId!);
        }
      }
    });
    overallClasswiseController.isclassloading(false);
  }

  void getSectionList(int asmclId) async {
    overallClasswiseController.issectionloading(true);
    await overallClasswiseController
        .getSectionData(
            base: baseUrlFromInsCode('portal', widget.mskoolController),
            miId: widget.loginSuccessModel.mIID!,
            asmayId: selectedYear!.asmaYId!,
            asmclId: asmclId)
        .then((value) {
      if (value) {
        selectedSection = overallClasswiseController.sectionList.first;
        getResultList(selectedSection!.asmSId!);
      }
    });
    overallClasswiseController.issectionloading(false);
  }

  void getResultList(int asmsId) async {
    overallClasswiseController.isresultloading(true);
    await overallClasswiseController.getResultData(
      base: baseUrlFromInsCode('portal', widget.mskoolController),
      asmayId: selectedYear!.asmaYId!,
      miId: widget.loginSuccessModel.mIID!,
      asmclId: selectedClass!.asmcLId!,
      asmsId: asmsId,
    );
    overallClasswiseController.isresultloading(false);
  }

  @override
  void initState() {
    getAcademicYear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => overallClasswiseController.isAcademicYear.value
            ? const Align(
                alignment: Alignment.center,
                child: AnimatedProgressWidget(
                    title: "Loading Classwise Fee Details",
                    desc:
                        "Please wait while we load fee details and create a view for you.",
                    animationPath: "assets/json/default.json"),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                        top: 40, left: 16, right: 16, bottom: 16),
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
                    child: DropdownButtonFormField<YearlistValue>(
                      value: selectedYear,
                      decoration: InputDecoration(
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
                        isDense: true,
                        hintStyle: Theme.of(context)
                            .textTheme
                            .labelSmall!
                            .merge(const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                letterSpacing: 0.3)),
                        hintText: 'Select Year',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        label: const CustomDropDownLabel(
                          icon: 'assets/images/hat.png',
                          containerColor: Color.fromRGBO(223, 251, 254, 1),
                          text: 'Academic Year',
                          textColor: Color.fromRGBO(40, 182, 200, 1),
                        ),
                      ),
                      icon: const Padding(
                        padding: EdgeInsets.only(top: 3),
                        child: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                        ),
                      ),
                      iconSize: 30,
                      items: List.generate(
                          overallClasswiseController.academicYearList.length,
                          (index) {
                        return DropdownMenuItem(
                          value: overallClasswiseController
                              .academicYearList[index],
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13, left: 5),
                            child: Text(
                              overallClasswiseController.academicYearList
                                  .elementAt(index)
                                  .asmaYYear!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .merge(const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                      letterSpacing: 0.3)),
                            ),
                          ),
                        );
                      }),
                      onChanged: (s) {
                        selectedYear = s!;
                        selectedClass = null;
                        getClassList(s.asmaYId!);
                      },
                    ),
                  ),
                  overallClasswiseController.isClass.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : selectedYear != null
                          ? Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 8,
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: DropdownButtonFormField<ClassarrayValue>(
                                value: selectedClass,
                                decoration: InputDecoration(
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
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .merge(const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          letterSpacing: 0.3)),
                                  hintText: 'Select Class',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  isDense: true,
                                  label: const CustomDropDownLabel(
                                    icon: 'assets/images/classnew.png',
                                    containerColor:
                                        Color.fromRGBO(255, 235, 234, 1),
                                    text: 'Class',
                                    textColor: Color.fromRGBO(255, 111, 103, 1),
                                  ),
                                ),
                                icon: const Padding(
                                  padding: EdgeInsets.only(top: 3),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 30,
                                  ),
                                ),
                                iconSize: 30,
                                items: List.generate(
                                    overallClasswiseController.classList.length,
                                    (index) {
                                  return DropdownMenuItem(
                                    value: overallClasswiseController
                                        .classList[index],
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 5),
                                      child: Text(
                                        overallClasswiseController
                                            .classList[index].className!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .merge(const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.0,
                                                letterSpacing: 0.3)),
                                      ),
                                    ),
                                  );
                                }),
                                onChanged: (s) {
                                  selectedClass = s!;

                                  getSectionList(s.asmcLId!);
                                },
                              ),
                            )
                          : const SizedBox(),
                  overallClasswiseController.isSection.value
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : selectedClass != null
                          ? Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 16),
                              decoration: BoxDecoration(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                borderRadius: BorderRadius.circular(16.0),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 1),
                                    blurRadius: 8,
                                    color: Colors.black12,
                                  ),
                                ],
                              ),
                              child: DropdownButtonFormField<FillsectionValue>(
                                value: selectedSection,
                                decoration: InputDecoration(
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
                                  isDense: true,
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .merge(const TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14.0,
                                          letterSpacing: 0.3)),
                                  hintText: 'Select Section',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  label: const CustomDropDownLabel(
                                    icon: 'assets/images/sectionnew.png',
                                    containerColor:
                                        Color.fromRGBO(219, 253, 245, 1),
                                    text: 'Section',
                                    textColor: Color.fromRGBO(71, 186, 158, 1),
                                  ),
                                ),
                                icon: const Padding(
                                  padding: EdgeInsets.only(top: 3),
                                  child: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 30,
                                  ),
                                ),
                                iconSize: 30,
                                items: List.generate(
                                    overallClasswiseController
                                        .sectionList.length, (index) {
                                  return DropdownMenuItem(
                                    value: overallClasswiseController
                                        .sectionList[index],
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 13, left: 5),
                                      child: Text(
                                        overallClasswiseController
                                            .sectionList[index].sectionname!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .merge(const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.0,
                                                letterSpacing: 0.3)),
                                      ),
                                    ),
                                  );
                                }),
                                onChanged: (s) {
                                  selectedSection = s!;
                                  getResultList(s.asmSId!);
                                },
                              ),
                            )
                          : const SizedBox(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Result",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.0),
                              border: Border.all(
                                  color: Theme.of(context).primaryColor,
                                  width: 1.5)),
                          child: Row(
                            children: [
                              Obx(() {
                                return InkWell(
                                  onTap: () {
                                    showGraph.value = false;
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(
                                          24.0,
                                        ),
                                        bottomLeft: Radius.circular(24.0),
                                      ),
                                      color: showGraph.value
                                          ? Colors.transparent
                                          : Theme.of(context).primaryColor,
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
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0, vertical: 6.0),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(
                                          24.0,
                                        ),
                                        bottomRight: Radius.circular(24.0),
                                      ),
                                      color: showGraph.value
                                          ? Theme.of(context).primaryColor
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
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  overallClasswiseController.isResult.value
                      ? const Align(
                          alignment: Alignment.center,
                          child: AnimatedProgressWidget(
                              title: "Loading Fee Results",
                              desc: "",
                              animationPath: "assets/json/default.json"),
                        )
                      : overallClasswiseController.resultsList.isEmpty
                          ? const Center(
                              child: Text('No data avaiable'),
                            )
                          : selectedSection == null
                              ? const SizedBox()
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0, vertical: 10),
                                  child: showGraph.value
                                      ? ListView.separated(
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: overallClasswiseController
                                              .resultsList.length,
                                          itemBuilder: (context, index) {
                                            return ManagerFeeBarChart(
                                              chipText:
                                                  "Class : ${overallClasswiseController.resultsList.elementAt(index).section!}",
                                              navigationIcon: true,
                                              totalCharges:
                                                  overallClasswiseController
                                                      .resultsList
                                                      .elementAt(index)
                                                      .receivable!
                                                      .toDouble(),
                                              payable:
                                                  overallClasswiseController
                                                      .resultsList
                                                      .elementAt(index)
                                                      .balance!
                                                      .toDouble(),
                                              totalConcession:
                                                  overallClasswiseController
                                                      .resultsList
                                                      .elementAt(index)
                                                      .concession!
                                                      .toDouble(),
                                              totalPaid:
                                                  overallClasswiseController
                                                      .resultsList
                                                      .elementAt(index)
                                                      .paid!
                                                      .toDouble(),
                                            );
                                          },
                                          separatorBuilder: (context, index) =>
                                              const SizedBox(
                                            height: 30,
                                          ),
                                        )
                                      : const SizedBox(),
                                )
                ],
              ),
      ),
    );
  }
}
