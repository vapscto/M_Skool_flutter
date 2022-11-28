import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';

class TTApi {
  TTApi.init();
  static final TTApi instance = TTApi.init();

  getTimeTable({
    required int miId,
    required int asmayId,
    required int asmtId,
    required String base,
  }) async {
    final Dio ins = getGlobalDio();
    final String api = base + URLS.tt;
    final Response response =
        await ins.post(api, options: Options(headers: getSession()), data: {
      "MI_Id": miId,
      "AMST_Id": asmtId,
      "ASMAY_Id": asmayId,
    });
  }
}
