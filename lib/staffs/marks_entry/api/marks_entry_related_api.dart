import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/marks_entry/model/academicyearmodel.dart';
import 'package:m_skool_flutter/staffs/marks_entry/model/classdropdownmodel.dart';
import 'package:m_skool_flutter/staffs/marks_entry/model/examdropdownmodel.dart';
import 'package:m_skool_flutter/staffs/marks_entry/model/sectiondropdownmodel.dart';
import 'package:m_skool_flutter/staffs/marks_entry/model/subjectdropdownmodel.dart';

var dio = Dio();

Future<AcademicYearModel?> getAcademicYearData({
  required int miId,
  required int userId,
  required int roleId,
  required String base,
}) async {
  var url = base + URLS.getacademicYear;

  try {
    var response = await dio.post(url,
        options: Options(
          headers: getSession(),
        ),
        data: {
          "MI_Id": miId,
          "Id": userId,
          "roleid": roleId,
          "stringmobileorportal": "Mobile"
        });
    if (response.statusCode == 200) {
      AcademicYearModel academicYearModel =
          AcademicYearModel.fromJson(response.data);
      return academicYearModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}

Future<ClassDropdownModel?> getClassData({
  required int miId,
  required int asmayId,
  required int userId,
  required String base,
}) async {
  var url = base + URLS.getclass;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "MI_Id": miId,
        "ASMAY_Id": asmayId,
        "Id": userId,
      },
    );
    if (response.statusCode == 200) {
      ClassDropdownModel classDropdownModel =
          ClassDropdownModel.fromJson(response.data);
      return classDropdownModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}

Future<SectionDropdownModel?> getSectionData({
  required int miId,
  required int userId,
  required int asmayId,
  required int asmclId,
  required String base,
}) async {
  var url = base + URLS.getsection;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "MI_Id": miId,
        "ASMAY_Id": asmayId,
        "ASMCL_Id": asmclId,
        "Id": userId
      },
    );
    if (response.statusCode == 200) {
      SectionDropdownModel sectionDropdownModel =
          SectionDropdownModel.fromJson(response.data);
      return sectionDropdownModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}

Future<ExamDropdownModel?> getExamData({
  required int miId,
  required int asmayId,
  required int asmclId,
  required int asmsId,
  required String base,
}) async {
  var url = base + URLS.getexam;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "MI_Id": miId,
        "ASMAY_Id": asmayId,
        "ASMCL_Id": asmclId,
        "ASMS_Id": asmsId,
      },
    );
    if (response.statusCode == 200) {
      ExamDropdownModel examDropdownModel =
          ExamDropdownModel.fromJson(response.data);
      return examDropdownModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}

Future<SubjectDropdownModel?> getsubjectNameData({
  required int miId,
  required int userId,
  required int asmayId,
  required int asmclId,
  required int asmsId,
  required int amstId,
  required int emeId,
  required String base,
}) async {
  var url = base + URLS.getsubjectname;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "MI_Id": miId,
        "ASMAY_Id": asmayId,
        "ASMCL_Id": asmclId,
        "ASMS_Id": asmsId,
        "AMST_Id": amstId,
        "EME_Id": emeId,
        "Id": userId,
      },
    );
    if (response.statusCode == 200) {
      SubjectDropdownModel subjectDropdownModel =
          SubjectDropdownModel.fromJson(response.data);
      return subjectDropdownModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}
