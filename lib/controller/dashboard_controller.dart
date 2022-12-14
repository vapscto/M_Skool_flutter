import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../apis/authentication_api.dart';
import 'global_utilities.dart';

class DashboardController extends GetxController {
  Future<bool> logout() async {
    if (await checkConnectivity()) {
      var value = await LoginServices.logout();
      if (value!.data!.responseCode == 108) {
        Fluttertoast.showToast(msg: "Couldn't logout".tr);
        return false;
      } else if (value.data!.responseCode == 109) {
        Fluttertoast.showToast(msg: "Logged out successfully".tr);
        return true;
      } else {
        Fluttertoast.showToast(msg: "Couldn't logout".tr);
        return false;
      }
    } else {
      Fluttertoast.showToast(msg: "Not connected to internet".tr);
      return false;
    }
  }
}
