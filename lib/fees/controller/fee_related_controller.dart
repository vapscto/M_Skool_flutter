import 'package:get/get.dart';
import 'package:m_skool_flutter/fees/apis/fee_analysis_related_api.dart';
import 'package:m_skool_flutter/main.dart';
import '../model/feeModel.dart';

class FeeController extends GetxController {
  RxList<OverAllAnalysisValue> overAllAnalysisData =
      <OverAllAnalysisValue>[].obs;
  RxBool isLoading = RxBool(false);
  void isloading(bool loading) {
    isLoading.value = loading;
  }

  Future<bool> getFeeAnalysisData({
    required int miId,
    required int asmayId,
    required int amstId,
    required String base,
  }) async {
    try {
      FeeDetails? feeDetails = await getFeeAnalysisList(
          miId: miId, asmayId: asmayId, amstId: amstId, base: base);
      if (feeDetails!.feeAnalysisList!.values != null) {
        overAllAnalysisData.add(feeDetails.feeAnalysisList!.values!.first);
        logger.d(feeDetails.feeAnalysisList!.values!.first);
        return true;
      }
      return false;
    } on Exception catch (e) {
      logger.e(e.toString());
      return false;
    }
  }
}
