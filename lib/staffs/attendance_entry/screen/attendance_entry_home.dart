import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/controller/attendance_entry_related_controller.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/initialdataModel.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/sectionModel.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/screen/attendance_entry_detail_screen.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/screen/daywise_attendance_entry_detail.screen.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/screen/monthwise_attendance_entry_detail_screen.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/screen/periodwise_attendance_entry_detail_screen.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/dropdown_label.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/subjectModel.dart'
    as PWM;

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
  SectionListValue? selectedSection;
  PWM.SubjectListValue? selectedSubject;
  PeriodlistValue? selectedPeriod;
  MonthListValue? selectedMonth;

  String selectedRadio = 'Regular';
  var todayDate = TextEditingController();

  void getInitialData() async {
    attendanceEntryController.isinitialdataloading(true);
    await attendanceEntryController.getAttendanceEntryInitialData(
      asmayId: widget.loginSuccessModel.asmaYId!,
      userId: widget.loginSuccessModel.userId!,
      miId: widget.loginSuccessModel.mIID!,
      username: widget.loginSuccessModel.userName!,
      roleId: widget.loginSuccessModel.roleId!,
      base: baseUrlFromInsCode(
        'admission',
        widget.mskoolController,
      ),
    );
    attendanceEntryController.isinitialdataloading(false);
  }

  void getSectionData(int asmclId) async {
    attendanceEntryController.issectionloading(true);
    if (selectedAcademicYear == null) {
      Fluttertoast.showToast(msg: 'Select Academic year.');
      attendanceEntryController.issectionloading(false);
      return;
    }
    await attendanceEntryController
        .getSection(
      asmayId: selectedAcademicYear!.asmaYId!.toInt(),
      asmclId: asmclId.toString(),
      miId: widget.loginSuccessModel.mIID!,
      username: widget.loginSuccessModel.userName!,
      roleId: widget.loginSuccessModel.roleId!,
      userId: widget.loginSuccessModel.userId!,
      base: baseUrlFromInsCode(
        'admission',
        widget.mskoolController,
      ),
    )
        .then((value) {
      logger.d(attendanceEntryController.attendanceEntryType.value);
      logger.d(value);
      if (!value || value && attendanceEntryController.sectionList.isEmpty) {
        Fluttertoast.showToast(
            msg:
                'Map The Attendance Entry Type For This Class i.e., Daily /Daily Twice/ Monthly');
      }
    });

    attendanceEntryController.issectionloading(false);
  }

  void getStudentListOnChangeOfMonth(int monthid) async {
    attendanceEntryController.isstudentdataloading(true);
    await attendanceEntryController
        .getAttendanceDataOnchangeofMonth(
      miId: widget.loginSuccessModel.mIID!,
      asmayId: selectedAcademicYear!.asmaYId!.toInt(),
      asmclId: selectedClass!.asmcLId!.toInt(),
      asmsId: selectedSection!.asmSId!,
      monthId: monthid,
      base: baseUrlFromInsCode(
        'admission',
        widget.mskoolController,
      ),
    )
        .then((value) {
      if (!value) {
        logger.d(value);
        attendanceEntryController.isstudentdataloading(false);
        return;
      }
      logger.d(attendanceEntryController.studentList.first);
    });
    attendanceEntryController.isstudentdataloading(false);
  }

  void getStudentListOnChangeOfSection(String asmsId) async {
    await attendanceEntryController
        .getAttendanceDataOnChangeOfSection(
      asmayId: selectedAcademicYear!.asmaYId!.toInt(),
      userId: widget.loginSuccessModel.userId!,
      miId: widget.loginSuccessModel.mIID!,
      username: widget.loginSuccessModel.userName!,
      roleId: widget.loginSuccessModel.roleId!,
      fromDate: todayDate.text,
      asmclId: selectedClass!.asmcLId!.toString(),
      asmsId: asmsId,
      monthFlag: attendanceEntryController.attendanceEntryType.value,
      monthFlag1: attendanceEntryController.attendanceEntryType.value == 'D'
          ? 'Dailyonce'
          : attendanceEntryController.attendanceEntryType.value == 'H'
              ? 'Dailytwice '
              : '',
      base: baseUrlFromInsCode(
        'admission',
        widget.mskoolController,
      ),
    )
        .then(
      (value) {
        logger.d(value);
        logger.d(attendanceEntryController.studentList1.first);
      },
    );
  }

  void getSubjectListAndStudentList(int asmsId) async {
    attendanceEntryController.issubjectloading(true);
    await attendanceEntryController
        .getSubjectAndStudentListOnChangeSection(
      asmayId: selectedAcademicYear!.asmaYId!.toInt(),
      asmclId: selectedClass!.asmcLId.toString(),
      asmsId: asmsId,
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
      logger.d(value);
    });
    attendanceEntryController.issubjectloading(false);
  }

  @override
  void initState() {
    todayDate.text =
        "${DateTime.now().year}/${numberList[DateTime.now().month]}/${numberList[DateTime.now().day]}";
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
                          setState(() {
                            selectedClass = null;
                            selectedSection = null;
                            selectedMonth = null;
                            selectedSubject = null;
                            selectedPeriod = null;
                          });
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
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          isDense: true,
                          label: const CustomDropDownLabel(
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
                          selectedSection = null;
                          selectedMonth = null;
                          getSectionData(s.asmcLId!.toInt());
                        },
                      ),
                    ),
                    attendanceEntryController.isSection.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Container(
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
                            child: DropdownButtonFormField<SectionListValue>(
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
                                  attendanceEntryController.sectionList.length,
                                  (index) {
                                return DropdownMenuItem(
                                  value: attendanceEntryController
                                      .sectionList[index],
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 13, left: 5),
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
                                setState(() {
                                  selectedMonth = null;
                                  selectedSubject = null;
                                  selectedPeriod = null;
                                });

                                if (attendanceEntryController
                                            .attendanceEntryType.value ==
                                        'D' ||
                                    attendanceEntryController
                                            .attendanceEntryType.value ==
                                        'H') {
                                  getStudentListOnChangeOfSection(
                                      s.asmSId.toString());
                                } else if (attendanceEntryController
                                        .attendanceEntryType.value ==
                                    'P') {
                                  getSubjectListAndStudentList(
                                      s.asmSId!.toInt());
                                }
                              },
                            ),
                          ),
                    attendanceEntryController.isSection.value
                        ? const SizedBox()
                        : attendanceEntryController.attendanceEntryType.value ==
                                    'M' &&
                                selectedSection != null
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
                                child: DropdownButtonFormField<MonthListValue>(
                                  value: selectedMonth,
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
                                    hintText: 'Select Month',
                                    floatingLabelBehavior:
                                        FloatingLabelBehavior.always,
                                    label: const CustomDropDownLabel(
                                      icon:
                                          'assets/images/darkbluecalendar.png',
                                      containerColor:
                                          Color.fromRGBO(229, 243, 255, 1),
                                      text: 'Select Month',
                                      textColor:
                                          Color.fromRGBO(62, 120, 170, 1),
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
                                      attendanceEntryController
                                          .monthList.length, (index) {
                                    return DropdownMenuItem(
                                      value: attendanceEntryController
                                          .monthList[index],
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 8, left: 5),
                                        child: Text(
                                          attendanceEntryController
                                              .monthList[index].ivrMMonthName!,
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
                                    selectedMonth = s!;
                                    getStudentListOnChangeOfMonth(
                                        s.ivrMMonthId!.toInt());
                                  },
                                ),
                              )
                            : const SizedBox(),
                    attendanceEntryController.isSection.value
                        ? const SizedBox()
                        : (attendanceEntryController
                                            .attendanceEntryType.value ==
                                        'D' ||
                                    attendanceEntryController
                                            .attendanceEntryType.value ==
                                        'H') &&
                                selectedSection != null
                            ? Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 30),
                                child: CustomContainer(
                                  child: TextField(
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    controller: todayDate,
                                    onTap: () async {
                                      var date = await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime.now(),
                                        lastDate: DateTime.now(),
                                      );
                                      if (date != null) {
                                        setState(() {
                                          todayDate.text =
                                              "${numberList[date.day]}-${numberList[date.month]}-${date.year}";
                                        });
                                      }
                                    },
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      label: Container(
                                        margin:
                                            const EdgeInsets.only(bottom: 20),
                                        child: const CustomDropDownLabel(
                                          icon:
                                              'assets/images/darkbluecalendar.png',
                                          containerColor:
                                              Color.fromRGBO(229, 243, 255, 1),
                                          text: 'Select Date',
                                          textColor:
                                              Color.fromRGBO(62, 120, 170, 1),
                                        ),
                                      ),
                                      hintText: 'Select date.'.tr,
                                      suffixIcon: Image.asset(
                                        'assets/images/darkbluecalendar.png',
                                        color: Colors.black,
                                      ),
                                      floatingLabelBehavior:
                                          FloatingLabelBehavior.always,
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        ),
                                      ),
                                    ),
                                    readOnly: true,
                                  ),
                                ),
                              )
                            : const SizedBox(),
                    attendanceEntryController.isSubject.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : attendanceEntryController.isSection.value
                            ? const SizedBox()
                            : attendanceEntryController
                                            .attendanceEntryType.value ==
                                        'P' &&
                                    selectedSection != null
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
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
                                        PWM.SubjectListValue>(
                                      value: selectedSubject,
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
                                        hintText: 'Select Subject',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        isDense: true,
                                        label: const CustomDropDownLabel(
                                          icon: 'assets/images/selectSub.png',
                                          containerColor:
                                              Color.fromRGBO(229, 243, 255, 1),
                                          text: 'Select Subject',
                                          textColor:
                                              Color.fromRGBO(62, 120, 170, 1),
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
                                          attendanceEntryController
                                              .subjectList.length, (index) {
                                        return DropdownMenuItem(
                                          value: attendanceEntryController
                                              .subjectList[index],
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 13, left: 5),
                                            child: Text(
                                              attendanceEntryController
                                                  .subjectList[index]
                                                  .ismSSubjectName!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .merge(const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.3)),
                                            ),
                                          ),
                                        );
                                      }),
                                      onChanged: (s) {
                                        selectedSubject = s!;
                                        setState(() {});
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                    attendanceEntryController.isSubject.value
                        ? const SizedBox()
                        : attendanceEntryController.isSection.value ||
                                selectedSubject == null
                            ? const SizedBox()
                            : attendanceEntryController
                                            .attendanceEntryType.value ==
                                        'P' &&
                                    selectedSection != null
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 16),
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .scaffoldBackgroundColor,
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
                                        PeriodlistValue>(
                                      value: selectedPeriod,
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
                                        hintText: 'Select Period',
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        label: const CustomDropDownLabel(
                                          icon:
                                              'assets/images/selectPeriod.png',
                                          containerColor:
                                              Color.fromRGBO(238, 232, 255, 1),
                                          text: 'Select Period',
                                          textColor:
                                              Color.fromRGBO(111, 88, 180, 1),
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
                                          attendanceEntryController
                                              .periodList.length, (index) {
                                        return DropdownMenuItem(
                                          value: attendanceEntryController
                                              .periodList[index],
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 13, left: 5),
                                            child: Text(
                                              attendanceEntryController
                                                  .periodList[index]
                                                  .ttmPPeriodName!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelSmall!
                                                  .merge(const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.3)),
                                            ),
                                          ),
                                        );
                                      }),
                                      onChanged: (s) {
                                        selectedPeriod = s!;
                                        setState(() {});
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                    attendanceEntryController.isSubject.value
                        ? const SizedBox()
                        : attendanceEntryController.isSection.value ||
                                selectedPeriod == null
                            ? const SizedBox()
                            : attendanceEntryController
                                            .attendanceEntryType.value ==
                                        'P' &&
                                    selectedSection != null
                                ? SizedBox(
                                    height: 33,
                                    child: RadioListTile(
                                      dense: true,
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8),
                                      visualDensity:
                                          const VisualDensity(horizontal: -4.0),
                                      title: Text(
                                        "Regular",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .merge(const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.0,
                                                letterSpacing: 0.3)),
                                      ),
                                      value: "Regular",
                                      groupValue: selectedRadio,
                                      onChanged: (value) {
                                        setState(() {
                                          selectedRadio = value.toString();
                                        });
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                    attendanceEntryController.isSubject.value
                        ? const SizedBox()
                        : attendanceEntryController.isSection.value ||
                                selectedPeriod == null
                            ? const SizedBox()
                            : attendanceEntryController
                                            .attendanceEntryType.value ==
                                        'P' &&
                                    selectedSection != null
                                ? SizedBox(
                                    height: 33,
                                    child: RadioListTile(
                                      dense: true,
                                      activeColor:
                                          Theme.of(context).primaryColor,
                                      contentPadding:
                                          const EdgeInsets.symmetric(
                                              horizontal: 8),
                                      visualDensity:
                                          const VisualDensity(horizontal: -4.0),
                                      title: Text(
                                        "Extra Period",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .merge(const TextStyle(
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
                                  )
                                : const SizedBox(),
                    const SizedBox(height: 80),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size.fromWidth(180),
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 26, vertical: 14.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        if (attendanceEntryController
                                .attendanceEntryType.value ==
                            'M') {
                          if (selectedMonth == null) {
                            Fluttertoast.showToast(msg: 'Select month');
                          } else if (attendanceEntryController
                              .studentList.isNotEmpty) {
                            Get.to(() =>
                                const MonthWiseAttendanceEntryDetailScreen());
                          } else {
                            Fluttertoast.showToast(
                                msg:
                                    "Please Enter The Number Of Class Held For Particular Month In Master Class Held");
                          }
                        } else if (attendanceEntryController
                                .attendanceEntryType.value ==
                            'D') {
                          if (attendanceEntryController
                              .studentList1.isNotEmpty) {
                            Get.to(() =>
                                const DailyOnceAttendanceEntryDetailScreen());
                          } else {
                            Fluttertoast.showToast(
                                msg: "Something went wrong..");
                          }
                        } else if (attendanceEntryController
                                .attendanceEntryType.value ==
                            'H') {
                          if (attendanceEntryController
                              .studentList1.isNotEmpty) {
                            Get.to(() =>
                                const DailyTwiceAttendanceEntryDetailScreen());
                          } else {
                            Fluttertoast.showToast(
                                msg: "Something went wrong..");
                          }
                        } else if (attendanceEntryController
                                .attendanceEntryType.value ==
                            'P') {
                          if (selectedSubject == null) {
                            Fluttertoast.showToast(msg: "Select Subject.");
                          } else if (selectedPeriod == null) {
                            Fluttertoast.showToast(msg: "Select Peroid.");
                          } else if (attendanceEntryController
                              .studentList2.isNotEmpty) {
                            Get.to(() =>
                                const PeriodWiseAttendanceEntryDetailScreen());
                          } else {
                            Fluttertoast.showToast(msg: "No data available...");
                          }
                        }
                      },
                      child: attendanceEntryController.isStudentData.value
                          ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              'View Details',
                              style:
                                  Theme.of(context).textTheme.labelSmall!.merge(
                                        const TextStyle(
                                          color: Colors.white,
                                          letterSpacing: 0.3,
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                            ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
