import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/hw_cw_section_model.dart';

class HwCwGetSection {
  HwCwGetSection.init();
  static final HwCwGetSection instance = HwCwGetSection.init();

  Future<void> getSections({
    required int miId,
    required int ivrmrtId,
    required int asmayId,
    required int userId,
    required int loginId,
    required int asmclId,
    required String base,
  }) async {
    try {
      final Dio ins = getGlobalDio();
      final String apiUrl = base + URLS.getSection;

      final Response response = await ins
          .post(apiUrl, options: Options(headers: getSession()), data: {
        "MI_Id": miId,
        "Login_Id": loginId,
        "UserId": userId,
        "ivrmrT_Id": ivrmrtId,
        "ASMAY_Id": asmayId,
        "ASMCL_Id": asmclId,
        "IVRMRT_Id": ivrmrtId,
      });
      if (response.data['sectionlist'] == null) {
        return;
      }
      final HwCwSectionListModel sectionListModel =
          HwCwSectionListModel.fromJson(response.data['sectionlist']);
    } on DioError catch (e) {
      logger.e(e.message);
      return;
    } on Exception catch (e) {
      logger.e(e.toString());
      return;
    }
  }
}
