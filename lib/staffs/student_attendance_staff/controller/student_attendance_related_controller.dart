import 'package:get/get.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/model/academicyeardropdownModel.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/model/classdropdownModel.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/model/sectiondropdownModel.dart';

import '../api/student_attendance_related_api.dart';

class StudentAttendanceController extends GetxController {
  RxList<StudentAttendanceYearlistValue> academicYearList =
      <StudentAttendanceYearlistValue>[].obs;
  RxList<ClasslistValue> classList = <ClasslistValue>[].obs;
  RxList<SectionListValue> sectionList = <SectionListValue>[].obs;

  RxBool isAcademicYear = RxBool(false);
  RxBool isClass = RxBool(false);
  RxBool isSection = RxBool(false);

  void isacademicyearloading(bool loading) {
    isAcademicYear.value = loading;
  }

  void isclassloading(bool loading) {
    isClass.value = loading;
  }

  void issectionloading(bool loading) {
    isSection.value = loading;
  }

  Future<bool> getAcademicYear({
    required String base,
    required int miId,
  }) async {
    StudentAttendanceAcademicYearModel? academicYearModel =
        await getStudentAttendanceAcademicYear(base: base, miId: miId);

    try {
      if (academicYearModel!.yearlist != null ||
          academicYearModel.yearlist!.values != null) {
        academicYearList.clear();
        for (var i = 0; i < academicYearModel.yearlist!.values!.length; i++) {
          academicYearList
              .add(academicYearModel.yearlist!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getClass({
    required String base,
    required int miId,
    required int userId,
    required int asmayId,
  }) async {
    ClassModel? classModel = await getStudentAttendanceClass(
        base: base, miId: miId, userId: userId, asmayId: asmayId);

    try {
      if (classModel!.classlist != null ||
          classModel.classlist!.values != null) {
        classList.clear();
        for (var i = 0; i < classModel.classlist!.values!.length; i++) {
          classList.add(classModel.classlist!.values!.elementAt(i)!);
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
    required String base,
    required int miId,
    required int userId,
    required int asmayId,
    required int asmclId,
  }) async {
    SectionModel? sectionModel = await getStudentAttendanceSection(
        base: base,
        miId: miId,
        userId: userId,
        asmayId: asmayId,
        asmclId: asmclId);

    try {
      if (sectionModel!.sectionList != null ||
          sectionModel.sectionList!.values != null) {
        sectionList.clear();
        for (var i = 0; i < sectionModel.sectionList!.values!.length; i++) {
          sectionList.add(sectionModel.sectionList!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }
}
