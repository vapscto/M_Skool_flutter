// To parse this JSON data, do
//
//     final feeReceiptNoModel = feeReceiptNoModelFromJson(jsonString);

import 'dart:convert';

FeeReceiptNoModel feeReceiptNoModelFromJson(String str) =>
    FeeReceiptNoModel.fromJson(json.decode(str));

String feeReceiptNoModelToJson(FeeReceiptNoModel data) =>
    json.encode(data.toJson());

class Recnolist {
  Recnolist({
    this.type,
    this.values,
  });

  String? type;
  List<FeeReceiptNoModel>? values;

  factory Recnolist.fromJson(Map<String, dynamic> json) => Recnolist(
        type: json["\$type"],
        values: List<FeeReceiptNoModel>.from(
            json["\$values"].map((x) => FeeReceiptNoModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class FeeReceiptNoModel {
  FeeReceiptNoModel({
    this.stdupdate,
    this.stuonlineexam,
    this.mobilenumber,
    this.disabledint,
    this.blockdashboard,
    this.disabledorg,
    this.disablesubscription,
    this.subscriptionover,
    this.ipaTId,
    this.amstGId,
    this.stPPerstate,
    this.stPPercountry,
    this.stPPerpin,
    this.stPCurstate,
    this.stPCurcountry,
    this.stPCurpin,
    this.mIId,
    this.astureQId,
    this.fsSId,
    this.asmaYId,
    this.tctaken,
    this.amsTId,
    this.fmGId,
    this.fmHId,
    this.ftIId,
    this.fmAId,
    this.fsSObArrearAmount,
    this.fsSObExcessAmount,
    this.fsSCurrentYrCharges,
    this.fsSTotalToBePaid,
    this.fsSToBePaid,
    this.fsSPaidAmount,
    this.fsSExcessPaidAmount,
    this.fsSExcessAdjustedAmount,
    this.fsSRunningExcessAmount,
    this.fsSConcessionAmount,
    this.fsSAdjustedAmount,
    this.fsSWaivedAmount,
    this.fsSRebateAmount,
    this.fsSFineAmount,
    this.fsSRefundAmount,
    this.fsSRefundAmountAdjusted,
    this.fsSNetAmount,
    this.fsSChequeBounceFlag,
    this.updateflag,
    this.fsSArrearFlag,
    this.fsSRefundOverFlag,
    this.fsSActiveFlag,
    this.userId,
    this.roleid,
    this.feecheck,
    this.asmaYFromDate,
    this.asmaYToDate,
    this.asmaYPreAdmFDate,
    this.asmaYPreAdmTDate,
    this.asmaYOrder,
    this.asmaYActiveFlag,
    this.asmaYPreActiveFlag,
    this.asmaYCutOfDate,
    this.isActive,
    this.coemEId,
    this.coemEActiveFlag,
    this.asmcLId,
    this.asmSId,
    this.totalBalance,
    this.receivable,
    this.balance,
    this.paid,
    this.recnolist,
    this.fyPId,
    this.month,
    this.amsTMobileNo,
    this.amsTDob,
    this.hrmEId,
    this.studentaccyear,
    this.ftPConcessionAmt,
    this.ftPPaidAmt,
    this.ftPFineAmt,
    this.fyPDate,
    this.fyPDdChequeDate,
    this.fyPTotAmount,
    this.fyPTotFineAmt,
    this.fyPTotConcessionAmt,
    this.fmTId,
    this.dueamount,
    this.ttmCId,
    this.ttfgDId,
    this.ttfGId,
    this.feeReceiptNoModelHrmEId,
    this.ttmDId,
    this.ttmPId,
    this.ismSId,
    this.ttmBAfterPeriod,
    this.idUId,
    this.idUActiveFlag,
    this.intBId,
    this.icWId,
    this.intBStartDate,
    this.intBEndDate,
    this.intBActiveFlag,
    this.ivrmuLId,
    this.ihWId,
    this.ihWAssignmentNo,
    this.icWActiveFlag,
    this.icWFromDate,
    this.icWToDate,
    this.ipNId,
    this.ipNDate,
    this.ipNActiveFlag,
    this.ipnSId,
    this.ivrmmaDId,
    this.returnval,
    this.igAId,
    this.igADate,
    this.igACommonGalleryFlg,
    this.igaPId,
    this.igaPCoverPhotoFlag,
    this.coeEId,
    this.order,
    this.emEId,
    this.subjorder,
    this.estsUElecetiveFlag,
    this.amaYRollNo,
    this.fyPReceiptNo,
  });

  int? stdupdate;
  int? stuonlineexam;
  int? mobilenumber;
  bool? disabledint;
  bool? blockdashboard;
  bool? disabledorg;
  bool? disablesubscription;
  bool? subscriptionover;
  int? ipaTId;
  int? amstGId;
  int? stPPerstate;
  int? stPPercountry;
  int? stPPerpin;
  int? stPCurstate;
  int? stPCurcountry;
  int? stPCurpin;
  int? mIId;
  int? astureQId;
  int? fsSId;
  int? asmaYId;
  bool? tctaken;
  int? amsTId;
  int? fmGId;
  int? fmHId;
  int? ftIId;
  int? fmAId;
  int? fsSObArrearAmount;
  int? fsSObExcessAmount;
  int? fsSCurrentYrCharges;
  int? fsSTotalToBePaid;
  int? fsSToBePaid;
  int? fsSPaidAmount;
  int? fsSExcessPaidAmount;
  int? fsSExcessAdjustedAmount;
  int? fsSRunningExcessAmount;
  int? fsSConcessionAmount;
  int? fsSAdjustedAmount;
  int? fsSWaivedAmount;
  int? fsSRebateAmount;
  num? fsSFineAmount;
  num? fsSRefundAmount;
  num? fsSRefundAmountAdjusted;
  num? fsSNetAmount;
  bool? fsSChequeBounceFlag;
  bool? updateflag;
  bool? fsSArrearFlag;
  bool? fsSRefundOverFlag;
  bool? fsSActiveFlag;
  int? userId;
  int? roleid;
  int? feecheck;
  DateTime? asmaYFromDate;
  DateTime? asmaYToDate;
  DateTime? asmaYPreAdmFDate;
  DateTime? asmaYPreAdmTDate;
  int? asmaYOrder;
  int? asmaYActiveFlag;
  int? asmaYPreActiveFlag;
  DateTime? asmaYCutOfDate;
  bool? isActive;
  int? coemEId;
  bool? coemEActiveFlag;
  int? asmcLId;
  int? asmSId;
  int? totalBalance;
  int? receivable;
  int? balance;
  int? paid;
  Recnolists? recnolist;
  int? fyPId;
  int? month;
  int? amsTMobileNo;
  DateTime? amsTDob;
  int? hrmEId;
  int? studentaccyear;
  num? ftPConcessionAmt;
  num? ftPPaidAmt;
  num? ftPFineAmt;
  DateTime? fyPDate;
  DateTime? fyPDdChequeDate;
  num? fyPTotAmount;
  num? fyPTotFineAmt;
  num? fyPTotConcessionAmt;
  num? fmTId;
  num? dueamount;
  num? ttmCId;
  num? ttfgDId;
  num? ttfGId;
  num? feeReceiptNoModelHrmEId;
  num? ttmDId;
  num? ttmPId;
  num? ismSId;
  num? ttmBAfterPeriod;
  int? idUId;
  bool? idUActiveFlag;
  int? intBId;
  int? icWId;
  DateTime? intBStartDate;
  DateTime? intBEndDate;
  bool? intBActiveFlag;
  int? ivrmuLId;
  int? ihWId;
  int? ihWAssignmentNo;
  bool? icWActiveFlag;
  DateTime? icWFromDate;
  DateTime? icWToDate;
  int? ipNId;
  DateTime? ipNDate;
  bool? ipNActiveFlag;
  int? ipnSId;
  int? ivrmmaDId;
  bool? returnval;
  int? igAId;
  DateTime? igADate;
  bool? igACommonGalleryFlg;
  int? igaPId;
  bool? igaPCoverPhotoFlag;
  int? coeEId;
  int? order;
  int? emEId;
  int? subjorder;
  bool? estsUElecetiveFlag;
  int? amaYRollNo;
  String? fyPReceiptNo;

  factory FeeReceiptNoModel.fromJson(Map<String, dynamic> json) =>
      FeeReceiptNoModel(
        stdupdate: json["stdupdate"],
        stuonlineexam: json["stuonlineexam"],
        mobilenumber: json["mobilenumber"],
        disabledint: json["disabledint"],
        blockdashboard: json["blockdashboard"],
        disabledorg: json["disabledorg"],
        disablesubscription: json["disablesubscription"],
        subscriptionover: json["subscriptionover"],
        ipaTId: json["ipaT_Id"],
        amstGId: json["amstG_Id"],
        stPPerstate: json["stP_PERSTATE"],
        stPPercountry: json["stP_PERCOUNTRY"],
        stPPerpin: json["stP_PERPIN"],
        stPCurstate: json["stP_CURSTATE"],
        stPCurcountry: json["stP_CURCOUNTRY"],
        stPCurpin: json["stP_CURPIN"],
        mIId: json["mI_Id"],
        astureQId: json["astureQ_Id"],
        fsSId: json["fsS_Id"],
        asmaYId: json["asmaY_Id"],
        tctaken: json["tctaken"],
        amsTId: json["amsT_Id"],
        fmGId: json["fmG_Id"],
        fmHId: json["fmH_Id"],
        ftIId: json["ftI_Id"],
        fmAId: json["fmA_Id"],
        fsSObArrearAmount: json["fsS_OBArrearAmount"],
        fsSObExcessAmount: json["fsS_OBExcessAmount"],
        fsSCurrentYrCharges: json["fsS_CurrentYrCharges"],
        fsSTotalToBePaid: json["fsS_TotalToBePaid"],
        fsSToBePaid: json["fsS_ToBePaid"],
        fsSPaidAmount: json["fsS_PaidAmount"],
        fsSExcessPaidAmount: json["fsS_ExcessPaidAmount"],
        fsSExcessAdjustedAmount: json["fsS_ExcessAdjustedAmount"],
        fsSRunningExcessAmount: json["fsS_RunningExcessAmount"],
        fsSConcessionAmount: json["fsS_ConcessionAmount"],
        fsSAdjustedAmount: json["fsS_AdjustedAmount"],
        fsSWaivedAmount: json["fsS_WaivedAmount"],
        fsSRebateAmount: json["fsS_RebateAmount"],
        fsSFineAmount: json["fsS_FineAmount"],
        fsSRefundAmount: json["fsS_RefundAmount"],
        fsSRefundAmountAdjusted: json["fsS_RefundAmountAdjusted"],
        fsSNetAmount: json["fsS_NetAmount"],
        fsSChequeBounceFlag: json["fsS_ChequeBounceFlag"],
        updateflag: json["updateflag"],
        fsSArrearFlag: json["fsS_ArrearFlag"],
        fsSRefundOverFlag: json["fsS_RefundOverFlag"],
        fsSActiveFlag: json["fsS_ActiveFlag"],
        userId: json["user_Id"],
        roleid: json["roleid"],
        feecheck: json["feecheck"],
        asmaYFromDate: DateTime.parse(json["asmaY_From_Date"]),
        asmaYToDate: DateTime.parse(json["asmaY_To_Date"]),
        asmaYPreAdmFDate: DateTime.parse(json["asmaY_PreAdm_F_Date"]),
        asmaYPreAdmTDate: DateTime.parse(json["asmaY_PreAdm_T_Date"]),
        asmaYOrder: json["asmaY_Order"],
        asmaYActiveFlag: json["asmaY_ActiveFlag"],
        asmaYPreActiveFlag: json["asmaY_Pre_ActiveFlag"],
        asmaYCutOfDate: DateTime.parse(json["asmaY_Cut_Of_Date"]),
        isActive: json["is_Active"],
        coemEId: json["coemE_Id"],
        coemEActiveFlag: json["coemE_ActiveFlag"],
        asmcLId: json["asmcL_Id"],
        asmSId: json["asmS_Id"],
        totalBalance: json["totalBalance"],
        receivable: json["receivable"],
        balance: json["balance"],
        paid: json["paid"],
        recnolist: json["recnolist"] == null
            ? null
            : Recnolists.fromJson(json["recnolist"]),
        fyPId: json["fyP_Id"],
        month: json["month"],
        amsTMobileNo: json["amsT_MobileNo"],
        amsTDob: DateTime.parse(json["amsT_DOB"]),
        hrmEId: json["hrmE_ID"],
        studentaccyear: json["studentaccyear"],
        ftPConcessionAmt: json["ftP_Concession_Amt"],
        ftPPaidAmt: json["ftP_Paid_Amt"],
        ftPFineAmt: json["ftP_Fine_Amt"],
        fyPDate: DateTime.parse(json["fyP_Date"]),
        fyPDdChequeDate: DateTime.parse(json["fyP_DD_Cheque_Date"]),
        fyPTotAmount: json["fyP_Tot_Amount"],
        fyPTotFineAmt: json["fyP_Tot_Fine_Amt"],
        fyPTotConcessionAmt: json["fyP_Tot_Concession_Amt"],
        fmTId: json["fmT_Id"],
        dueamount: json["dueamount"],
        ttmCId: json["ttmC_Id"],
        ttfgDId: json["ttfgD_Id"],
        ttfGId: json["ttfG_Id"],
        feeReceiptNoModelHrmEId: json["hrmE_Id"],
        ttmDId: json["ttmD_Id"],
        ttmPId: json["ttmP_Id"],
        ismSId: json["ismS_Id"],
        ttmBAfterPeriod: json["ttmB_AfterPeriod"],
        idUId: json["idU_Id"],
        idUActiveFlag: json["idU_ActiveFlag"],
        intBId: json["intB_Id"],
        icWId: json["icW_Id"],
        intBStartDate: DateTime.parse(json["intB_StartDate"]),
        intBEndDate: DateTime.parse(json["intB_EndDate"]),
        intBActiveFlag: json["intB_ActiveFlag"],
        ivrmuLId: json["ivrmuL_Id"],
        ihWId: json["ihW_Id"],
        ihWAssignmentNo: json["ihW_AssignmentNo"],
        icWActiveFlag: json["icW_ActiveFlag"],
        icWFromDate: DateTime.parse(json["icW_FromDate"]),
        icWToDate: DateTime.parse(json["icW_ToDate"]),
        ipNId: json["ipN_Id"],
        ipNDate: DateTime.parse(json["ipN_Date"]),
        ipNActiveFlag: json["ipN_ActiveFlag"],
        ipnSId: json["ipnS_Id"],
        ivrmmaDId: json["ivrmmaD_Id"],
        returnval: json["returnval"],
        igAId: json["igA_Id"],
        igADate: DateTime.parse(json["igA_Date"]),
        igACommonGalleryFlg: json["igA_CommonGalleryFlg"],
        igaPId: json["igaP_Id"],
        igaPCoverPhotoFlag: json["igaP_CoverPhotoFlag"],
        coeEId: json["coeE_Id"],
        order: json["order"],
        emEId: json["emE_Id"],
        subjorder: json["subjorder"],
        estsUElecetiveFlag: json["estsU_ElecetiveFlag"],
        amaYRollNo: json["amaY_RollNo"],
        fyPReceiptNo:
            json["fyP_Receipt_No"] == null ? null : json["fyP_Receipt_No"],
      );

  Map<String, dynamic> toJson() => {
        "stdupdate": stdupdate,
        "stuonlineexam": stuonlineexam,
        "mobilenumber": mobilenumber,
        "disabledint": disabledint,
        "blockdashboard": blockdashboard,
        "disabledorg": disabledorg,
        "disablesubscription": disablesubscription,
        "subscriptionover": subscriptionover,
        "ipaT_Id": ipaTId,
        "amstG_Id": amstGId,
        "stP_PERSTATE": stPPerstate,
        "stP_PERCOUNTRY": stPPercountry,
        "stP_PERPIN": stPPerpin,
        "stP_CURSTATE": stPCurstate,
        "stP_CURCOUNTRY": stPCurcountry,
        "stP_CURPIN": stPCurpin,
        "mI_Id": mIId,
        "astureQ_Id": astureQId,
        "fsS_Id": fsSId,
        "asmaY_Id": asmaYId,
        "tctaken": tctaken,
        "amsT_Id": amsTId,
        "fmG_Id": fmGId,
        "fmH_Id": fmHId,
        "ftI_Id": ftIId,
        "fmA_Id": fmAId,
        "fsS_OBArrearAmount": fsSObArrearAmount,
        "fsS_OBExcessAmount": fsSObExcessAmount,
        "fsS_CurrentYrCharges": fsSCurrentYrCharges,
        "fsS_TotalToBePaid": fsSTotalToBePaid,
        "fsS_ToBePaid": fsSToBePaid,
        "fsS_PaidAmount": fsSPaidAmount,
        "fsS_ExcessPaidAmount": fsSExcessPaidAmount,
        "fsS_ExcessAdjustedAmount": fsSExcessAdjustedAmount,
        "fsS_RunningExcessAmount": fsSRunningExcessAmount,
        "fsS_ConcessionAmount": fsSConcessionAmount,
        "fsS_AdjustedAmount": fsSAdjustedAmount,
        "fsS_WaivedAmount": fsSWaivedAmount,
        "fsS_RebateAmount": fsSRebateAmount,
        "fsS_FineAmount": fsSFineAmount,
        "fsS_RefundAmount": fsSRefundAmount,
        "fsS_RefundAmountAdjusted": fsSRefundAmountAdjusted,
        "fsS_NetAmount": fsSNetAmount,
        "fsS_ChequeBounceFlag": fsSChequeBounceFlag,
        "updateflag": updateflag,
        "fsS_ArrearFlag": fsSArrearFlag,
        "fsS_RefundOverFlag": fsSRefundOverFlag,
        "fsS_ActiveFlag": fsSActiveFlag,
        "user_Id": userId,
        "roleid": roleid,
        "feecheck": feecheck,
        "asmaY_From_Date": asmaYFromDate!.toIso8601String(),
        "asmaY_To_Date": asmaYToDate!.toIso8601String(),
        "asmaY_PreAdm_F_Date": asmaYPreAdmFDate!.toIso8601String(),
        "asmaY_PreAdm_T_Date": asmaYPreAdmTDate!.toIso8601String(),
        "asmaY_Order": asmaYOrder,
        "asmaY_ActiveFlag": asmaYActiveFlag,
        "asmaY_Pre_ActiveFlag": asmaYPreActiveFlag,
        "asmaY_Cut_Of_Date": asmaYCutOfDate!.toIso8601String(),
        "is_Active": isActive,
        "coemE_Id": coemEId,
        "coemE_ActiveFlag": coemEActiveFlag,
        "asmcL_Id": asmcLId,
        "asmS_Id": asmSId,
        "totalBalance": totalBalance,
        "receivable": receivable,
        "balance": balance,
        "paid": paid,
        "recnolist": recnolist == null ? null : recnolist!.toJson(),
        "fyP_Id": fyPId,
        "month": month,
        "amsT_MobileNo": amsTMobileNo,
        "amsT_DOB": amsTDob!.toIso8601String(),
        "hrmE_ID": hrmEId,
        "studentaccyear": studentaccyear,
        "ftP_Concession_Amt": ftPConcessionAmt,
        "ftP_Paid_Amt": ftPPaidAmt,
        "ftP_Fine_Amt": ftPFineAmt,
        "fyP_Date": fyPDate!.toIso8601String(),
        "fyP_DD_Cheque_Date": fyPDdChequeDate!.toIso8601String(),
        "fyP_Tot_Amount": fyPTotAmount,
        "fyP_Tot_Fine_Amt": fyPTotFineAmt,
        "fyP_Tot_Concession_Amt": fyPTotConcessionAmt,
        "fmT_Id": fmTId,
        "dueamount": dueamount,
        "ttmC_Id": ttmCId,
        "ttfgD_Id": ttfgDId,
        "ttfG_Id": ttfGId,
        "hrmE_Id": feeReceiptNoModelHrmEId,
        "ttmD_Id": ttmDId,
        "ttmP_Id": ttmPId,
        "ismS_Id": ismSId,
        "ttmB_AfterPeriod": ttmBAfterPeriod,
        "idU_Id": idUId,
        "idU_ActiveFlag": idUActiveFlag,
        "intB_Id": intBId,
        "icW_Id": icWId,
        "intB_StartDate": intBStartDate!.toIso8601String(),
        "intB_EndDate": intBEndDate!.toIso8601String(),
        "intB_ActiveFlag": intBActiveFlag,
        "ivrmuL_Id": ivrmuLId,
        "ihW_Id": ihWId,
        "ihW_AssignmentNo": ihWAssignmentNo,
        "icW_ActiveFlag": icWActiveFlag,
        "icW_FromDate": icWFromDate!.toIso8601String(),
        "icW_ToDate": icWToDate!.toIso8601String(),
        "ipN_Id": ipNId,
        "ipN_Date": ipNDate!.toIso8601String(),
        "ipN_ActiveFlag": ipNActiveFlag,
        "ipnS_Id": ipnSId,
        "ivrmmaD_Id": ivrmmaDId,
        "returnval": returnval,
        "igA_Id": igAId,
        "igA_Date": igADate!.toIso8601String(),
        "igA_CommonGalleryFlg": igACommonGalleryFlg,
        "igaP_Id": igaPId,
        "igaP_CoverPhotoFlag": igaPCoverPhotoFlag,
        "coeE_Id": coeEId,
        "order": order,
        "emE_Id": emEId,
        "subjorder": subjorder,
        "estsU_ElecetiveFlag": estsUElecetiveFlag,
        "amaY_RollNo": amaYRollNo,
        "fyP_Receipt_No": fyPReceiptNo ?? null,
      };
}

class Recnolists {
  Recnolists({
    this.type,
    this.values,
  });
  String? type;
  List<ReceiptNoList>? values;
  factory Recnolists.fromJson(Map<String, dynamic> json) => Recnolists(
        type: json["\$type"],
        values: List<ReceiptNoList>.from(
            json["\$values"].map((x) => ReceiptNoList.fromJson(x))),
      );
  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class ReceiptNoList {
  ReceiptNoList({
    this.receiptNo,
    this.fyPId,
  });
  String? receiptNo;
  num? fyPId;

  factory ReceiptNoList.fromJson(Map<String, dynamic> json) => ReceiptNoList(
        receiptNo: json["fyP_Receipt_No"],
        fyPId: json["fyP_Id"],
      );

  Map<String, dynamic> toJson() => {
        "fyP_Receipt_No": receiptNo,
        "fyP_Id": fyPId,
      };
}