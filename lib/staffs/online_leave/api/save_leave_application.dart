import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';

class SaveLeaveApplication {
  SaveLeaveApplication.init();
  static final SaveLeaveApplication instance = SaveLeaveApplication.init();

  Future<bool> saveNow({
    required int miId,
    required int userId,
    required int asmayId,
    required String applicationDate,
    required int contactNoOnLeave,
    required String leaveReason,
    required String reportingDate,
    required String supportingDocument,
    required List<Map<String, dynamic>> frmToDate,
    required List<Map<String, dynamic>> temp,
    required String base,
  }) async {
    final Dio ins = getGlobalDio();
    final String apiUrl = base + URLS.saveLeave;
    try {
      final Response response = await ins
          .post(apiUrl, options: Options(headers: getSession()), data: {
        "HRELAP_ApplicationDate": applicationDate,
        "HRELAP_ContactNoOnLeave": contactNoOnLeave,
        "HRELAP_LeaveReason": leaveReason,
        "HRELAP_ReportingDate": reportingDate,
        "HRELT_SupportingDocument": "undefined",
        "MI_Id": miId,
        "UserId": "$userId",
        "asmay_id": asmayId,
        "frmToDates": frmToDate,
        "temp_table_data": temp
      });

      if (response.statusCode == 200) {
        return Future.value(true);
      }

      return Future.error({
        "errorTitle": "Something went wrong",
        "errorMsg": "Server didn't responded correctly for this request"
      });
    } on DioError catch (e) {
      logger.e(e.message);
      logger.e(e.stackTrace);
      return Future.error({
        "errorTitle": "Something went wrong",
        "errorMsg": e.message,
      });
    }
  }
}
