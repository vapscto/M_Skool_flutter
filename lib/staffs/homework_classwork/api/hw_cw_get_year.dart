import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/view_notice/model/view_notice_session_model.dart';

class HwCwGetAcademicYear {
  HwCwGetAcademicYear.init();
  static final HwCwGetAcademicYear instance = HwCwGetAcademicYear.init();

  Future<void> getAcademicYear({
    required int miId,
    required int userId,
    required int loginId,
    required int ivrmrtId,
    required int asmayId,
    required String base,
  }) async {
    try {
      final Dio ins = getGlobalDio();
      final String apiUrl = base + URLS.getHwYear;

      final Response response = await ins
          .post(apiUrl, options: Options(headers: getSession()), data: {
        "MI_Id": miId,
        "userId": userId,
        "login_Id": userId,
        "IVRMRT_Id": ivrmrtId,
        "ASMAY_Id": asmayId
      });

      if (response.data['yearlist'] == null) {
        return;
      }
      final ViewNoticeSessionModel sessionModel =
          ViewNoticeSessionModel.fromJson(response.data['yearlist']);
    } on DioError catch (e) {
      logger.e(e.message);
      return;
    } on Exception catch (e) {
      logger.e(e.toString());
      return;
    }
  }
}
