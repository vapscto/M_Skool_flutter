import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/timetable/model/student_time_table_model.dart';
import 'package:m_skool_flutter/timetable/model/time_table_load_data_model.dart';

class TTApi {
  TTApi.init();
  static final TTApi instance = TTApi.init();

  Future<StudentTimeTableModel?> getTimeTable({
    required int miId,
    required int asmayId,
    required int asmtId,
    required String base,
  }) async {
    try {
      final Dio ins = getGlobalDio();
      final String api = base + URLS.tt;
      final Response response =
          await ins.post(api, options: Options(headers: getSession()), data: {
        "MI_Id": miId,
        "AMST_Id": asmtId,
        "ASMAY_Id": asmayId,
      });
      if (response.statusCode == 200) {
        logger.d(response.data);
        StudentTimeTableModel studentTimeTable =
            StudentTimeTableModel.fromJson(response.data);
        return studentTimeTable;
      } else {
        Fluttertoast.showToast(msg: 'Unable to fetch data');
        return null;
      }
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }

  Future<TimeTableLoadDataModel?> getTimeTableLoadData({
    required int miId,
    required int asmtId,
    required String base,
  }) async {
    try {
      final Dio ins = getGlobalDio();
      final String api = base + URLS.getloaddata;
      final Response response =
          await ins.post(api, options: Options(headers: getSession()), data: {
        "MI_Id": miId,
        "AMST_Id": asmtId,
      });
      if (response.statusCode == 200) {
        logger.d(response.data);
        TimeTableLoadDataModel timeTableLoadResult =
            TimeTableLoadDataModel.fromJson(response.data);
        return timeTableLoadResult;
      } else {
        Fluttertoast.showToast(msg: 'Unable to fetch data');
        return null;
      }
    } catch (e) {
      logger.e(e.toString());
      return null;
    }
  }
}
