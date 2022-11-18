import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/library/model/library_data_model.dart';
import 'package:m_skool_flutter/main.dart';

class LibraryDataApi {
  LibraryDataApi.init();
  static final LibraryDataApi instance = LibraryDataApi.init();

  Future<List<LibraryDetailsValues>> getLibraryData(
      int miId, int asmayId, int asmtId, String base) async {
    final Dio ins = getGlobalDio();
    String apiUrl = base + URLS.lib;
    // logger.d(apiUrl);
    // logger.d(getSession());

    try {
      Response response = await ins.post(
        apiUrl,
        options: Options(headers: getSession()),
        data: {
          "mI_ID": miId,
          "ASMAY_Id": asmayId,
          "AMST_Id": asmtId,
        },
      );
      // logger.d(response.data);

      LibraryDataModel libDataModel = LibraryDataModel.fromJson(response.data);

      return Future.value(libDataModel.librarydetails!.values!);
    } on Exception catch (e) {
      logger.e(e.toString());
      return Future.error(
        {
          "errorTitle": "Unexpected Error Occured",
          "errorMsg":
              "While fetching your library details we encounterd an error",
        },
      );
    }
  }
}
