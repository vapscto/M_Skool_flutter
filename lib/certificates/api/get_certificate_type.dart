import 'package:dio/dio.dart';
import 'package:m_skool_flutter/certificates/model/certificate_drop_down.dart';
import 'package:m_skool_flutter/certificates/model/get_cert_data_model.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';

class GetCertificateType {
  GetCertificateType.init();
  static final GetCertificateType instance = GetCertificateType.init();

  Future<CertificateDropDown> getCertificateType({
    required int miId,
    required int asmayId,
    required int ivrmrtId,
    required int amstId,
    required String baseUrl,
  }) async {
    final String apiUrl = baseUrl + URLS.getCertitificateType;
    final Dio ins = getGlobalDio();
    try {
      Response response = await ins
          .post(apiUrl, options: Options(headers: getSession()), data: {
        "MI_Id": miId,
        "ASMAY_Id": asmayId,
        "IVRMRT_Id": ivrmrtId,
        "AMST_Id": amstId,
        "flag": "Student"
      });

      final GetCertificateDataModel dataModel =
          GetCertificateDataModel.fromJson(response.data);

      return Future.value(dataModel.certificateDropdown);
    } on Exception catch (e) {
      logger.e(e.toString());
      return Future.error(
        {
          "errorMsg":
              "An error occured while fetching the list of certificate you can apply for.",
        },
      );
    }
  }
}
