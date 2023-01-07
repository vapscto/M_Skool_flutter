import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/salary_details/models/salary_detail_monthwise_model.dart';

class SalaryDetailsApi {
  SalaryDetailsApi.init();
  static final SalaryDetailsApi instance = SalaryDetailsApi.init();

  Future<List<SalaryDetailsMonthwiseValues>> getSalary({
    required int miId,
    required int userId,
    required int year,
    required String base,
  }) async {
    final Dio dio = getGlobalDio();
    final String apiUrl = base + URLS.salaryDetailsApi;
    try {
      final Response response = await dio.post(
        apiUrl,
        options: Options(headers: getSession()),
        data: {
          "MI_Id": miId,
          "UserId": userId,
          "HRMLY_LeaveYear": 2022,
        },
      );

      if (response.data['salarylist'] == null) {
        return Future.error({
          "errorTitle": "Data not available",
          "errorMsg":
              "Sorry! but data is not available in the database, Please contact to your technical team to solve this error\n\n Reference: salarylist is null"
        });
      }

      final SalaryDetailsMonthwise monthwise =
          SalaryDetailsMonthwise.fromJson(response.data['salarylist']);

      return Future.value(monthwise.values);
    } on DioError catch (e) {
      logger.e(e.toString());
      return Future.error({
        "errorTitle": "Server Error Occured",
        "errorMsg":
            "While trying to connect to server, server responded with error's. you can try again later"
      });
    } on Exception catch (e) {
      logger.e(e.toString());
      return Future.error({
        "errorTitle": "Something Went wrong",
        "errorMsg":
            "While Creating your view, we encountered an error.. You can try again later",
      });
    }
  }
}
