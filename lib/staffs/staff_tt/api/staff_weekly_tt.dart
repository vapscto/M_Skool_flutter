import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';

class StaffWeeklyTTApi {
  StaffWeeklyTTApi.init();
  static final StaffWeeklyTTApi instance = StaffWeeklyTTApi.init();

  getWeeklyTT({
    required int miId,
    required int asmayId,
    required int userId,
    required String base,
  }) async {
    final String api = base + URLS.getWeeklyTT;
    final Dio ins = getGlobalDio();
    final Response response =
        await ins.post(api, options: Options(headers: getSession()), data: {
      "MI_Id": miId,
      "UserId": userId,
      "ASMAY_Id": asmayId,
    });
  }
}
