import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/notice/model/notice_data_model.dart';

class GetTTNoticeApi {
  GetTTNoticeApi.init();
  static final GetTTNoticeApi instance = GetTTNoticeApi.init();

  Future<List<NoticeDataModelValues>> loadTTNotices({
    required int amstId,
    required int miId,
    required int asmayId,
    required int userId,
    required int roleId,
    required String flag,
    required String base,
  }) async {
    final String api = base + URLS.getTTNotice;
    final Dio ins = getGlobalDio();

    try {
      final Response response =
          await ins.post(api, options: Options(headers: getSession()), data: {
        "AMST_Id": amstId,
        "MI_Id": miId,
        "ASMAY_Id": asmayId,
        "User_Id": userId,
        "roleid": roleId,
        "flag": "TT",
        "OnClickOrOnChange": "OnClick",
        "Feecheck": 1,
        "stdupdate": 1,
      });

      final NoticeDataModel noticeDataModel =
          NoticeDataModel.fromJson(response.data['noticelist']);

      return Future.value(noticeDataModel.values);
    } catch (e) {
      logger.e(e.toString());
      return Future.error({
        "errorTitle": "Unexpected Error Occured",
        "errorMsg":
            "Sorry! but we are unable to connect to server right now, or server returned an error.",
      });
    }
  }
}
