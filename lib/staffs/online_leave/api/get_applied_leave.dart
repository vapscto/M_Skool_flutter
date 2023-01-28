import 'package:dio/dio.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';

class GetAppliedLeave {
  GetAppliedLeave.init();
  static final GetAppliedLeave instance = GetAppliedLeave.init();

  getAppliedLeave({
    required int miId,
    required int userId,
    required String base,
  }) async {
    final Dio ins = getGlobalDio();
  }
}
