import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';

import '../../main.dart';
import '../model/unread_model.dart';

var dio = Dio();
Future<UnreadDataModel?> getUnreadData({
  required int miId,
  required int asmayId,
  required int userId,
  required String base,
}) async {
  var url = base + URLS.getUnreadData;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "ISMINT_Id": 812,
        "IVRMRT_Id": 7,
        "MI_Id": miId,
        "ASMAY_Id": asmayId,
        "UserId": userId
      },
    );
    if (response.statusCode == 200) {
      UnreadDataModel unreadDataModel = UnreadDataModel.fromJson(response.data);
      return unreadDataModel;
    } else {
      return null;
    }
  } catch (e) {
    logger.d(e.toString());
    return null;
  }
}
