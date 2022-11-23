// To parse this JSON data, do
//
//     final feeReceiptDetailsModel = feeReceiptDetailsModelFromJson(jsonString);

import 'dart:convert';

FeeReceiptDetailsModel feeReceiptDetailsModelFromJson(String str) =>
    FeeReceiptDetailsModel.fromJson(json.decode(str));

String feeReceiptDetailsModelToJson(FeeReceiptDetailsModel data) =>
    json.encode(data.toJson());

class Currpaymentdetails {
  Currpaymentdetails({
    this.type,
    this.values,
  });

  String? type;
  List<FeeReceiptDetailsModel>? values;

  factory Currpaymentdetails.fromJson(Map<String, dynamic> json) =>
      Currpaymentdetails(
        type: json["\$type"],
        values: List<FeeReceiptDetailsModel>.from(
            json["\$values"].map((x) => FeeReceiptDetailsModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class FeeReceiptDetailsModel {
  FeeReceiptDetailsModel({
    this.fyppsTSettlementDate,
    this.fsCId,
    this.fscIId,
    this.fscIConcessionAmount,
    this.fyppMDdChequeDate,
    this.fyppMTotalPaidAmount,
    this.fyppsDId,
    this.totalconcession,
    this.fmCId,
    this.validationgroupid,
    this.validationgrougidcount,
    this.studentdob,
    this.termremarks,
    this.currpaymentdetails,
    this.ftPFineAmt,
    this.receiptformathead,
    this.amsTConcessionType,
    this.filltotaldetails,
    this.fmTId,
    this.fyPId,
    this.configset,
    this.fsSId,
    this.mIId,
    this.asmaYId,
    this.amstId,
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
    this.fsSArrearFlag,
    this.fsSRefundOverFlag,
    this.fsSActiveFlag,
    this.fillstudentviewdetails,
    this.fmAAmount,
    this.amaYRollNo,
    this.lCode,
    this.fyPDate,
    this.fyPDdChequeDate,
    this.fyPTotAmount,
    this.fyPTotWaivedAmt,
    this.fyPTotFineAmt,
    this.fyPTotConcessionAmt,
    this.transtype,
    this.ftPPaidAmt,
    this.ftPConcessionAmt,
    this.totalamount,
    this.internalftpTobepaidAmt,
    this.internalpaidamount,
    this.internalftpConcessionAmt,
    this.internalftpWaivedAmt,
    this.internalftpFineAmt,
    this.internalftsf,
    this.amstMobile,
    this.asmcLId,
    this.rollno,
    this.userid,
    this.fmtId,
    this.userId,
    this.topayamount,
    this.dueamount,
    this.date,
    this.month,
    this.year,
    this.duration,
    this.fsSTotalToBePaidaddfine,
    this.autoReceiptFlag,
    this.grpCount,
    this.searchdate,
    this.minstall,
    this.totalcharges,
    this.amsCId,
    this.yearid,
    this.pasRId,
    this.pasRMobileNo,
    this.transfersettings,
    this.roleid,
    this.fmgGId,
    this.pendingamount,
    this.fpgdid,
    this.ftPWaivedAmt,
    this.concession,
    this.fgaRId,
    this.fmhoTId,
    this.headorder,
    this.challanFlag,
    this.fineAmt,
    this.specialheaddetails,
    this.specialheadlist,
    this.fineheadfmaidsaved,
    this.trmRId,
    this.htmldata,
    this.fmHOrder,
    this.asmaYOrder,
    this.asysTId,
    this.asmcLOrder,
    this.fpgDId,
    this.srkvsdetails,
    this.enduserid,
    this.dated,
    this.trsRDate,
    this.fswOFineFlg,
    this.fswOFullFineWaiveOffFlg,
    this.ispaCFullPaymentCompFlg,
    this.ivrmmoDId,
    this.preAsmayId,
    this.bankDate,
    this.bankAmount,
    this.fyppMId,
    this.fcspdCId,
    this.fcspdCAmount,
    this.fmbanKId,
    this.rebateamount,
    this.ftoTRebateAmount,
    this.fyPRemarks,
    this.fyPBankOrCash,
    this.fyPDdChequeNo,
    this.fyPBankName,
    this.termname,
  });

  DateTime? fyppsTSettlementDate;
  int? fsCId;
  int? fscIId;
  int? fscIConcessionAmount;
  DateTime? fyppMDdChequeDate;
  double? fyppMTotalPaidAmount;
  int? fyppsDId;
  int? totalconcession;
  int? fmCId;
  int? validationgroupid;
  int? validationgrougidcount;
  DateTime? studentdob;
  Currpaymentdetails? termremarks;
  Currpaymentdetails? currpaymentdetails;
  double? ftPFineAmt;
  Currpaymentdetails? receiptformathead;
  int? amsTConcessionType;
  Currpaymentdetails? filltotaldetails;
  int? fmTId;
  int? fyPId;
  String? configset;
  int? fsSId;
  int? mIId;
  int? asmaYId;
  int? amstId;
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
  double? fsSFineAmount;
  int? fsSRefundAmount;
  int? fsSRefundAmountAdjusted;
  double? fsSNetAmount;
  bool? fsSChequeBounceFlag;
  bool? fsSArrearFlag;
  bool? fsSRefundOverFlag;
  bool? fsSActiveFlag;
  Fillstudentviewdetails? fillstudentviewdetails;
  double? fmAAmount;
  int? amaYRollNo;
  int? lCode;
  DateTime? fyPDate;
  DateTime? fyPDdChequeDate;
  double? fyPTotAmount;
  double? fyPTotWaivedAmt;
  double? fyPTotFineAmt;
  double? fyPTotConcessionAmt;
  bool? transtype;
  double? ftPPaidAmt;
  double? ftPConcessionAmt;
  double? totalamount;
  double? internalftpTobepaidAmt;
  double? internalpaidamount;
  double? internalftpConcessionAmt;
  double? internalftpWaivedAmt;
  double? internalftpFineAmt;
  int? internalftsf;
  int? amstMobile;
  int? asmcLId;
  int? rollno;
  int? userid;
  int? fmtId;
  int? userId;
  int? topayamount;
  int? dueamount;
  String? date;
  String? month;
  String? year;
  String? duration;
  int? fsSTotalToBePaidaddfine;
  int? autoReceiptFlag;
  int? grpCount;
  DateTime? searchdate;
  String? minstall;
  double? totalcharges;
  int? amsCId;
  int? yearid;
  int? pasRId;
  int? pasRMobileNo;
  int? transfersettings;
  int? roleid;
  int? fmgGId;
  int? pendingamount;
  int? fpgdid;
  double? ftPWaivedAmt;
  double? concession;
  int? fgaRId;
  int? fmhoTId;
  int? headorder;
  bool? challanFlag;
  int? fineAmt;
  Specialheaddetails? specialheaddetails;
  Specialheadlist? specialheadlist;
  int? fineheadfmaidsaved;
  int? trmRId;
  String? htmldata;
  int? fmHOrder;
  int? asmaYOrder;
  int? asysTId;
  int? asmcLOrder;
  int? fpgDId;
  Currpaymentdetails? srkvsdetails;
  int? enduserid;
  DateTime? dated;
  DateTime? trsRDate;
  int? fswOFineFlg;
  int? fswOFullFineWaiveOffFlg;
  int? ispaCFullPaymentCompFlg;
  int? ivrmmoDId;
  int? preAsmayId;
  DateTime? bankDate;
  double? bankAmount;
  int? fyppMId;
  int? fcspdCId;
  double? fcspdCAmount;
  int? fmbanKId;
  int? rebateamount;
  int? ftoTRebateAmount;
  String? fyPRemarks;
  String? fyPBankOrCash;
  String? fyPDdChequeNo;
  String? fyPBankName;
  String? termname;

  factory FeeReceiptDetailsModel.fromJson(Map<String, dynamic> json) =>
      FeeReceiptDetailsModel(
        fyppsTSettlementDate: DateTime.parse(json["fyppsT_Settlement_Date"]),
        fsCId: json["fsC_Id"],
        fscIId: json["fscI_ID"],
        fscIConcessionAmount: json["fscI_ConcessionAmount"],
        fyppMDdChequeDate: DateTime.parse(json["fyppM_DDChequeDate"]),
        fyppMTotalPaidAmount: json["fyppM_TotalPaidAmount"],
        fyppsDId: json["fyppsD_Id"],
        totalconcession: json["totalconcession"],
        fmCId: json["fmC_Id"],
        validationgroupid: json["validationgroupid"],
        validationgrougidcount: json["validationgrougidcount"],
        studentdob: DateTime.parse(json["studentdob"]),
        termremarks: json["termremarks"] == null
            ? null
            : Currpaymentdetails.fromJson(json["termremarks"]),
        currpaymentdetails: json["currpaymentdetails"] == null
            ? null
            : Currpaymentdetails.fromJson(json["currpaymentdetails"]),
        ftPFineAmt: json["ftP_Fine_Amt"],
        receiptformathead: json["receiptformathead"] == null
            ? null
            : Currpaymentdetails.fromJson(json["receiptformathead"]),
        amsTConcessionType: json["amsT_Concession_Type"],
        filltotaldetails: json["filltotaldetails"] == null
            ? null
            : Currpaymentdetails.fromJson(json["filltotaldetails"]),
        fmTId: json["fmT_Id"],
        fyPId: json["fyP_Id"],
        configset: json["configset"] == null ? null : json["configset"],
        fsSId: json["fsS_Id"],
        mIId: json["mI_Id"],
        asmaYId: json["asmaY_Id"],
        amstId: json["amst_Id"],
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
        fsSArrearFlag: json["fsS_ArrearFlag"],
        fsSRefundOverFlag: json["fsS_RefundOverFlag"],
        fsSActiveFlag: json["fsS_ActiveFlag"],
        fillstudentviewdetails: json["fillstudentviewdetails"] == null
            ? null
            : Fillstudentviewdetails.fromJson(json["fillstudentviewdetails"]),
        fmAAmount: json["fmA_Amount"],
        amaYRollNo: json["amaY_RollNo"],
        lCode: json["l_Code"],
        fyPDate: DateTime.parse(json["fyP_Date"]),
        fyPDdChequeDate: DateTime.parse(json["fyP_DD_Cheque_Date"]),
        fyPTotAmount: json["fyP_Tot_Amount"],
        fyPTotWaivedAmt: json["fyP_Tot_Waived_Amt"],
        fyPTotFineAmt: json["fyP_Tot_Fine_Amt"],
        fyPTotConcessionAmt: json["fyP_Tot_Concession_Amt"],
        transtype: json["transtype"],
        ftPPaidAmt: json["ftP_Paid_Amt"],
        ftPConcessionAmt: json["ftP_Concession_Amt"],
        totalamount: json["totalamount"],
        internalftpTobepaidAmt: json["internalftp_tobepaid_amt"],
        internalpaidamount: json["internalpaidamount"],
        internalftpConcessionAmt: json["internalftp_concession_amt"],
        internalftpWaivedAmt: json["internalftp_waived_Amt"],
        internalftpFineAmt: json["internalftp_fine_Amt"],
        internalftsf: json["internalftsf"],
        amstMobile: json["amst_mobile"],
        asmcLId: json["asmcL_ID"],
        rollno: json["rollno"],
        userid: json["userid"],
        fmtId: json["fmt_id"],
        userId: json["user_Id"],
        topayamount: json["topayamount"],
        dueamount: json["dueamount"],
        date: json["date"] == null ? null : json["date"],
        month: json["month"] == null ? null : json["month"],
        year: json["year"] == null ? null : json["year"],
        duration: json["duration"] == null ? null : json["duration"],
        fsSTotalToBePaidaddfine: json["fsS_TotalToBePaidaddfine"],
        autoReceiptFlag: json["auto_receipt_flag"],
        grpCount: json["grp_count"],
        searchdate: DateTime.parse(json["searchdate"]),
        minstall: json["minstall"] == null ? null : json["minstall"],
        totalcharges: json["totalcharges"],
        amsCId: json["amsC_Id"],
        yearid: json["yearid"],
        pasRId: json["pasR_Id"],
        pasRMobileNo: json["pasR_MobileNo"],
        transfersettings: json["transfersettings"],
        roleid: json["roleid"],
        fmgGId: json["fmgG_Id"],
        pendingamount: json["pendingamount"],
        fpgdid: json["fpgdid"],
        ftPWaivedAmt: json["ftP_Waived_Amt"],
        concession: json["concession"],
        fgaRId: json["fgaR_Id"],
        fmhoTId: json["fmhoT_Id"],
        headorder: json["headorder"],
        challanFlag: json["challan_Flag"],
        fineAmt: json["fine_Amt"],
        specialheaddetails: json["specialheaddetails"] == null
            ? null
            : Specialheaddetails.fromJson(json["specialheaddetails"]),
        specialheadlist: json["specialheadlist"] == null
            ? null
            : Specialheadlist.fromJson(json["specialheadlist"]),
        fineheadfmaidsaved: json["fineheadfmaidsaved"],
        trmRId: json["trmR_Id"],
        htmldata: json["htmldata"] == null ? null : json["htmldata"],
        fmHOrder: json["fmH_Order"],
        asmaYOrder: json["asmaY_Order"],
        asysTId: json["asysT_Id"],
        asmcLOrder: json["asmcL_Order"],
        fpgDId: json["fpgD_Id"],
        srkvsdetails: json["srkvsdetails"] == null
            ? null
            : Currpaymentdetails.fromJson(json["srkvsdetails"]),
        enduserid: json["enduserid"],
        dated: DateTime.parse(json["dated"]),
        trsRDate: DateTime.parse(json["trsR_Date"]),
        fswOFineFlg: json["fswO_FineFlg"],
        fswOFullFineWaiveOffFlg: json["fswO_FullFineWaiveOffFlg"],
        ispaCFullPaymentCompFlg: json["ispaC_FullPaymentCompFlg"],
        ivrmmoDId: json["ivrmmoD_Id"],
        preAsmayId: json["preASMAY_Id"],
        bankDate: DateTime.parse(json["bank_Date"]),
        bankAmount: json["bank_Amount"],
        fyppMId: json["fyppM_Id"],
        fcspdCId: json["fcspdC_Id"],
        fcspdCAmount: json["fcspdC_Amount"],
        fmbanKId: json["fmbanK_Id"],
        rebateamount: json["rebateamount"],
        ftoTRebateAmount: json["ftoT_RebateAmount"],
        fyPRemarks: json["fyP_Remarks"] == null ? null : json["fyP_Remarks"],
        fyPBankOrCash:
            json["fyP_Bank_Or_Cash"] == null ? null : json["fyP_Bank_Or_Cash"],
        fyPDdChequeNo:
            json["fyP_DD_Cheque_No"] == null ? null : json["fyP_DD_Cheque_No"],
        fyPBankName:
            json["fyP_Bank_Name"] == null ? null : json["fyP_Bank_Name"],
        termname: json["termname"] == null ? null : json["termname"],
      );

  Map<String, dynamic> toJson() => {
        "fyppsT_Settlement_Date": fyppsTSettlementDate!.toIso8601String(),
        "fsC_Id": fsCId,
        "fscI_ID": fscIId,
        "fscI_ConcessionAmount": fscIConcessionAmount,
        "fyppM_DDChequeDate": fyppMDdChequeDate!.toIso8601String(),
        "fyppM_TotalPaidAmount": fyppMTotalPaidAmount,
        "fyppsD_Id": fyppsDId,
        "totalconcession": totalconcession,
        "fmC_Id": fmCId,
        "validationgroupid": validationgroupid,
        "validationgrougidcount": validationgrougidcount,
        "studentdob": studentdob!.toIso8601String(),
        "termremarks": termremarks == null ? null : termremarks!.toJson(),
        "currpaymentdetails":
            currpaymentdetails == null ? null : currpaymentdetails!.toJson(),
        "ftP_Fine_Amt": ftPFineAmt,
        "receiptformathead":
            receiptformathead == null ? null : receiptformathead!.toJson(),
        "amsT_Concession_Type": amsTConcessionType,
        "filltotaldetails":
            filltotaldetails == null ? null : filltotaldetails!.toJson(),
        "fmT_Id": fmTId,
        "fyP_Id": fyPId,
        "configset": configset == null ? null : configset,
        "fsS_Id": fsSId,
        "mI_Id": mIId,
        "asmaY_Id": asmaYId,
        "amst_Id": amstId,
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
        "fsS_ArrearFlag": fsSArrearFlag,
        "fsS_RefundOverFlag": fsSRefundOverFlag,
        "fsS_ActiveFlag": fsSActiveFlag,
        "fillstudentviewdetails": fillstudentviewdetails == null
            ? null
            : fillstudentviewdetails!.toJson(),
        "fmA_Amount": fmAAmount,
        "amaY_RollNo": amaYRollNo,
        "l_Code": lCode,
        "fyP_Date": fyPDate!.toIso8601String(),
        "fyP_DD_Cheque_Date": fyPDdChequeDate!.toIso8601String(),
        "fyP_Tot_Amount": fyPTotAmount,
        "fyP_Tot_Waived_Amt": fyPTotWaivedAmt,
        "fyP_Tot_Fine_Amt": fyPTotFineAmt,
        "fyP_Tot_Concession_Amt": fyPTotConcessionAmt,
        "transtype": transtype,
        "ftP_Paid_Amt": ftPPaidAmt,
        "ftP_Concession_Amt": ftPConcessionAmt,
        "totalamount": totalamount,
        "internalftp_tobepaid_amt": internalftpTobepaidAmt,
        "internalpaidamount": internalpaidamount,
        "internalftp_concession_amt": internalftpConcessionAmt,
        "internalftp_waived_Amt": internalftpWaivedAmt,
        "internalftp_fine_Amt": internalftpFineAmt,
        "internalftsf": internalftsf,
        "amst_mobile": amstMobile,
        "asmcL_ID": asmcLId,
        "rollno": rollno,
        "userid": userid,
        "fmt_id": fmtId,
        "user_Id": userId,
        "topayamount": topayamount,
        "dueamount": dueamount,
        "date": date == null ? null : date,
        "month": month == null ? null : month,
        "year": year == null ? null : year,
        "duration": duration == null ? null : duration,
        "fsS_TotalToBePaidaddfine": fsSTotalToBePaidaddfine,
        "auto_receipt_flag": autoReceiptFlag,
        "grp_count": grpCount,
        "searchdate": searchdate!.toIso8601String(),
        "minstall": minstall == null ? null : minstall,
        "totalcharges": totalcharges,
        "amsC_Id": amsCId,
        "yearid": yearid,
        "pasR_Id": pasRId,
        "pasR_MobileNo": pasRMobileNo,
        "transfersettings": transfersettings,
        "roleid": roleid,
        "fmgG_Id": fmgGId,
        "pendingamount": pendingamount,
        "fpgdid": fpgdid,
        "ftP_Waived_Amt": ftPWaivedAmt,
        "concession": concession,
        "fgaR_Id": fgaRId,
        "fmhoT_Id": fmhoTId,
        "headorder": headorder,
        "challan_Flag": challanFlag,
        "fine_Amt": fineAmt,
        "specialheaddetails":
            specialheaddetails == null ? null : specialheaddetails!.toJson(),
        "specialheadlist":
            specialheadlist == null ? null : specialheadlist!.toJson(),
        "fineheadfmaidsaved": fineheadfmaidsaved,
        "trmR_Id": trmRId,
        "htmldata": htmldata == null ? null : htmldata,
        "fmH_Order": fmHOrder,
        "asmaY_Order": asmaYOrder,
        "asysT_Id": asysTId,
        "asmcL_Order": asmcLOrder,
        "fpgD_Id": fpgDId,
        "srkvsdetails": srkvsdetails == null ? null : srkvsdetails!.toJson(),
        "enduserid": enduserid,
        "dated": dated!.toIso8601String(),
        "trsR_Date": trsRDate!.toIso8601String(),
        "fswO_FineFlg": fswOFineFlg,
        "fswO_FullFineWaiveOffFlg": fswOFullFineWaiveOffFlg,
        "ispaC_FullPaymentCompFlg": ispaCFullPaymentCompFlg,
        "ivrmmoD_Id": ivrmmoDId,
        "preASMAY_Id": preAsmayId,
        "bank_Date": bankDate!.toIso8601String(),
        "bank_Amount": bankAmount,
        "fyppM_Id": fyppMId,
        "fcspdC_Id": fcspdCId,
        "fcspdC_Amount": fcspdCAmount,
        "fmbanK_Id": fmbanKId,
        "rebateamount": rebateamount,
        "ftoT_RebateAmount": ftoTRebateAmount,
        "fyP_Remarks": fyPRemarks == null ? null : fyPRemarks,
        "fyP_Bank_Or_Cash": fyPBankOrCash == null ? null : fyPBankOrCash,
        "fyP_DD_Cheque_No": fyPDdChequeNo == null ? null : fyPDdChequeNo,
        "fyP_Bank_Name": fyPBankName == null ? null : fyPBankName,
        "termname": termname == null ? null : termname,
      };
}

class Fillstudentviewdetails {
  Fillstudentviewdetails({
    this.type,
    this.values,
  });

  String? type;
  List<FillstudentviewdetailsValue>? values;

  factory Fillstudentviewdetails.fromJson(Map<String, dynamic> json) =>
      Fillstudentviewdetails(
        type: json["\$type"],
        values: List<FillstudentviewdetailsValue>.from(json["\$values"]
            .map((x) => FillstudentviewdetailsValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class FillstudentviewdetailsValue {
  FillstudentviewdetailsValue({
    this.type,
    this.amsTId,
    this.amsTFirstName,
    this.amsTMiddleName,
    this.amsTLastName,
    this.fmHId,
    this.fmHFeeName,
    this.ftIName,
    this.ftIId,
    this.fyPReceiptNo,
    this.ftPPaidAmt,
    this.ftPConcessionAmt,
    this.ftPFineAmt,
    this.fsSToBePaid,
    this.fyPDate,
    this.classname,
    this.sectionname,
    this.rollno,
    this.admno,
    this.fathername,
    this.mothername,
    this.fyPBankOrCash,
    this.fyPDdChequeNo,
    this.fyPDdChequeDate,
    this.fyPBankName,
    this.fypRemarks,
    this.amstRegistrationNo,
    this.fmccConcessionName,
    this.totalcharges,
    this.fssAdjustedAmount,
    this.amstMobile,
    this.fypChallanNo,
    this.fmhOrder,
    this.fypTransactionId,
    this.fssRebateAmount,
  });

  String? type;
  int? amsTId;
  String? amsTFirstName;
  String? amsTMiddleName;
  String? amsTLastName;
  int? fmHId;
  String? fmHFeeName;
  String? ftIName;
  int? ftIId;
  String? fyPReceiptNo;
  double? ftPPaidAmt;
  double? ftPConcessionAmt;
  double? ftPFineAmt;
  int? fsSToBePaid;
  DateTime? fyPDate;
  String? classname;
  String? sectionname;
  int? rollno;
  String? admno;
  String? fathername;
  String? mothername;
  String? fyPBankOrCash;
  String? fyPDdChequeNo;
  DateTime? fyPDdChequeDate;
  String? fyPBankName;
  String? fypRemarks;
  String? amstRegistrationNo;
  String? fmccConcessionName;
  double? totalcharges;
  int? fssAdjustedAmount;
  int? amstMobile;
  String? fypChallanNo;
  int? fmhOrder;
  String? fypTransactionId;
  int? fssRebateAmount;

  factory FillstudentviewdetailsValue.fromJson(Map<String, dynamic> json) =>
      FillstudentviewdetailsValue(
        type: json["\$type"],
        amsTId: json["amsT_Id"],
        amsTFirstName: json["amsT_FirstName"],
        amsTMiddleName: json["amsT_MiddleName"],
        amsTLastName: json["amsT_LastName"],
        fmHId: json["fmH_Id"],
        fmHFeeName: json["fmH_FeeName"],
        ftIName: json["ftI_Name"],
        ftIId: json["ftI_Id"],
        fyPReceiptNo: json["fyP_Receipt_No"],
        ftPPaidAmt: json["ftP_Paid_Amt"],
        ftPConcessionAmt: json["ftP_Concession_Amt"],
        ftPFineAmt: json["ftP_Fine_Amt"],
        fsSToBePaid: json["fsS_ToBePaid"],
        fyPDate: DateTime.parse(json["fyP_Date"]),
        classname: json["classname"],
        sectionname: json["sectionname"],
        rollno: json["rollno"],
        admno: json["admno"],
        fathername: json["fathername"],
        mothername: json["mothername"],
        fyPBankOrCash: json["fyP_Bank_Or_Cash"],
        fyPDdChequeNo: json["fyP_DD_Cheque_No"],
        fyPDdChequeDate: DateTime.parse(json["fyP_DD_Cheque_Date"]),
        fyPBankName: json["fyP_Bank_Name"],
        fypRemarks: json["FYP_Remarks"],
        amstRegistrationNo: json["AMST_RegistrationNo"],
        fmccConcessionName: json["FMCC_ConcessionName"],
        totalcharges: json["totalcharges"],
        fssAdjustedAmount: json["FSS_AdjustedAmount"],
        amstMobile: json["amst_mobile"],
        fypChallanNo: json["FYP_ChallanNo"],
        fmhOrder: json["FMH_Order"],
        fypTransactionId: json["fyp_transaction_id"],
        fssRebateAmount: json["FSS_RebateAmount"],
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "amsT_Id": amsTId,
        "amsT_FirstName": amsTFirstName,
        "amsT_MiddleName": amsTMiddleName,
        "amsT_LastName": amsTLastName,
        "fmH_Id": fmHId,
        "fmH_FeeName": fmHFeeName,
        "ftI_Name": ftIName,
        "ftI_Id": ftIId,
        "fyP_Receipt_No": fyPReceiptNo,
        "ftP_Paid_Amt": ftPPaidAmt,
        "ftP_Concession_Amt": ftPConcessionAmt,
        "ftP_Fine_Amt": ftPFineAmt,
        "fsS_ToBePaid": fsSToBePaid,
        "fyP_Date": fyPDate!.toIso8601String(),
        "classname": classname,
        "sectionname": sectionname,
        "rollno": rollno,
        "admno": admno,
        "fathername": fathername,
        "mothername": mothername,
        "fyP_Bank_Or_Cash": fyPBankOrCash,
        "fyP_DD_Cheque_No": fyPDdChequeNo,
        "fyP_DD_Cheque_Date": fyPDdChequeDate!.toIso8601String(),
        "fyP_Bank_Name": fyPBankName,
        "FYP_Remarks": fypRemarks,
        "AMST_RegistrationNo": amstRegistrationNo,
        "FMCC_ConcessionName": fmccConcessionName,
        "totalcharges": totalcharges,
        "FSS_AdjustedAmount": fssAdjustedAmount,
        "amst_mobile": amstMobile,
        "FYP_ChallanNo": fypChallanNo,
        "FMH_Order": fmhOrder,
        "fyp_transaction_id": fypTransactionId,
        "FSS_RebateAmount": fssRebateAmount,
      };
}

class Specialheaddetails {
  Specialheaddetails({
    this.type,
    this.values,
  });

  String? type;
  List<SpecialheaddetailsValue>? values;

  factory Specialheaddetails.fromJson(Map<String, dynamic> json) =>
      Specialheaddetails(
        type: json["\$type"],
        values: List<SpecialheaddetailsValue>.from(
            json["\$values"].map((x) => SpecialheaddetailsValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class SpecialheaddetailsValue {
  SpecialheaddetailsValue({
    this.fmsfHId,
    this.mIId,
    this.fmHId,
    this.fmsfHName,
    this.fmsfHActiceFlag,
    this.ivrmstauLId,
    this.returnval,
    this.editidh,
    this.fmHName,
    this.fmsfhfHId,
    this.fmsfhfHActiceFlag,
  });

  int? fmsfHId;
  int? mIId;
  int? fmHId;
  FmsfHName? fmsfHName;
  bool? fmsfHActiceFlag;
  int? ivrmstauLId;
  bool? returnval;
  int? editidh;
  String? fmHName;
  int? fmsfhfHId;
  bool? fmsfhfHActiceFlag;

  factory SpecialheaddetailsValue.fromJson(Map<String, dynamic> json) =>
      SpecialheaddetailsValue(
        fmsfHId: json["fmsfH_Id"],
        mIId: json["mI_Id"],
        fmHId: json["fmH_ID"],
        fmsfHName: fmsfHNameValues.map![json["fmsfH_Name"]],
        fmsfHActiceFlag: json["fmsfH_ActiceFlag"],
        ivrmstauLId: json["ivrmstauL_Id"],
        returnval: json["returnval"],
        editidh: json["editidh"],
        fmHName: json["fmH_Name"],
        fmsfhfHId: json["fmsfhfH_Id"],
        fmsfhfHActiceFlag: json["fmsfhfH_ActiceFlag"],
      );

  Map<String, dynamic> toJson() => {
        "fmsfH_Id": fmsfHId,
        "mI_Id": mIId,
        "fmH_ID": fmHId,
        "fmsfH_Name": fmsfHNameValues.reverse![fmsfHName],
        "fmsfH_ActiceFlag": fmsfHActiceFlag,
        "ivrmstauL_Id": ivrmstauLId,
        "returnval": returnval,
        "editidh": editidh,
        "fmH_Name": fmHName,
        "fmsfhfH_Id": fmsfhfHId,
        "fmsfhfH_ActiceFlag": fmsfhfHActiceFlag,
      };
}

enum FmsfHName { ANNUAL_FEE, TEST }

final fmsfHNameValues =
    EnumValues({"Annual Fee": FmsfHName.ANNUAL_FEE, "test": FmsfHName.TEST});

class Specialheadlist {
  Specialheadlist({
    this.type,
    this.values,
  });

  String? type;
  List<SpecialheadlistValue>? values;

  factory Specialheadlist.fromJson(Map<String, dynamic> json) =>
      Specialheadlist(
        type: json["\$type"],
        values: List<SpecialheadlistValue>.from(
            json["\$values"].map((x) => SpecialheadlistValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": List<dynamic>.from(values!.map((x) => x.toJson())),
      };
}

class SpecialheadlistValue {
  SpecialheadlistValue({
    this.fmsfHId,
    this.mIId,
    this.fmsfHName,
    this.fmsfHActiceFlag,
    this.ivrmstauLId,
    this.fmsfHConcessionFlag,
    this.createdDate,
    this.updatedDate,
  });

  int? fmsfHId;
  int? mIId;
  FmsfHName? fmsfHName;
  bool? fmsfHActiceFlag;
  int? ivrmstauLId;
  String? fmsfHConcessionFlag;
  DateTime? createdDate;
  DateTime? updatedDate;

  factory SpecialheadlistValue.fromJson(Map<String, dynamic> json) =>
      SpecialheadlistValue(
        fmsfHId: json["fmsfH_Id"],
        mIId: json["mI_Id"],
        fmsfHName: fmsfHNameValues.map![json["fmsfH_Name"]],
        fmsfHActiceFlag: json["fmsfH_ActiceFlag"],
        ivrmstauLId: json["ivrmstauL_Id"],
        fmsfHConcessionFlag: json["fmsfH_ConcessionFlag"] == null
            ? null
            : json["fmsfH_ConcessionFlag"],
        createdDate: DateTime.parse(json["createdDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
      );

  Map<String, dynamic> toJson() => {
        "fmsfH_Id": fmsfHId,
        "mI_Id": mIId,
        "fmsfH_Name": fmsfHNameValues.reverse![fmsfHName],
        "fmsfH_ActiceFlag": fmsfHActiceFlag,
        "ivrmstauL_Id": ivrmstauLId,
        "fmsfH_ConcessionFlag":
            fmsfHConcessionFlag == null ? null : fmsfHConcessionFlag,
        "createdDate": createdDate!.toIso8601String(),
        "updatedDate": updatedDate!.toIso8601String(),
      };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
