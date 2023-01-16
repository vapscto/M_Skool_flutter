import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/model/academicyeardropdownModel.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/model/classdropdownModel.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/model/sectiondropdownModel.dart';

var dio = Dio();

Future<StudentAttendanceAcademicYearModel?> getStudentAttendanceAcademicYear({
  required String base,
  required int miId,
}) async {
  var url = base + URLS.getStudentAcademicYear;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "MI_Id": miId,
      },
    );
    if (response.statusCode == 200) {
      StudentAttendanceAcademicYearModel academicYearModel =
          StudentAttendanceAcademicYearModel.fromJson(response.data);
      return academicYearModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}

Future<ClassModel?> getStudentAttendanceClass({
  required String base,
  required int miId,
  required int userId,
  required int asmayId,
}) async {
  var url = base + URLS.getStudentClass;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "MI_Id": miId,
        "UserId": userId,
        "ASMAY_Id": asmayId,
      },
    );
    if (response.statusCode == 200) {
      ClassModel classModel = ClassModel.fromJson(response.data);
      return classModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}

Future<SectionModel?> getStudentAttendanceSection({
  required String base,
  required int miId,
  required int userId,
  required int asmayId,
  required int asmclId,
}) async {
  var url = base + URLS.getStudentSection;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "MI_Id": miId,
        "UserId": userId,
        "ASMAY_Id": asmayId,
        "asmcL_Id": asmclId,
        "roleflg": "Staff"
      },
    );
    if (response.statusCode == 200) {
      SectionModel sectionModel = SectionModel.fromJson(response.data);
      return sectionModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}
