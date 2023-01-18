import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/controller/attendance_entry_related_controller.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/initialdataModel.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/screen/attendance_entry_detail_screen.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/dropdown_label.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

class AttendanceEntryHomeScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const AttendanceEntryHomeScreen({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<AttendanceEntryHomeScreen> createState() =>
      _AttendanceEntryHomeScreenState();
}

class _AttendanceEntryHomeScreenState extends State<AttendanceEntryHomeScreen> {
  final AttendanceEntryController attendanceEntryController =
      Get.put(AttendanceEntryController());

  AcademicYearListValue? selectedAcademicYear;
  ClassListValue? selectedClass;
  ClassListValue? selectedSection;
  SubjectListValue? selectedSubject;
  PeriodlistValue? selectedPeriod;
  MonthListValue? selectedMonth;

  String selectedRadio = 'regular';

  void getInitialData() async {
    attendanceEntryController.isinitialdataloading(true);
    await attendanceEntryController
        .getAttendanceEntryInitialData(
      asmayId: widget.loginSuccessModel.asmaYId!,
      userId: widget.loginSuccessModel.userId!,
      miId: widget.loginSuccessModel.mIID!,
      username: widget.loginSuccessModel.userName!,
      roleId: widget.loginSuccessModel.roleId!,
      base: baseUrlFromInsCode(
        'admission',
        widget.mskoolController,
      ),
    )
        .then((value) {
      if (attendanceEntryController.academicYearList.isNotEmpty) {
        selectedAcademicYear = attendanceEntryController.academicYearList.first;
      }
      if (attendanceEntryController.classList.isNotEmpty) {
        selectedClass = attendanceEntryController.classList.first;
      }
      if (attendanceEntryController.sectionList.isNotEmpty) {
        selectedSection = attendanceEntryController.sectionList.first;
      }
      if (attendanceEntryController.subjectList.isNotEmpty) {
        selectedSubject = attendanceEntryController.subjectList.first;
      }
      if (attendanceEntryController.monthList.isNotEmpty) {
        selectedMonth = attendanceEntryController.monthList.first;
      }
      if (attendanceEntryController.periodList.isNotEmpty) {
        selectedPeriod = attendanceEntryController.periodList.first;
      }
    });
    attendanceEntryController.isinitialdataloading(false);
  }

  @override
  void initState() {
    getInitialData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 25,
        title: const Text('Attendance Entry'),
      ),
      floatingActionButton: const HomeFab(),
      body: Obx(
        () => attendanceEntryController.isInitialData.value
            ? const Center(
                child: AnimatedProgressWidget(
                    title: "Loading Attendance Entry",
                    desc:
                        "Please wait while we load attendance entry and create a view for you.",
                    animationPath: "assets/json/default.json"),
              )
            : SingleChildScrollView(
                child: Column(
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
                      child: DropdownButtonFormField<AcademicYearListValue>(
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
                            attendanceEntryController.academicYearList.length,
                            (index) {
                          return DropdownMenuItem(
                            value: attendanceEntryController
                                .academicYearList[index],
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13, left: 5),
                              child: Text(
                                attendanceEntryController
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
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
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
                      child: DropdownButtonFormField<ClassListValue>(
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
                            containerColor: Color.fromRGBO(255, 235, 234, 1),
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
                            attendanceEntryController.classList.length,
                            (index) {
                          return DropdownMenuItem(
                            value: attendanceEntryController.classList[index],
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13, left: 5),
                              child: Text(
                                attendanceEntryController
                                    .classList[index].asmcLClassName!,
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
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
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
                      child: DropdownButtonFormField<ClassListValue>(
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
                            containerColor: Color.fromRGBO(219, 253, 245, 1),
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
                            attendanceEntryController.sectionList.length,
                            (index) {
                          return DropdownMenuItem(
                            value: attendanceEntryController.sectionList[index],
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13, left: 5),
                              child: Text(
                                attendanceEntryController
                                    .sectionList[index].asmCSectionName!,
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
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
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
                        value: selectedSubject,
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
                            icon: 'assets/images/selectSub.png',
                            containerColor: Color.fromRGBO(229, 243, 255, 1),
                            text: 'Select Subject',
                            textColor: Color.fromRGBO(62, 120, 170, 1),
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
                            attendanceEntryController.subjectList.length,
                            (index) {
                          return DropdownMenuItem(
                            value: attendanceEntryController.subjectList[index],
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13, left: 5),
                              child: Text(
                                attendanceEntryController
                                    .subjectList[index].ismSIvrsSubjectName!,
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
                          selectedSubject = s!;
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 16),
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
                      child: DropdownButtonFormField<PeriodlistValue>(
                        value: selectedPeriod,
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
                            icon: 'assets/images/selectPeriod.png',
                            containerColor: Color.fromRGBO(238, 232, 255, 1),
                            text: 'Select Period',
                            textColor: Color.fromRGBO(111, 88, 180, 1),
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
                            attendanceEntryController.periodList.length,
                            (index) {
                          return DropdownMenuItem(
                            value: attendanceEntryController.periodList[index],
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13, left: 5),
                              child: Text(
                                attendanceEntryController
                                    .periodList[index].ttmPPeriodName!,
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
                          selectedPeriod = s!;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 33,
                      child: RadioListTile(
                        dense: true,
                        activeColor: Theme.of(context).primaryColor,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        visualDensity: const VisualDensity(horizontal: -4.0),
                        title: Text(
                          "Regular",
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  letterSpacing: 0.3)),
                        ),
                        value: "regular",
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value.toString();
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 33,
                      child: RadioListTile(
                        dense: true,
                        activeColor: Theme.of(context).primaryColor,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 8),
                        visualDensity: const VisualDensity(horizontal: -4.0),
                        title: Text(
                          "Extra Period",
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  letterSpacing: 0.3)),
                        ),
                        value: "extraPeriod",
                        groupValue: selectedRadio,
                        onChanged: (value) {
                          setState(() {
                            selectedRadio = value.toString();
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 100),
                    MSkollBtn(
                        title: 'View Details',
                        onPress: () {
                          Get.to(() => const AttendanceEntryDetailScreen());
                        }),
                  ],
                ),
              ),
      ),
    );
  }
}
