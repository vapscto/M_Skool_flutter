import 'package:dio/dio.dart';
import 'package:m_skool_flutter/coe/models/academic_year_model.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';

class GetAcademicYearApi {
  GetAcademicYearApi.init();
  static final GetAcademicYearApi instance = GetAcademicYearApi.init();
  Future<List<AttyearlistValues>> getAcademicYear({
    required int miId,
    required int amstId,
    required String base,
  }) async {
    final Dio ins = getGlobalDio();
    String getAcadmeicApiUrl = base + URLS.getAcademicYear;
    try {
      Response response = await ins.post(
        getAcadmeicApiUrl,
        options: Options(headers: getSession()),
        data: {
          "mI_ID": miId,
          "AMST_Id": amstId,
        },
      );

      //logger.d(response.data);

      AcademicYearModel academicYearModel =
          AcademicYearModel.fromJson(response.data);

      return Future.value(academicYearModel.attyearlist!.values!);
    } on Exception catch (e) {
      logger.e(e);
      return Future.error(
        {
          "errorTitle": "Unable to connect to server",
          "errorMsg": "Sorry! we are unable to connect you to server",
        },
      );
    }
    //logger.d(academicYearModel.toJson());
  }
}
