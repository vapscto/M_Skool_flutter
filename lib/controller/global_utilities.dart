import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../main.dart';

RxInt currentHomeTab = 0.obs;
RxList<int> previousHomeTab = [0].obs;
RxBool isPageLoading = false.obs;
RxString mobileNumber = "".obs;
RxString passWord = "".obs;
RxInt currentAuthTab = 0.obs;

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
    "cookie": cookieBox!.get("session"),
  };
  return header;
}

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
