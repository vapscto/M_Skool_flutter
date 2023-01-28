import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/model/nb_attachment_model.dart';

class GetNbAttachmentApi {
  GetNbAttachmentApi.init();
  static final GetNbAttachmentApi instance = GetNbAttachmentApi.init();

  Future<List<NBAttachmentModelValues>> getNbAtt({
    required int intbId,
    required String base,
  }) async {
    final String url = base + URLS.getNbAttachment;
    final Dio ins = getGlobalDio();
    debugPrint(
      "INTB_Id $intbId",
    );
    try {
      final Response response =
          await ins.post(url, options: Options(headers: getSession()), data: {
        "INTB_Id": intbId,
      });

      final NBAttachmentModel nbAttachmentModel =
          NBAttachmentModel.fromJson(response.data['attachementlist']);

      return Future.value(nbAttachmentModel.values);

      logger.d(response.data);
    } on DioError catch (e) {
      return Future.error({
        "errorTitle": "Unexpected Error Occured",
        "errorMsg": e.message,
      });
    } on Exception catch (e) {
      logger.e(e.toString());
      return Future.error({
        "errorTitle": "Unexpected Error Occured",
        "errorMsg": "An internal error Occured while loading attachment's"
      });
    }
  }
}
