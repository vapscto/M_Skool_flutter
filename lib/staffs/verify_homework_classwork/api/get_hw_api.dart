import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/model/verify_hw_model.dart';

class GetHwApi {
  GetHwApi.init();
  static final GetHwApi instance = GetHwApi.init();

  Future<List<VerifyHwListModelValues>> getHwForVerification({
    required int miId,
    required int hrmeId,
    required int loginId,
    required int userId,
    required int ivrmrtId,
    required String roleFlag,
    required int asmayId,
    required int ismsId,
    required int asmclId,
    required int asmsId,
    required String fromDate,
    required String toDate,
    required String base,
  }) async {
    try {
      final Dio ins = getGlobalDio();
      final String api = base + URLS.getHwList;

      final Response response =
          await ins.post(api, options: Options(headers: getSession()), data: {
        "MI_Id": 4,
        "HRME_Id": 28,
        "Login_Id": 43881,
        "UserId": 43881,
        "IVRMRT_Id": 18,
        "Role_flag": "Staff",
        "ASMAY_Id": 82,
        "ISMS_Id": 66,
        "ASMCL_Id": 13,
        "ASMS_Id": 2,
        "fromdate": "2021-01-01",
        "todate": "2023-01-13"
      });

      final VerifyHwListModel hwListModel =
          VerifyHwListModel.fromJson(response.data['gethomework_list']);

      return Future.value(hwListModel.values);
    } on DioError catch (e) {
      logger.e(e.message);
      return Future.error(
          {"errorTitle": "Unexpected Error Occured", "errorMsg": e.message});
    } on Exception catch (e) {
      logger.e(e.toString());
      return Future.error({
        "errorTitle": "Unexpected Error Occured",
        "errorMsg": "An internal error Occured, while creating your view",
      });
    }
  }
}
