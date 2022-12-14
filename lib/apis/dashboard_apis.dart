import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:m_skool_flutter/model/student_dashboard_model.dart';
import '../constants/api_url_constants.dart';
import '../controller/global_utilities.dart';
import '../main.dart';

class LoginServices {
  static Future<StudentDashboardModel?> login(
      {required String mobileNumber,
      required String passWord,
      required String hashCode}) async {
    var dio = Dio();
    StudentDashboardModel logInData = StudentDashboardModel();
    try {
      Map<String, String> body = {
        "email": mobileNumber,
        "password": passWord,
        "hashCode": hashCode
      };
      final response = await dio.post(
        URLS.base + URLS.userPath + URLS.passWordLogin,
        options: Options(
          headers: getSession(),
        ),
        data: body,
      );
      if (response.statusCode == 200) {
        cookieBox!.put("session", response.headers.map['set-cookie']?[0]);
        logInData = StudentDashboardModel.fromJson(response.data);
      }
    } catch (e) {
      isPageLoading.value = false;
      Fluttertoast.showToast(msg: "Something went wrong");
      logger.e(e);
    }
    return logInData;
  }
}
