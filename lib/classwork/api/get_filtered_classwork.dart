import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:m_skool_flutter/classwork/model/class_work_model.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/information/controller/hwcwnb_controller.dart';
import 'package:m_skool_flutter/main.dart';

class GetFilteredClasswork {
  GetFilteredClasswork.init();
  static final GetFilteredClasswork instance = GetFilteredClasswork.init();

  getFilteredClassWork({
    required int miId,
    required int asmayId,
    required int amstId,
    required String startDate,
    required String endDate,
    required String base,
    required HwCwNbController hwCwNbController,
  }) async {
    final Dio ins = getGlobalDio();
    String api = base + URLS.classworkFiltered;
    if (hwCwNbController.errorHappendWhileLoadingClsWrk.value == true) {
      hwCwNbController.updateErrorHappendWhileLoadingClsWrk(false);
    }
    hwCwNbController.updateIsClassWorkDataLoading(true);

    //logger.d(api);
    // logger.d({
    //   "AMST_Id": amstId,
    //   "MI_Id": miId,
    //   "ASMAY_Id": asmayId,
    //   "INTB_StartDate": startDate,
    //   "INTB_EndDate": endDate,
    // });
    try {
      final Response response = await ins.post(
        api,
        options: Options(headers: getSession()),
        data: {
          "AMST_Id": amstId,
          "MI_Id": miId,
          "ASMAY_Id": asmayId,
          "INTB_StartDate": startDate,
          "INTB_EndDate": endDate,
        },
      );

      final ClassWorkModel classWorkModel =
          ClassWorkModel.fromJson(response.data['assignmentlist']);
      //logger.d(classWorkModel.toJson());
      hwCwNbController.updateClassWorkList(classWorkModel.values!);
      hwCwNbController.updateIsClassWorkDataLoading(false);
    } on Exception catch (e) {
      logger.e(e.toString());
      hwCwNbController.updateErrorHappendWhileLoadingClsWrk(true);
    }
  }
}
