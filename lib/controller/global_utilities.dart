import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/categories_api_item.dart';

import '../main.dart';

RxInt currentHomeTab = 0.obs;
RxList<int> previousHomeTab = [0].obs;
RxBool isPageLoading = false.obs;
RxString mobileNumber = "".obs;
RxString passWord = "".obs;
RxInt currentAuthTab = 0.obs;

Dio? dio;

Dio getGlobalDio() {
  dio ??= Dio();
  return dio!;
}

Future<bool> checkConnectivity() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

Map<String, dynamic> getSession() {
  Map<String, dynamic> header = {
    "Cookie": cookieBox!.get("cookie"),
  };
  return header;
}

// Map<String,dynamic> getInsSession(){
//   Map<String, dynamic> header = {
//     "cookie": cookieBox!.get("session"),
//   };
//   return header;
// }

DateTime getDateTimeFromSeconds(
  int seconds,
) {
  return DateTime.fromMillisecondsSinceEpoch(seconds * 1000);
}

// String getTimeFromSecond(int seconds, {bool withTime = false}) {
//   String time = "";
//   time =
//       "${(withTime) ? DateTime.fromMillisecondsSinceEpoch(seconds * 1000).hour : ""}${(withTime) ? ":" : ""}${(withTime) ? numberList.elementAt(DateTime.fromMillisecondsSinceEpoch(seconds * 1000).minute) : ""}${(withTime) ? "," : ""}${DateTime.fromMillisecondsSinceEpoch(seconds * 1000).day} ${months.elementAt(DateTime.fromMillisecondsSinceEpoch(seconds * 1000).month - 1)} ${DateTime.fromMillisecondsSinceEpoch(seconds * 1000).year}";
//   return time;
// }

toCapitalized(String value) {
  return value.capitalize;
}

String baseUrlFromInsCode(String pageName, MskoolController mskoolController) {
  for (int i = 0;
      i < mskoolController.universalInsCodeModel!.value.apiarray.values.length;
      i++) {
    final CategoriesApiItem api = mskoolController
        .universalInsCodeModel!.value.apiarray.values
        .elementAt(i);
    if (api.iivrscurLAPIName.toLowerCase() == pageName) {
      return api.iivrscurLAPIURL;
    }
  }
  return "";
}

String getDashBoardIconByName(String title) {
  String returnValue = "assets/images/";
  switch (title) {
    case "Student Attendance":
      returnValue += "Attendance.png";
      break;
    case "Fee Details":
      returnValue += "FeeReceipt.png";
      break;
    case "Online Fee Payment":
      returnValue += "OnlinePayment.png";
      break;
    case "Fee Analysis":
      returnValue += "FeeAnalysis.png";
      break;
    case "Classwork":
      returnValue += "Classwork.png";
      break;
    case "Homework":
      returnValue += "Homework.png";
      break;
    case "COE":
      returnValue += "Coe.png";
      break;
    case "Student Notice Board":
      returnValue += "Noticeboard.png";
      break;
    case "Library":
      returnValue += "Library.png";
      break;
    case "Syllabus":
      returnValue += "Attendance.png";
      break;
    case "Exam":
      returnValue += "exam.png";
      break;
    case "Interaction":
      returnValue += "Interaction.png";
      break;
    case "Apply Certificate":
      returnValue += "Certificate.png";
      break;
    case "Time Table":
      returnValue += "Timetable.png";
      break;
    case "Fee Receipt":
      returnValue += "FeeReceipt.png";
      break;
    default:
      returnValue += "Timetable.png";
  }
  return returnValue;
}
