import 'package:get/get.dart';
import 'package:m_skool_flutter/fees/apis/fee_related_api.dart';
import 'package:m_skool_flutter/main.dart';
import '../model/feeModel.dart';

class FeeController extends GetxController {
  RxList<OverAllAnalysisValue> overAllAnalysisData =
      <OverAllAnalysisValue>[].obs;

  RxList<HeadwiseAnalysisData> headWiseAnalysisData =
      <HeadwiseAnalysisData>[].obs;

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
      if (feeDetails!.feeAnalysisList!.values != null ||
          feeDetails.feeAnalysisList != null) {
        overAllAnalysisData.clear();
        overAllAnalysisData.add(feeDetails.feeAnalysisList!.values!.first);

        if (feeDetails.studentfeedetails != null ||
            feeDetails.studentfeedetails!.values != null) {
          headWiseAnalysisData.clear();
          for (var i = 0;
              i < feeDetails.studentfeedetails!.values!.length;
              i++) {
            headWiseAnalysisData
                .add(feeDetails.studentfeedetails!.values!.elementAt(i));
          }
        }
        logger.d(headWiseAnalysisData.first.toString());

        return true;
      }
      return false;
    } on Exception catch (e) {
      logger.e(e.toString());
      return false;
    }
  }
}
