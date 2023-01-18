import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/initialdataModel.dart';

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
  logger.d(asmayId);
  logger.d(userId);
  logger.d(miId);
  logger.d(username);
  logger.d(roleId);
  logger.d(url);
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
