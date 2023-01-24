import 'package:get/get.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/api/attendance_entry_related_api.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/initialdataModel.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/sectionModel.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/studentListModel.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/studentListModel1.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/subjectModel.dart'
    as PWM;

class AttendanceEntryController extends GetxController {
  RxList<AcademicYearListValue> academicYearList =
      <AcademicYearListValue>[].obs;
  RxList<ClassListValue> classList = <ClassListValue>[].obs;
  RxList<SectionListValue> sectionList = <SectionListValue>[].obs;
  RxList<PWM.SubjectListValue> subjectList = <PWM.SubjectListValue>[].obs;
  RxList<PeriodlistValue> periodList = <PeriodlistValue>[].obs;
  RxList<MonthListValue> monthList = <MonthListValue>[].obs;

  RxList<StudentListValues> studentList = <StudentListValues>[].obs;
  RxList<StudentListValuess> studentList1 = <StudentListValuess>[].obs;
  RxList<PWM.StudentListValuess> studentList2 = <PWM.StudentListValuess>[].obs;

  RxString attendanceEntryType = ''.obs;
  RxNum countClassHeld = RxNum(0.0);
  RxInt asaId = RxInt(0);

  RxBool isInitialData = RxBool(false);
  RxBool isSection = RxBool(false);
  RxBool isStudentData = RxBool(false);
  RxBool isSubject = RxBool(false);
  RxBool isSave = RxBool(false);

  void isinitialdataloading(bool loading) async {
    isInitialData.value = loading;
  }

  void issectionloading(bool loading) async {
    isSection.value = loading;
  }

  void isstudentdataloading(bool loading) async {
    isStudentData.value = loading;
  }

  void issubjectloading(bool loading) async {
    isSubject.value = loading;
  }

  void issaveloading(bool loading) async {
    isSave.value = loading;
  }

  Future<bool> getAttendanceEntryInitialData({
    required int asmayId,
    required int userId,
    required int miId,
    required String username,
    required int roleId,
    required String base,
  }) async {
    InitialDataModel? initialDataModel = await getAttendanceEntryIntialData(
        asmayId: asmayId,
        userId: userId,
        miId: miId,
        username: username,
        roleId: roleId,
        base: base);
    try {
      if (initialDataModel!.academicYearList != null ||
          initialDataModel.academicYearList!.values != null) {
        academicYearList.clear();
        for (var i = 0;
            i < initialDataModel.academicYearList!.values!.length;
            i++) {
          academicYearList
              .add(initialDataModel.academicYearList!.values!.elementAt(i)!);
        }
      }

      if (initialDataModel.classList != null ||
          initialDataModel.classList!.values != null) {
        classList.clear();
        for (var i = 0; i < initialDataModel.classList!.values!.length; i++) {
          classList.add(initialDataModel.classList!.values!.elementAt(i)!);
        }
      }

      if (initialDataModel.monthList != null ||
          initialDataModel.monthList!.values != null) {
        monthList.clear();
        for (var i = 0; i < initialDataModel.monthList!.values!.length; i++) {
          monthList.add(initialDataModel.monthList!.values!.elementAt(i)!);
        }
      }

      if (initialDataModel.periodlist != null ||
          initialDataModel.periodlist!.values != null) {
        periodList.clear();
        for (var i = 0; i < initialDataModel.periodlist!.values!.length; i++) {
          periodList.add(initialDataModel.periodlist!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getSection({
    required int asmayId,
    required String asmclId,
    required int miId,
    required String username,
    required int roleId,
    required int userId,
    required String base,
  }) async {
    SectionModel? sectionModel = await getSectionData(
        asmayId: asmayId,
        asmclId: asmclId,
        miId: miId,
        username: username,
        roleId: roleId,
        userId: userId,
        base: base);

    try {
      if (sectionModel!.sectionList != null ||
          sectionModel.sectionList!.values != null) {
        sectionList.clear();
        attendanceEntryType.value = '';
        for (var i = 0; i < sectionModel.sectionList!.values!.length; i++) {
          sectionList.add(sectionModel.sectionList!.values!.elementAt(i)!);
        }
        attendanceEntryType.value = sectionModel.asAAttEntryType!;
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getAttendanceDataOnchangeofMonth({
    required int miId,
    required int asmayId,
    required int asmclId,
    required int asmsId,
    required int monthId,
    required String base,
  }) async {
    StudentListModel? studentListModel = await getAttendanceDataOnChangeofMonth(
        miId: miId,
        asmayId: asmayId,
        asmclId: asmclId,
        asmsId: asmsId,
        monthId: monthId,
        base: base);
    studentList.clear();
    try {
      if (studentListModel!.studentList != null ||
          studentListModel.studentList!.values != null) {
        for (var i = 0; i < studentListModel.studentList!.values!.length; i++) {
          studentList.add(studentListModel.studentList!.values!.elementAt(i)!);
        }
        countClassHeld.value = studentListModel.countclass!;
        asaId.value = studentListModel.asAId!;
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getAttendanceDataOnChangeOfSection({
    required int asmayId,
    required int userId,
    required int miId,
    required String username,
    required int roleId,
    required String fromDate,
    required String asmclId,
    required String asmsId,
    required String monthFlag,
    required String monthFlag1,
    required String base,
  }) async {
    StudentListModel1? studentListModel1 = await onChangeOfSection(
        asmayId: asmayId,
        userId: userId,
        miId: miId,
        username: username,
        roleId: roleId,
        fromDate: fromDate,
        asmclId: asmclId,
        asmsId: asmsId,
        monthFlag: monthFlag,
        monthFlag1: monthFlag1,
        base: base);

    try {
      if (studentListModel1!.studentList != null ||
          studentListModel1.studentList!.values != null) {
        studentList1.clear();
        for (var i = 0;
            i < studentListModel1.studentList!.values!.length;
            i++) {
          studentList1
              .add(studentListModel1.studentList!.values!.elementAt(i)!);
        }
        asaId.value = studentListModel1.asAId!;
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getSubjectAndStudentListOnChangeSection({
    required int asmayId,
    required String asmclId,
    required int asmsId,
    required int userId,
    required int miId,
    required String username,
    required int roleId,
    required String base,
  }) async {
    PWM.SubjectModel? subjectModel = await onChangeSection(
        asmayId: asmayId,
        asmclId: asmclId,
        asmsId: asmsId,
        userId: userId,
        miId: miId,
        username: username,
        roleId: roleId,
        base: base);
    try {
      if (subjectModel!.subjectList != null ||
          subjectModel.subjectList!.values != null) {
        subjectList.clear();
        for (var i = 0; i < subjectModel.subjectList!.values!.length; i++) {
          subjectList.add(subjectModel.subjectList!.values!.elementAt(i)!);
        }
      }
      if (subjectModel.studentList != null ||
          subjectModel.studentList!.values != null) {
        studentList2.clear();
        for (var i = 0; i < subjectModel.studentList!.values!.length; i++) {
          studentList2.add(subjectModel.studentList!.values!.elementAt(i)!);
        }
        asaId.value = subjectModel.asAId!;
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }
}
