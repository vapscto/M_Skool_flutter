import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/controller/dashboard_controller.dart';
import 'package:m_skool_flutter/staffs/model/dashboard_leave_model.dart';
import 'package:m_skool_flutter/staffs/model/dashboard_lop_model.dart';

class StaffDashboardApi {
  StaffDashboardApi.init();
  static final StaffDashboardApi instance = StaffDashboardApi.init();

  loadDashboard(
      {required int miId,
      required int userId,
      required String base,
      required StaffDashboardController controller}) async {
    final String apiUrl = base + URLS.staffDashboard;
    final Dio ins = getGlobalDio();

    try {
      if (controller.isErrorOccured.value) {
        controller.updateIsErrorOccured(false);
      }

      controller.updateIsLoading(true);

      final Response response = await ins.post(
        apiUrl,
        options: Options(headers: getSession()),
        data: {"MI_Id": miId, "UserId": userId},
      );
      if (response.data['leaveDetails'] != null) {
        controller.updateDashboardLeaves(
            DashboardLeaveModel.fromJson(response.data['leaveDetails'])
                .values!);
      }

      if (response.data['lopDetails'] != null) {
        controller.updateDashboardLop(
            DashboardLopModel.fromJson(response.data['lopDetails']).values!);
      }

      if (response.data['punchDetails'] != null) {}

      if (response.data['calList'] != null) {}

      if (response.data['timeTableDetails'] != null) {}
    } on DioError catch (e) {
      logger.d(e.message);
    } on Exception catch (e) {
      logger.d(e.toString());
    }
  }
}
