import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/interaction/model/message_model.dart';
import 'package:m_skool_flutter/main.dart';

var dio = Dio();

Future<MessageModel?> getMessages({
  required int ismintId,
  required int miId,
  required int asmayId,
  required int userId,
  required String base,
}) async {
  var url = base + URLS.getMessages;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "ISMINT_Id": ismintId,
        "IVRMRT_Id": 7,
        "MI_Id": miId,
        "ASMAY_Id": asmayId,
        "UserId": userId
      },
    );
    if (response.statusCode == 200) {
      MessageModel messageModel = MessageModel.fromJson(response.data);
      return messageModel;
    } else {
      return null;
    }
  } catch (e) {
    logger.i(e.toString());
    return null;
  }
}

Future<bool> sendMessage({
  required int miId,
  required int amstId,
  required int asmayId,
  required String message,
  required int istintComposedByFlg,
  required int ismintId,
  required int userId,
  required String image,
  required String base,
}) async {
  var url = base + URLS.sendMessage;
  try {
    var response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: {
        "mI_ID": miId,
        "AMST_Id": amstId,
        "ASMAY_Id": asmayId,
        "ISTINT_Interaction": message,
        "IINTSS_Date": DateTime.now().toIso8601String(),
        "ISTINT_ComposedByFlg": istintComposedByFlg,
        "ISMINT_Id": ismintId,
        "UserId": userId,
        "IVRMRT_Id": 7,
        "images_paths": image
      },
    );
    if (response.statusCode == 200) {
      logger.d('true');
      return true;
    }
    logger.d('false');
    return false;
  } catch (e) {
    logger.d(e.toString());
    return false;
  }
}