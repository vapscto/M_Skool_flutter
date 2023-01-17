import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/dropdown_label.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/controller/student_attendance_related_controller.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/model/academicyeardropdownModel.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/model/classdropdownModel.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/model/sectiondropdownModel.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/screen/consolidated_datewise_student_attendance_detail_screen.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/screen/consolidated_monthly_student_attendance_detail_screen.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/screen/detailed_datewise_student_attendance_detail_screen.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/screen/detailed_monthly_student_attendance_detail_screen.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/widget/selectdatefromtodate.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/widget/selectmonthscrollcontainer.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/widget/selectstudentscrollcontainer.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

class StudentAttendanceStaffHome extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const StudentAttendanceStaffHome({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<StudentAttendanceStaffHome> createState() =>
      _StudentAttendanceStaffHomeState();
}

class _StudentAttendanceStaffHomeState
    extends State<StudentAttendanceStaffHome> {
  final StudentAttendanceController studentAttendanceController =
      Get.put(StudentAttendanceController());

  StudentAttendanceYearlistValue? selectedAcademicYear;
  ClasslistValue? selectedClass;
  SectionListValue? selectedSection;

  String selectedRadio = 'consolidated';
  String configuration = 'monthly';

  void getAcademicYearDropdown() async {
    studentAttendanceController.isacademicyearloading(true);
    await studentAttendanceController
        .getAcademicYear(
            base: baseUrlFromInsCode('portal', widget.mskoolController),
            miId: widget.loginSuccessModel.mIID!)
        .then((value) {
      if (value) {
        if (studentAttendanceController.academicYearList.isNotEmpty) {
          selectedAcademicYear =
              studentAttendanceController.academicYearList.first;
          getClassYearDropdown(selectedAcademicYear!.asmaYId!.toInt());
        }
      }
    });
    studentAttendanceController.isacademicyearloading(false);
  }

  void getClassYearDropdown(int asmayId) async {
    studentAttendanceController.isclassloading(true);
    await studentAttendanceController
        .getClass(
            base: baseUrlFromInsCode('portal', widget.mskoolController),
            miId: widget.loginSuccessModel.mIID!,
            userId: widget.loginSuccessModel.userId!,
            asmayId: asmayId)
        .then((value) {
      if (value) {
        if (studentAttendanceController.classList.isNotEmpty) {
          selectedClass = studentAttendanceController.classList.first;
          getSectionDropdown();
        }
      }
    });
    studentAttendanceController.isclassloading(false);
  }

  void getSectionDropdown() async {
    studentAttendanceController.issectionloading(true);
    await studentAttendanceController
        .getSection(
            base: baseUrlFromInsCode('portal', widget.mskoolController),
            miId: widget.loginSuccessModel.mIID!,
            userId: widget.loginSuccessModel.userId!,
            asmayId: selectedAcademicYear!.asmaYId!.toInt(),
            asmclId: widget.loginSuccessModel.asmcLId!)
        .then((value) {
      logger.d(value);
      if (value) {
        if (studentAttendanceController.sectionList.isNotEmpty) {
          selectedSection = studentAttendanceController.sectionList.first;
        }
      }
    });
    studentAttendanceController.issectionloading(false);
  }

  @override
  void initState() {
    getAcademicYearDropdown();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 25,
        title: const Text('Student Attendance'),
      ),
      floatingActionButton: const HomeFab(),
      body: Obx(
        () => studentAttendanceController.isAcademicYear.value
            ? const Center(
                child: AnimatedProgressWidget(
                    title: "Loading Student Attendance",
                    desc:
                        "Please wait while we load student attendance and create a view for you.",
                    animationPath: "assets/json/default.json"),
              )
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: DropdownButtonFormField<
                          StudentAttendanceYearlistValue>(
                        value: selectedAcademicYear,
                        decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          isDense: true,
                          label: CustomDropDownLabel(
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
                            studentAttendanceController.academicYearList.length,
                            (index) {
                          return DropdownMenuItem(
                            value: studentAttendanceController
                                .academicYearList[index],
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13, left: 5),
                              child: Text(
                                studentAttendanceController
                                    .academicYearList[index].asmaYYear!,
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
                          selectedAcademicYear = s!;
                          getClassYearDropdown(s.asmaYId!.toInt());
                          // logger.d(s.hrmEId.toString());
                        },
                      ),
                    ),
                    studentAttendanceController.isClass.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : studentAttendanceController.classList.isNotEmpty
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
                                child: DropdownButtonFormField<ClasslistValue>(
                                  value: selectedClass,
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    isDense: true,
                                    label: CustomDropDownLabel(
                                      icon: 'assets/images/classnew.png',
                                      containerColor:
                                          Color.fromRGBO(255, 235, 234, 1),
                                      text: 'Class',
                                      textColor:
                                          Color.fromRGBO(255, 111, 103, 1),
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
                                      studentAttendanceController
                                          .classList.length, (index) {
                                    return DropdownMenuItem(
                                      value: studentAttendanceController
                                          .classList[index],
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 13, left: 5),
                                        child: Text(
                                          studentAttendanceController
                                              .classList[index].classname!,
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
                                    getSectionDropdown();
                                    // logger.d(s.hrmEId.toString());
                                  },
                                ),
                              )
                            : const SizedBox(),
                    studentAttendanceController.isSection.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : studentAttendanceController.sectionList.isNotEmpty
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
                                child:
                                    DropdownButtonFormField<SectionListValue>(
                                  value: selectedSection,
                                  decoration: const InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    isDense: true,
                                    label: CustomDropDownLabel(
                                      icon: 'assets/images/sectionnew.png',
                                      containerColor:
                                          Color.fromRGBO(219, 253, 245, 1),
                                      text: 'Section',
                                      textColor:
                                          Color.fromRGBO(71, 186, 158, 1),
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
                                      studentAttendanceController
                                          .sectionList.length, (index) {
                                    return DropdownMenuItem(
                                      value: studentAttendanceController
                                          .sectionList[index],
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 13, left: 5),
                                        child: Text(
                                          studentAttendanceController
                                              .sectionList[index]
                                              .asmCSectionName!,
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
                                    // logger.d(s.hrmEId.toString());
                                  },
                                ),
                              )
                            : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.1,
                                child: Radio(
                                  visualDensity:
                                      const VisualDensity(horizontal: -4.0),
                                  activeColor: Theme.of(context).primaryColor,
                                  value: "consolidated",
                                  groupValue: selectedRadio,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRadio = value.toString();
                                      logger.d(selectedRadio);
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "Consolidated",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .merge(const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                        letterSpacing: 0.3)),
                              ),
                            ],
                          ),
                          const SizedBox(width: 30),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.1,
                                child: Radio(
                                  visualDensity:
                                      const VisualDensity(horizontal: -4.0),
                                  activeColor: Theme.of(context).primaryColor,
                                  value: "detailed",
                                  groupValue: selectedRadio,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedRadio = value.toString();
                                      logger.d(selectedRadio);
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "Detailed",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .merge(const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                        letterSpacing: 0.3)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        'Select Configuration',
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14.0),
                      child: Row(
                        children: [
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.1,
                                child: Radio(
                                  visualDensity:
                                      const VisualDensity(horizontal: -4.0),
                                  activeColor: Theme.of(context).primaryColor,
                                  value: "monthly",
                                  groupValue: configuration,
                                  onChanged: (value) {
                                    setState(() {
                                      configuration = value.toString();
                                      logger.d(configuration);
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "Monthly",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .merge(const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                        letterSpacing: 0.3)),
                              ),
                            ],
                          ),
                          const SizedBox(width: 65),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.1,
                                child: Radio(
                                  visualDensity:
                                      const VisualDensity(horizontal: -4.0),
                                  activeColor: Theme.of(context).primaryColor,
                                  value: "datewise",
                                  groupValue: configuration,
                                  onChanged: (value) {
                                    setState(() {
                                      configuration = value.toString();
                                      logger.d(configuration);
                                    });
                                  },
                                ),
                              ),
                              Text(
                                "Date Wise",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .merge(const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14.0,
                                        letterSpacing: 0.3)),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    if (configuration == 'monthly') const SizedBox(height: 10),
                    configuration == 'monthly'
                        ? const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12),
                            child: SelectMonthScrollContainer())
                        : const SelectDateFromToDate(),
                    const SizedBox(height: 30),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: SelectStudentScrollContainer(),
                    ),
                    const SizedBox(height: 20),
                    Align(
                      alignment: Alignment.center,
                      child: MSkollBtn(
                        title: 'Search',
                        onPress: () {
                          if (selectedRadio == 'consolidated' &&
                              configuration == 'monthly') {
                            Get.to(() =>
                                const ConsolidatedMonthlyStudentAttendanceDetailScreen());
                          }
                          if (selectedRadio == 'consolidated' &&
                              configuration == 'datewise') {
                            Get.to(() =>
                                const ConsolidatedDateWiseStudentAttendanceDetailScreen());
                          }
                          if (selectedRadio == 'detailed' &&
                              configuration == 'monthly') {
                            Get.to(() =>
                                const DetailedMonthlyStudentAttendanceDetailScreeen());
                          }
                          if (selectedRadio == 'detailed' &&
                              configuration == 'datewise') {
                            Get.to(() =>
                                const DetailedDateWiseStudentAttendanceDetailScreen());
                          }
                        },
                        size: const Size.fromWidth(150),
                      ),
                    ),
                    const SizedBox(height: 30),
                  ],
                ),
              ),
      ),
    );
  }
}
