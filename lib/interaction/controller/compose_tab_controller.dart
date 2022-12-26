import 'package:get/get.dart';
import 'package:m_skool_flutter/interaction/apis/compose_tab_related_api.dart';
import 'package:m_skool_flutter/interaction/model/staff_detail_model.dart';

import '../../main.dart';

class ComposeController extends GetxController {
  RxList<GetdetailsValue> staffList = <GetdetailsValue>[].obs;
  RxBool isLoading = RxBool(false);
  RxBool isInteractionLoading = RxBool(true);
  RxBool isSend = RxBool(false);
  RxBool isButton = RxBool(true);

  void isbutton(bool loading) {
    isButton.value = loading;
  }

  void isloading(bool loading) {
    isLoading.value = loading;
  }

  void issend(bool loading) {
    isSend.value = loading;
  }

  void isInteractionloading(bool loading) async {
    isInteractionLoading.value = loading;
    await Future.delayed(Duration(milliseconds: 3));
  }

  Future<bool> getStafflist({
    required int miId,
    required int amstId,
    required int asmayId,
    required int userId,
    required String key,
    required String base,
  }) async {
    try {
      StaffDetailsModel? staffDetailsModel = await getStaffList(
          miId: miId,
          amstId: amstId,
          asmayId: asmayId,
          userId: userId,
          key: key,
          base: base);

      if (staffDetailsModel!.getdetails != null ||
          staffDetailsModel.getdetails!.values != null) {
        staffList.clear();
        for (var i = 0; i < staffDetailsModel.getdetails!.values!.length; i++) {
          staffList.add(staffDetailsModel.getdetails!.values![i]);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.e(e.toString());
      return false;
    }
  }
}
