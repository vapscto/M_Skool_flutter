import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';

class AuthenticateUserApi {
  AuthenticateUserApi.init();
  static AuthenticateUserApi instance = AuthenticateUserApi.init();

  Future<LoginSuccessModel> authenticateNow(
      String userName, String password, int miId, String loginBaseUrl) async {
    final Dio ins = getGlobalDio();
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    String loginApiUrl = loginBaseUrl + URLS.login;
    String mobileUniqueID = "";
    if (Platform.isAndroid) {
      AndroidDeviceInfo deviceInfo = await deviceInfoPlugin.androidInfo;
      mobileUniqueID = deviceInfo.id;
      //debugPrint(deviceInfo.toString());
    } else {
      IosDeviceInfo deviceInfo = await deviceInfoPlugin.iosInfo;
      deviceInfo.identifierForVendor!;
    }

    Response response = await ins.post(loginApiUrl, data: {
      "MI_Id": miId,
      "username": userName,
      "password": password,
      "Logintype": "Mobile",
      "mobiledeviceid": mobileUniqueID,
    });

    if (response.data['message'] != null) {
      return Future.error({
        "errorTitle": response.data['message'],
        "errorMsg": "I think your${response.data['message']}.",
      });
    }

    final LoginSuccessModel loginSuccessModel =
        LoginSuccessModel.fromJson(response.data);
    //logger.d(loginSuccessModel.toJson());
    logger.d(loginSuccessModel.roleId);
    cookieBox!.put("cookie", response.headers.map['set-cookie']![0]);
    await importantIds!.put(URLS.miId, loginSuccessModel.mIID);
    await importantIds!.put(URLS.userId, loginSuccessModel.userId);

    await importantIds!.put(URLS.asmayId, loginSuccessModel.asmaYId);
    await importantIds!.put(URLS.ivrmrtId, 0);
    await importantIds!.put(URLS.amstId, loginSuccessModel.amsTId);
    await logInBox!.put("userName", userName);
    await logInBox!.put("password", password);
    // await logInBox!.put("logBasUrl", loginBaseUrl);
    return Future.value(loginSuccessModel);
  }
}
