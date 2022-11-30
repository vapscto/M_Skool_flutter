import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';

class UploadAssignmentApi {
  UploadAssignmentApi.init();
  static final UploadAssignmentApi instance = UploadAssignmentApi.init();

  uploadNow({
    required int miId,
    required int asmayId,
    required int amstId,
    required int roleId,
    required int userId,
    required int ihwId,
    required List<String> uploadArray,
    required String base,
  }) async {
    final Dio dio = getGlobalDio();
    final uploadApiUrl = base + URLS.uploadHomeWork;
    Uint8List lst = File(uploadArray.first).readAsBytesSync();

    Map<String, dynamic> data = {
      "MI_Id": miId,
      "ASMAY_Id": asmayId,
      "AMST_Id": amstId,
      "UserId": userId,
      "RoleId": roleId,
      "IHW_Id": ihwId,
      "uploaddoc_array": base64Encode(lst),
    };

    logger.d(data);

    Response response = await dio.post(uploadApiUrl,
        options: Options(headers: getSession()), data: data);
    logger.d(response.statusCode);
    if (response.statusCode == 200) {
      logger.d(response.data);
    }
  }
}
