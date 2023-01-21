import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/initialdataModel.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/sectionModel.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/studentListModel.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/studentListModel1.dart';

var dio = Dio();
Future<InitialDataModel?> getAttendanceEntryIntialData({
  required int asmayId,
  required int userId,
  required int miId,
  required String username,
  required int roleId,
  required String base,
}) async {
  var url = base + URLS.getAttendanceInitialData;
  // logger.d(asmayId);
  // logger.d(userId);
  // logger.d(miId);
  // logger.d(username);
  // logger.d(roleId);
  // logger.d(url);
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "ASMAY_Id": asmayId,
        "userId": userId,
        "MI_Id": miId,
        "username": username,
        "flag": "staff",
        "roleId": roleId
      },
    );
    if (response.statusCode == 200) {
      InitialDataModel initialDataModel =
          InitialDataModel.fromJson(response.data);
      return initialDataModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}

Future<SectionModel?> getSectionData({
  required int asmayId,
  required String asmclId,
  required int miId,
  required String username,
  required int roleId,
  required int userId,
  required String base,
}) async {
  var url = base + URLS.onChangeClass;
  logger.d(asmayId);
  logger.d(asmclId);
  logger.d(miId);
  logger.d(username);
  logger.d(roleId);
  logger.d(userId);

  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "ASMAY_Id": asmayId,
        "ASMCL_Id": asmclId,
        "MI_Id": miId,
        "classsecflag": 1,
        "username": username,
        "roleId": roleId,
        "flag": "S",
        "userId": userId
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

Future<StudentListModel?> getAttendanceDataOnChangeofMonth({
  required int miId,
  required int asmayId,
  required int asmclId,
  required int asmsId,
  required int monthId,
  required String base,
}) async {
  var url = base + URLS.onChangeMonth;
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
        "monthflag": "M",
        "monthflag1": "monthly",
        "monthid": monthId
      },
    );
    if (response.statusCode == 200) {
      StudentListModel studentListModel =
          StudentListModel.fromJson(response.data);
      return studentListModel;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}

Future<StudentListModel1?> onChangeOfSection({
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
  var url = base + URLS.onChangeClass;
  logger.d(fromDate);
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "ASMAY_Id": asmayId,
        "userId": userId,
        "MI_Id": miId,
        "username": username,
        "flag": "staff",
        "roleId": roleId,
        "ASA_FromDate": fromDate,
        "ASMCL_Id": asmclId,
        "ASMS_Id": asmsId,
        "checksubject": "1",
        "monthflag": monthFlag,
        "monthflag1": monthFlag1,
      },
    );
    if (response.statusCode == 200) {
      StudentListModel1 studentListModel1 =
          StudentListModel1.fromJson(response.data);
      return studentListModel1;
    }
    return null;
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}


/// api call for subjectlist model is done
