import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/hw_cw_classes_model.dart';

class HwCwGetClassApi {
  HwCwGetClassApi.init();
  static final HwCwGetClassApi instance = HwCwGetClassApi.init();

  Future<void> getHwCwClasses({
    required int miId,
    required int loginId,
    required int asmayId,
    required int ivrmrtId,
    required String base,
  }) async {
    try {
      final Dio ins = getGlobalDio();
      final String apiUrl = base + URLS.getHwClass;

      final Response response = await ins
          .post(apiUrl, options: Options(headers: getSession()), data: {
        "MI_Id": miId,
        "Login_Id": loginId,
        "ASMAY_Id": asmayId,
        "IVRMRT_Id": ivrmrtId,
      });

      if (response.data['classlist'] == null) {
        return;
      }
      final HwCwClassesListModel classes =
          HwCwClassesListModel.fromJson(response.data['classlist']);
    } on DioError catch (e) {
      logger.e(e.message);
      return;
    } on Exception catch (e) {
      logger.e(e.toString());
      return;
    }
  }
}
