import 'package:dio/dio.dart';
import 'package:m_skool_flutter/model/student_dashboard_model.dart';
import '../constants/api_url_constants.dart';
import '../controller/global_utilities.dart';
import '../main.dart';

Future<StudentDashboardModel> getStudentDashboardData({
  required int miId,
  required int asmayId,
  required int amstId,
  required String base,
}) async {
  var dio = Dio();
  StudentDashboardModel logInData = StudentDashboardModel();
  try {
    final String url = base + URLS.studentDashboard;
    Map<String, dynamic> body = {
      "MI_Id": miId,
      "ASMAY_Id": asmayId,
      "ASMCL_Id": 13,
      "ASMS_Id": 2,
      "AMST_Id": amstId,
    };
    final response = await dio.post(
      url,
      options: Options(
        headers: getSession(),
      ),
      data: body,
    );
    final StudentDashboardModel studentDashboardModel =
        StudentDashboardModel.fromJson(response.data['studetailslist']);
    return Future.value(studentDashboardModel);
  } on Exception catch (e) {
    logger.e(e.toString());
    return Future.error({
      "errorTitle": "Unable to connect to server",
      "errorMsg":
          "Sorry! but we are unable to connect to server, try again later."
    });
  }
}
