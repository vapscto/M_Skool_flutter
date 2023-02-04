import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/manager/controller/manager_dashboard_controller.dart';
import 'package:m_skool_flutter/manager/model/manager_dashboard_fee_details.dart';
import 'package:m_skool_flutter/manager/model/manager_dashboard_leaves_details.dart';
import 'package:m_skool_flutter/manager/model/manager_dashboard_preadmission.dart';

class ManagerDashboardApi {
  ManagerDashboardApi.init();
  static final ManagerDashboardApi instance = ManagerDashboardApi.init();

  getDashboardData({
    required int miId,
    required int asmayId,
    required String base,
    required ManagerDashboardController dashboardController,
  }) async {
    final Dio ins = getGlobalDio();
    final String api = base + URLS.managerDashboard;
    try {
      final Response response = await ins.post(api,
          options: Options(headers: getSession()),
          data: {"MI_Id": miId, "ASMAY_Id": asmayId});

      if (response.data['managerDashboardCOE'] != null) {}
      if (response.data['managerDashboardLeaveDetails'] != null) {
        final ManagerDashboardLeaveDetails leaves =
            ManagerDashboardLeaveDetails.fromJson(
                response.data['managerDashboardLeaveDetails']);
        dashboardController.updateDashboardLeave(leaves.values!);
      }
      if (response.data['managerDashboardFeesDetails'] != null) {
        final ManagerDashboardFeeDetails feeDetails =
            ManagerDashboardFeeDetails.fromJson(
                response.data['managerDashboardFeesDetails']);

        dashboardController.updateDashboardFeeDetails(feeDetails.values!);
      }
      if (response.data['managerDashboardPreadmissionDetails'] != null) {
        final ManagerDashboardPreadmissionDetails preadmissionDetails =
            ManagerDashboardPreadmissionDetails.fromJson(
                response.data['managerDashboardPreadmissionDetails']);
        dashboardController
            .updateDashboardPreAdmission(preadmissionDetails.values!);
      }
    } on DioError catch (e) {
      logger.e(e.stackTrace);
    } on Exception catch (e) {
      logger.e(e.toString());
    }
  }
}
