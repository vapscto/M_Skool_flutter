import 'package:dio/dio.dart';
import 'package:m_skool_flutter/constants/api_url_constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/fees/controller/payment_selection_tracking.dart';
import 'package:m_skool_flutter/fees/model/custom_grp_list.dart';
import 'package:m_skool_flutter/fees/model/disable_terms_model.dart';
import 'package:m_skool_flutter/fees/model/payment_gateway_detail.dart';
import 'package:m_skool_flutter/main.dart';

class GetPayablePaymentDetailApi {
  GetPayablePaymentDetailApi.init();
  static final GetPayablePaymentDetailApi instance =
      GetPayablePaymentDetailApi.init();

  Future<PaymentGateWayDetails> openPaymentGateWay({
    required int miId,
    required int amstId,
    required int asmayId,
    required int asmclId,
    required String base,
    required PaymentSelectionTracking paymentSelectionTracking,
  }) async {
    final String apiUrl = base + URLS.openPaymentGateWay;
    final Dio ins = getGlobalDio();

    Map<String, dynamic> responseBody = {};

    List<Map<String, dynamic>> selectedList = [];

    for (int i = 0;
        i < paymentSelectionTracking.selectedInstallment.length;
        i++) {
      final CustomgGrplistValues grplistValues =
          paymentSelectionTracking.selectedInstallment.elementAt(i).groupInfo;
      final DisableTermsModelValues disableTermsModelValues =
          paymentSelectionTracking.selectedInstallment
              .elementAt(i)
              .disableTermsModelValues;

      selectedList.add({
        "grp": {
          "checkedgrplst": true,
          "fmgG_GroupName": grplistValues.fmgGGroupName,
          "fmgG_Id": grplistValues.fmgGId
        },
        "trm_list": [
          {
            //"checkedheadlst": true,
            "fmT_Id": disableTermsModelValues.fmtId,
            "fmT_Name": disableTermsModelValues.fMTName,
            "fmT_Order": disableTermsModelValues.fMTOrder,
            "fmgG_GroupName": grplistValues.fmgGGroupName,
            "fmgG_Id": grplistValues.fmgGId,
            "preAdmFlag": false,
            "termdisablechk": true,
          }
        ]
      });
    }

    responseBody['selected_list'] = selectedList;
    responseBody.addAll({
      "MI_Id": miId,
      "AMST_Id": amstId,
      "ASMAY_Id": asmayId,
      "ASMCL_ID": asmclId,
      "onlinepaygteway": "RAZORPAY",
      "automanualreceiptno": "Auto",
      "transnumbconfigurationsettingsss": {},
      "FYP_PayModeType": "MOBILE"
    });

    logger.d(responseBody);

    try {
      final Response response = await ins.post(apiUrl,
          options: Options(headers: getSession()), data: responseBody);
      final PaymentGateWayDetails gateWayDetails =
          PaymentGateWayDetails.fromJson(response.data);

      return Future.value(gateWayDetails);
    } on Exception catch (e) {
      logger.e(e.toString());
      return Future.error({
        "errorTitle": "Unable to connect to server",
        "errorMsg":
            "We are currently unable to connect to the server, or server returned an error"
      });
    }
  }
}
