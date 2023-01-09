import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/hw_cw_subject_model.dart';

class HwCwGetSubjectsApi {
  HwCwGetSubjectsApi.init();
  final HwCwGetSubjectsApi instance = HwCwGetSubjectsApi.init();

  Future<void> getSubjects({
    required int miId,
    required int asmayId,
    required int asmclId,
    required List<Map<String, dynamic>> sections,
    required int ivrmrtId,
    required int loginId,
    required String base,
  }) async {
    final Dio ins = getGlobalDio();
    final String apiUrl = base + URLS.getSubjects;

    try {
      final Response response = await ins.post(
        apiUrl,
        options: Options(headers: getSession()),
        data: {
          "MI_Id": miId,
          "Login_Id": loginId,
          "ASMAY_Id": asmayId,
          "ASMCL_Id": asmclId,
          "hm_section_list": sections,
          "IVRMRT_Id": ivrmrtId,
        },
      );
      if (response.data['subjectlist'] == null) {
        return;
      }
      final HwCwSubjectListModel subjectListModel =
          HwCwSubjectListModel.fromJson(response.data['subjectlist']);
    } on DioError catch (e) {
      logger.e(e.message);
      return;
    } on Exception catch (e) {
      logger.e(e.toString());
      return;
    }
  }
}
