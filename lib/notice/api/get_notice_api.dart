import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/notice/model/notice_data_model.dart';

class GetNoticeApi {
  GetNoticeApi.init();
  static final GetNoticeApi instance = GetNoticeApi.init();

  Future<List<NoticeDataModelValues>> getNotice({
    required int miId,
    required int asmayId,
    required int amstId,
    required String baseUrl,
  }) async {
    final Dio ins = getGlobalDio();
    String noticeApi = baseUrl + URLS.getNotice;

    try {
      Response response = await ins.post(
        noticeApi,
        options: Options(headers: getSession()),
        data: {
          "MI_Id": miId,
          "ASMAY_Id": asmayId,
          "AMST_Id": amstId,
          "flag": "O",
        },
      );
      final NoticeDataModel noticeDataModel =
          NoticeDataModel.fromJson(response.data['noticelist']);

      logger.d(noticeDataModel.toJson());

      return Future.value(noticeDataModel.values);
    } on Exception catch (e) {
      logger.e(e.toString());
      return Future.error(
        {
          "errorTitle": "Unable to Connect Server",
          "errorMsg":
              "Sorry, but we are unable to connect to server, try again later",
        },
      );
    }
  }
}
