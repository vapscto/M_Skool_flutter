import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';

class MessagingApi {
  MessagingApi._internal();
  final logger = Logger();
  static final MessagingApi instance = MessagingApi._internal();

  getInbox(String pageName, MskoolController mskoolController) async {
    final dio = Dio();
    // baseUrlFromInsCode()
    try {
      await dio.post("");
    } on DioError catch (e) {
      logger.d(e.message);
    } catch (e) {
      logger.d(e.toString());
    }
  }
}
