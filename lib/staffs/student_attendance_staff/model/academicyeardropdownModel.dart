// To parse this JSON data, do
//
//     final academicYearModel = academicYearModelFromJson(jsonString);

import 'dart:convert';

StudentAttendanceAcademicYearModel? academicYearModelFromJson(String str) =>
    StudentAttendanceAcademicYearModel.fromJson(json.decode(str));

String academicYearModelToJson(StudentAttendanceAcademicYearModel? data) =>
    json.encode(data!.toJson());

class StudentAttendanceAcademicYearModel {
  StudentAttendanceAcademicYearModel({
    this.emeRId,
    this.intBId,
    this.roleid,
    this.paymentNootificationStaff,
    this.disabledint,
    this.blockdashboard,
    this.disabledorg,
    this.disablesubscription,
    this.subscriptionover,
    this.mIId,
    this.hrmEId,
    this.asmaYId,
    this.periodCount,
    this.ttmdpTActiveFlag,
    this.asmcLId,
    this.asmSId,
    this.ismSId,
    this.asmcLActiveFlag,
    this.dayCount,
    this.ttmDId,
    this.studentcount,
    this.amstId,
    this.amstDob,
    this.amayRollNo,
    this.rollno,
    this.amstMobile,
    this.studentdob,
    this.yearlist,
    this.id,
    this.hreSId,
    this.hresId,
    this.userId,
    this.hrmLLeaveCreditFlg,
    this.ivrMMonthId,
    this.isActive,
    this.ivrMMonthMaxDays,
    this.hrmEDol,
    this.hreobLId,
    this.hrmlYId,
    this.hreobLDate,
    this.hreobLObLeaves,
    this.hrelTId,
    this.hrelTLeaveId,
    this.hrelTFromDate,
    this.hrelTToDate,
    this.hrelTTotDays,
    this.hrelTReportingdate,
    this.hrelTActiveFlag,
    this.hrmldcfMId,
    this.hrmldcFId,
    this.hrmldcfMMonthId,
    this.hrelCId,
    this.hrelCDate,
    this.hrelCCrLeaves,
    this.hrmGPayScaleFrom,
    this.hrmGIncrementOf,
    this.hrmGPayScaleTo,
    this.hrmGOrder,
    this.hrmGActiveFlag,
    this.hrlAId,
    this.hrlaoNId,
    this.hrlaoNSanctionLevelNo,
    this.hrlaoNFinalFlg,
    this.hreltDId,
    this.hreltDFromDate,
    this.hreltDToDate,
    this.hreltDLwpFlag,
    this.hrelSId,
    this.hrelSObLeaves,
    this.hrelSCreditedLeaves,
    this.hrelSTotalLeaves,
    this.hrelSTransLeaves,
    this.hrelSEncashedLeaves,
    this.hrelSCbLeaves,
    this.hrelaPId,
    this.hrelaPApplicationId,
    this.hrelaPTotalDays,
    this.hrelaPContactNoOnLeave,
    this.hrelaPFinalFlag,
    this.hrelaPActiveFlag,
    this.hrmlYFromDate,
    this.hrmlYToDate,
    this.hrmlYActiveFlag,
    this.hrmldcMId,
    this.hrmldcFMaxLeaveAplFlg,
    this.hrmldcFMaxLeaveCf,
    this.hrmldeCId,
    this.hrmldeCServiceAplFlg,
    this.hrmldeCMaxLeaveFlg,
    this.hrmldeCMaxLeaves,
    this.hrmldeCMinLeaveFlg,
    this.hrmldeCMinLeaves,
    this.hrmldeCVariableFixedFlg,
    this.hrmldeCFixedAmount,
    this.month,
    this.year,
    this.hrelapAId,
    this.hrelapAFinalFlag,
    this.igAId,
    this.igADate,
    this.igACommonGalleryFlg,
    this.igaPId,
    this.igaPCoverPhotoFlag,
    this.hrmLId,
    this.leavecode,
    this.count,
    this.returnval,
    this.editFlag,
    this.miid,
    this.hrmDId,
    this.hrmdeSId,
    this.emEId,
    this.present,
    this.classheld,
    this.type,
    this.perc,
    this.monthid,
    this.emeRActiveFlag,
    this.ivrmuLId,
    this.ttmBAfterPeriod,
  });

  int? emeRId;
  int? intBId;
  int? roleid;
  int? paymentNootificationStaff;
  bool? disabledint;
  bool? blockdashboard;
  bool? disabledorg;
  bool? disablesubscription;
  bool? subscriptionover;
  int? mIId;
  int? hrmEId;
  int? asmaYId;
  int? periodCount;
  bool? ttmdpTActiveFlag;
  int? asmcLId;
  int? asmSId;
  int? ismSId;
  bool? asmcLActiveFlag;
  int? dayCount;
  int? ttmDId;
  int? studentcount;
  int? amstId;
  DateTime? amstDob;
  int? amayRollNo;
  int? rollno;
  int? amstMobile;
  DateTime? studentdob;
  StudentAttendanceYearlist? yearlist;
  int? id;
  int? hreSId;
  int? hresId;
  int? userId;
  bool? hrmLLeaveCreditFlg;
  int? ivrMMonthId;
  bool? isActive;
  int? ivrMMonthMaxDays;
  DateTime? hrmEDol;
  int? hreobLId;
  int? hrmlYId;
  DateTime? hreobLDate;
  int? hreobLObLeaves;
  int? hrelTId;
  int? hrelTLeaveId;
  DateTime? hrelTFromDate;
  DateTime? hrelTToDate;
  int? hrelTTotDays;
  DateTime? hrelTReportingdate;
  bool? hrelTActiveFlag;
  int? hrmldcfMId;
  int? hrmldcFId;
  int? hrmldcfMMonthId;
  int? hrelCId;
  DateTime? hrelCDate;
  int? hrelCCrLeaves;
  int? hrmGPayScaleFrom;
  int? hrmGIncrementOf;
  int? hrmGPayScaleTo;
  int? hrmGOrder;
  bool? hrmGActiveFlag;
  int? hrlAId;
  int? hrlaoNId;
  int? hrlaoNSanctionLevelNo;
  bool? hrlaoNFinalFlg;
  int? hreltDId;
  DateTime? hreltDFromDate;
  DateTime? hreltDToDate;
  bool? hreltDLwpFlag;
  int? hrelSId;
  int? hrelSObLeaves;
  int? hrelSCreditedLeaves;
  int? hrelSTotalLeaves;
  int? hrelSTransLeaves;
  int? hrelSEncashedLeaves;
  int? hrelSCbLeaves;
  int? hrelaPId;
  int? hrelaPApplicationId;
  int? hrelaPTotalDays;
  int? hrelaPContactNoOnLeave;
  bool? hrelaPFinalFlag;
  bool? hrelaPActiveFlag;
  DateTime? hrmlYFromDate;
  DateTime? hrmlYToDate;
  bool? hrmlYActiveFlag;
  int? hrmldcMId;
  bool? hrmldcFMaxLeaveAplFlg;
  int? hrmldcFMaxLeaveCf;
  int? hrmldeCId;
  bool? hrmldeCServiceAplFlg;
  bool? hrmldeCMaxLeaveFlg;
  int? hrmldeCMaxLeaves;
  bool? hrmldeCMinLeaveFlg;
  int? hrmldeCMinLeaves;
  bool? hrmldeCVariableFixedFlg;
  int? hrmldeCFixedAmount;
  int? month;
  int? year;
  int? hrelapAId;
  bool? hrelapAFinalFlag;
  int? igAId;
  DateTime? igADate;
  bool? igACommonGalleryFlg;
  int? igaPId;
  bool? igaPCoverPhotoFlag;
  int? hrmLId;
  int? leavecode;
  int? count;
  bool? returnval;
  bool? editFlag;
  int? miid;
  int? hrmDId;
  int? hrmdeSId;
  int? emEId;
  int? present;
  int? classheld;
  int? type;
  int? perc;
  int? monthid;
  bool? emeRActiveFlag;
  int? ivrmuLId;
  int? ttmBAfterPeriod;

  factory StudentAttendanceAcademicYearModel.fromJson(
          Map<String, dynamic> json) =>
      StudentAttendanceAcademicYearModel(
        emeRId: json["emeR_Id"],
        intBId: json["intB_Id"],
        roleid: json["roleid"],
        paymentNootificationStaff: json["paymentNootificationStaff"],
        disabledint: json["disabledint"],
        blockdashboard: json["blockdashboard"],
        disabledorg: json["disabledorg"],
        disablesubscription: json["disablesubscription"],
        subscriptionover: json["subscriptionover"],
        mIId: json["mI_Id"],
        hrmEId: json["hrmE_Id"],
        asmaYId: json["asmaY_Id"],
        periodCount: json["periodCount"],
        ttmdpTActiveFlag: json["ttmdpT_ActiveFlag"],
        asmcLId: json["asmcL_Id"],
        asmSId: json["asmS_Id"],
        ismSId: json["ismS_Id"],
        asmcLActiveFlag: json["asmcL_ActiveFlag"],
        dayCount: json["dayCount"],
        ttmDId: json["ttmD_Id"],
        studentcount: json["studentcount"],
        amstId: json["amst_Id"],
        amstDob: DateTime.parse(json["amst_dob"]),
        amayRollNo: json["amay_RollNo"],
        rollno: json["rollno"],
        amstMobile: json["amst_mobile"],
        studentdob: DateTime.parse(json["studentdob"]),
        yearlist: StudentAttendanceYearlist.fromJson(json["yearlist"]),
        id: json["id"],
        hreSId: json["hreS_Id"],
        hresId: json["hres_id"],
        userId: json["userId"],
        hrmLLeaveCreditFlg: json["hrmL_LeaveCreditFlg"],
        ivrMMonthId: json["ivrM_Month_Id"],
        isActive: json["is_Active"],
        ivrMMonthMaxDays: json["ivrM_Month_Max_Days"],
        hrmEDol: DateTime.parse(json["hrmE_DOL"]),
        hreobLId: json["hreobL_Id"],
        hrmlYId: json["hrmlY_Id"],
        hreobLDate: DateTime.parse(json["hreobL_Date"]),
        hreobLObLeaves: json["hreobL_OBLeaves"],
        hrelTId: json["hrelT_Id"],
        hrelTLeaveId: json["hrelT_LeaveId"],
        hrelTFromDate: DateTime.parse(json["hrelT_FromDate"]),
        hrelTToDate: DateTime.parse(json["hrelT_ToDate"]),
        hrelTTotDays: json["hrelT_TotDays"],
        hrelTReportingdate: DateTime.parse(json["hrelT_Reportingdate"]),
        hrelTActiveFlag: json["hrelT_ActiveFlag"],
        hrmldcfMId: json["hrmldcfM_Id"],
        hrmldcFId: json["hrmldcF_Id"],
        hrmldcfMMonthId: json["hrmldcfM_MonthId"],
        hrelCId: json["hrelC_Id"],
        hrelCDate: DateTime.parse(json["hrelC_Date"]),
        hrelCCrLeaves: json["hrelC_CrLeaves"],
        hrmGPayScaleFrom: json["hrmG_PayScaleFrom"],
        hrmGIncrementOf: json["hrmG_IncrementOf"],
        hrmGPayScaleTo: json["hrmG_PayScaleTo"],
        hrmGOrder: json["hrmG_Order"],
        hrmGActiveFlag: json["hrmG_ActiveFlag"],
        hrlAId: json["hrlA_Id"],
        hrlaoNId: json["hrlaoN_Id"],
        hrlaoNSanctionLevelNo: json["hrlaoN_SanctionLevelNo"],
        hrlaoNFinalFlg: json["hrlaoN_FinalFlg"],
        hreltDId: json["hreltD_Id"],
        hreltDFromDate: DateTime.parse(json["hreltD_FromDate"]),
        hreltDToDate: DateTime.parse(json["hreltD_ToDate"]),
        hreltDLwpFlag: json["hreltD_LWPFlag"],
        hrelSId: json["hrelS_Id"],
        hrelSObLeaves: json["hrelS_OBLeaves"],
        hrelSCreditedLeaves: json["hrelS_CreditedLeaves"],
        hrelSTotalLeaves: json["hrelS_TotalLeaves"],
        hrelSTransLeaves: json["hrelS_TransLeaves"],
        hrelSEncashedLeaves: json["hrelS_EncashedLeaves"],
        hrelSCbLeaves: json["hrelS_CBLeaves"],
        hrelaPId: json["hrelaP_Id"],
        hrelaPApplicationId: json["hrelaP_ApplicationID"],
        hrelaPTotalDays: json["hrelaP_TotalDays"],
        hrelaPContactNoOnLeave: json["hrelaP_ContactNoOnLeave"],
        hrelaPFinalFlag: json["hrelaP_FinalFlag"],
        hrelaPActiveFlag: json["hrelaP_ActiveFlag"],
        hrmlYFromDate: DateTime.parse(json["hrmlY_FromDate"]),
        hrmlYToDate: DateTime.parse(json["hrmlY_ToDate"]),
        hrmlYActiveFlag: json["hrmlY_ActiveFlag"],
        hrmldcMId: json["hrmldcM_Id"],
        hrmldcFMaxLeaveAplFlg: json["hrmldcF_MaxLeaveAplFlg"],
        hrmldcFMaxLeaveCf: json["hrmldcF_MaxLeaveCF"],
        hrmldeCId: json["hrmldeC_Id"],
        hrmldeCServiceAplFlg: json["hrmldeC_ServiceAplFlg"],
        hrmldeCMaxLeaveFlg: json["hrmldeC_MaxLeaveFlg"],
        hrmldeCMaxLeaves: json["hrmldeC_MaxLeaves"],
        hrmldeCMinLeaveFlg: json["hrmldeC_MinLeaveFlg"],
        hrmldeCMinLeaves: json["hrmldeC_MinLeaves"],
        hrmldeCVariableFixedFlg: json["hrmldeC_VariableFixedFlg"],
        hrmldeCFixedAmount: json["hrmldeC_FixedAmount"],
        month: json["month"],
        year: json["year"],
        hrelapAId: json["hrelapA_Id"],
        hrelapAFinalFlag: json["hrelapA_FinalFlag"],
        igAId: json["igA_Id"],
        igADate: DateTime.parse(json["igA_Date"]),
        igACommonGalleryFlg: json["igA_CommonGalleryFlg"],
        igaPId: json["igaP_Id"],
        igaPCoverPhotoFlag: json["igaP_CoverPhotoFlag"],
        hrmLId: json["hrmL_Id"],
        leavecode: json["leavecode"],
        count: json["count"],
        returnval: json["returnval"],
        editFlag: json["edit_flag"],
        miid: json["miid"],
        hrmDId: json["hrmD_Id"],
        hrmdeSId: json["hrmdeS_Id"],
        emEId: json["emE_Id"],
        present: json["present"],
        classheld: json["classheld"],
        type: json["type"],
        perc: json["perc"],
        monthid: json["monthid"],
        emeRActiveFlag: json["emeR_ActiveFlag"],
        ivrmuLId: json["ivrmuL_Id"],
        ttmBAfterPeriod: json["ttmB_AfterPeriod"],
      );

  Map<String, dynamic> toJson() => {
        "emeR_Id": emeRId,
        "intB_Id": intBId,
        "roleid": roleid,
        "paymentNootificationStaff": paymentNootificationStaff,
        "disabledint": disabledint,
        "blockdashboard": blockdashboard,
        "disabledorg": disabledorg,
        "disablesubscription": disablesubscription,
        "subscriptionover": subscriptionover,
        "mI_Id": mIId,
        "hrmE_Id": hrmEId,
        "asmaY_Id": asmaYId,
        "periodCount": periodCount,
        "ttmdpT_ActiveFlag": ttmdpTActiveFlag,
        "asmcL_Id": asmcLId,
        "asmS_Id": asmSId,
        "ismS_Id": ismSId,
        "asmcL_ActiveFlag": asmcLActiveFlag,
        "dayCount": dayCount,
        "ttmD_Id": ttmDId,
        "studentcount": studentcount,
        "amst_Id": amstId,
        "amst_dob": amstDob?.toIso8601String(),
        "amay_RollNo": amayRollNo,
        "rollno": rollno,
        "amst_mobile": amstMobile,
        "studentdob": studentdob?.toIso8601String(),
        "yearlist": yearlist!.toJson(),
        "id": id,
        "hreS_Id": hreSId,
        "hres_id": hresId,
        "userId": userId,
        "hrmL_LeaveCreditFlg": hrmLLeaveCreditFlg,
        "ivrM_Month_Id": ivrMMonthId,
        "is_Active": isActive,
        "ivrM_Month_Max_Days": ivrMMonthMaxDays,
        "hrmE_DOL": hrmEDol?.toIso8601String(),
        "hreobL_Id": hreobLId,
        "hrmlY_Id": hrmlYId,
        "hreobL_Date": hreobLDate?.toIso8601String(),
        "hreobL_OBLeaves": hreobLObLeaves,
        "hrelT_Id": hrelTId,
        "hrelT_LeaveId": hrelTLeaveId,
        "hrelT_FromDate": hrelTFromDate?.toIso8601String(),
        "hrelT_ToDate": hrelTToDate?.toIso8601String(),
        "hrelT_TotDays": hrelTTotDays,
        "hrelT_Reportingdate": hrelTReportingdate?.toIso8601String(),
        "hrelT_ActiveFlag": hrelTActiveFlag,
        "hrmldcfM_Id": hrmldcfMId,
        "hrmldcF_Id": hrmldcFId,
        "hrmldcfM_MonthId": hrmldcfMMonthId,
        "hrelC_Id": hrelCId,
        "hrelC_Date": hrelCDate?.toIso8601String(),
        "hrelC_CrLeaves": hrelCCrLeaves,
        "hrmG_PayScaleFrom": hrmGPayScaleFrom,
        "hrmG_IncrementOf": hrmGIncrementOf,
        "hrmG_PayScaleTo": hrmGPayScaleTo,
        "hrmG_Order": hrmGOrder,
        "hrmG_ActiveFlag": hrmGActiveFlag,
        "hrlA_Id": hrlAId,
        "hrlaoN_Id": hrlaoNId,
        "hrlaoN_SanctionLevelNo": hrlaoNSanctionLevelNo,
        "hrlaoN_FinalFlg": hrlaoNFinalFlg,
        "hreltD_Id": hreltDId,
        "hreltD_FromDate": hreltDFromDate?.toIso8601String(),
        "hreltD_ToDate": hreltDToDate?.toIso8601String(),
        "hreltD_LWPFlag": hreltDLwpFlag,
        "hrelS_Id": hrelSId,
        "hrelS_OBLeaves": hrelSObLeaves,
        "hrelS_CreditedLeaves": hrelSCreditedLeaves,
        "hrelS_TotalLeaves": hrelSTotalLeaves,
        "hrelS_TransLeaves": hrelSTransLeaves,
        "hrelS_EncashedLeaves": hrelSEncashedLeaves,
        "hrelS_CBLeaves": hrelSCbLeaves,
        "hrelaP_Id": hrelaPId,
        "hrelaP_ApplicationID": hrelaPApplicationId,
        "hrelaP_TotalDays": hrelaPTotalDays,
        "hrelaP_ContactNoOnLeave": hrelaPContactNoOnLeave,
        "hrelaP_FinalFlag": hrelaPFinalFlag,
        "hrelaP_ActiveFlag": hrelaPActiveFlag,
        "hrmlY_FromDate": hrmlYFromDate?.toIso8601String(),
        "hrmlY_ToDate": hrmlYToDate?.toIso8601String(),
        "hrmlY_ActiveFlag": hrmlYActiveFlag,
        "hrmldcM_Id": hrmldcMId,
        "hrmldcF_MaxLeaveAplFlg": hrmldcFMaxLeaveAplFlg,
        "hrmldcF_MaxLeaveCF": hrmldcFMaxLeaveCf,
        "hrmldeC_Id": hrmldeCId,
        "hrmldeC_ServiceAplFlg": hrmldeCServiceAplFlg,
        "hrmldeC_MaxLeaveFlg": hrmldeCMaxLeaveFlg,
        "hrmldeC_MaxLeaves": hrmldeCMaxLeaves,
        "hrmldeC_MinLeaveFlg": hrmldeCMinLeaveFlg,
        "hrmldeC_MinLeaves": hrmldeCMinLeaves,
        "hrmldeC_VariableFixedFlg": hrmldeCVariableFixedFlg,
        "hrmldeC_FixedAmount": hrmldeCFixedAmount,
        "month": month,
        "year": year,
        "hrelapA_Id": hrelapAId,
        "hrelapA_FinalFlag": hrelapAFinalFlag,
        "igA_Id": igAId,
        "igA_Date": igADate?.toIso8601String(),
        "igA_CommonGalleryFlg": igACommonGalleryFlg,
        "igaP_Id": igaPId,
        "igaP_CoverPhotoFlag": igaPCoverPhotoFlag,
        "hrmL_Id": hrmLId,
        "leavecode": leavecode,
        "count": count,
        "returnval": returnval,
        "edit_flag": editFlag,
        "miid": miid,
        "hrmD_Id": hrmDId,
        "hrmdeS_Id": hrmdeSId,
        "emE_Id": emEId,
        "present": present,
        "classheld": classheld,
        "type": type,
        "perc": perc,
        "monthid": monthid,
        "emeR_ActiveFlag": emeRActiveFlag,
        "ivrmuL_Id": ivrmuLId,
        "ttmB_AfterPeriod": ttmBAfterPeriod,
      };
}

class StudentAttendanceYearlist {
  StudentAttendanceYearlist({
    this.type,
    this.values,
  });

  String? type;
  List<StudentAttendanceYearlistValue?>? values;

  factory StudentAttendanceYearlist.fromJson(Map<String, dynamic> json) =>
      StudentAttendanceYearlist(
        type: json["\$type"],
        values: json["\$values"] == null
            ? []
            : List<StudentAttendanceYearlistValue?>.from(json["\$values"]!
                .map((x) => StudentAttendanceYearlistValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x!.toJson())),
      };
}

class StudentAttendanceYearlistValue {
  StudentAttendanceYearlistValue({
    this.asmaYId,
    this.mIId,
    this.asmaYYear,
    this.asmaYFromDate,
    this.asmaYToDate,
    this.asmaYPreAdmFDate,
    this.asmaYPreAdmTDate,
    this.asmaYOrder,
    this.asmaYActiveFlag,
    this.asmaYCutOfDate,
    this.asmaYPreActiveFlag,
    this.isActive,
    this.asmaYReggularFlg,
    this.asmaYNewFlg,
    this.asmaYNewAdmissionFlg,
    this.asmaYTransportSDate,
    this.asmaYTransportEDate,
    this.asmaYCreatedBy,
    this.asmaYUpdatedBy,
    this.asmaYReferenceDate,
    this.asmaYAcademicYearCode,
    this.createdDate,
    this.updatedDate,
    this.asmaYAdvanceFeeDate,
    this.asmaYRegularFeeFDate,
    this.asmaYRegularFeeTDate,
    this.asmaYArrearFeeDate,
  });

  int? asmaYId;
  int? mIId;
  String? asmaYYear;
  DateTime? asmaYFromDate;
  DateTime? asmaYToDate;
  DateTime? asmaYPreAdmFDate;
  DateTime? asmaYPreAdmTDate;
  int? asmaYOrder;
  int? asmaYActiveFlag;
  DateTime? asmaYCutOfDate;
  int? asmaYPreActiveFlag;
  bool? isActive;
  bool? asmaYReggularFlg;
  bool? asmaYNewFlg;
  bool? asmaYNewAdmissionFlg;
  DateTime? asmaYTransportSDate;
  DateTime? asmaYTransportEDate;
  int? asmaYCreatedBy;
  int? asmaYUpdatedBy;
  DateTime? asmaYReferenceDate;
  String? asmaYAcademicYearCode;
  DateTime? createdDate;
  DateTime? updatedDate;
  DateTime? asmaYAdvanceFeeDate;
  DateTime? asmaYRegularFeeFDate;
  DateTime? asmaYRegularFeeTDate;
  DateTime? asmaYArrearFeeDate;

  factory StudentAttendanceYearlistValue.fromJson(Map<String, dynamic> json) =>
      StudentAttendanceYearlistValue(
        asmaYId: json["asmaY_Id"],
        mIId: json["mI_Id"],
        asmaYYear: json["asmaY_Year"],
        asmaYFromDate: DateTime.parse(json["asmaY_From_Date"]),
        asmaYToDate: DateTime.parse(json["asmaY_To_Date"]),
        asmaYPreAdmFDate: DateTime.parse(json["asmaY_PreAdm_F_Date"]),
        asmaYPreAdmTDate: DateTime.parse(json["asmaY_PreAdm_T_Date"]),
        asmaYOrder: json["asmaY_Order"],
        asmaYActiveFlag: json["asmaY_ActiveFlag"],
        asmaYCutOfDate: DateTime.parse(json["asmaY_Cut_Of_Date"]),
        asmaYPreActiveFlag: json["asmaY_Pre_ActiveFlag"],
        isActive: json["is_Active"],
        asmaYReggularFlg: json["asmaY_ReggularFlg"],
        asmaYNewFlg: json["asmaY_NewFlg"],
        asmaYNewAdmissionFlg: json["asmaY_NewAdmissionFlg"],
        asmaYTransportSDate: json["asmaY_TransportSDate"],
        asmaYTransportEDate: json["asmaY_TransportEDate"],
        asmaYCreatedBy: json["asmaY_CreatedBy"],
        asmaYUpdatedBy: json["asmaY_UpdatedBy"],
        asmaYReferenceDate: json["asmaY_ReferenceDate"],
        asmaYAcademicYearCode: json["asmaY_AcademicYearCode"],
        createdDate: DateTime.parse(json["createdDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
        asmaYAdvanceFeeDate: json["asmaY_AdvanceFeeDate"],
        asmaYRegularFeeFDate: json["asmaY_RegularFeeFDate"],
        asmaYRegularFeeTDate: json["asmaY_RegularFeeTDate"],
        asmaYArrearFeeDate: json["asmaY_ArrearFeeDate"],
      );

  Map<String, dynamic> toJson() => {
        "asmaY_Id": asmaYId,
        "mI_Id": mIId,
        "asmaY_Year": asmaYYear,
        "asmaY_From_Date": asmaYFromDate?.toIso8601String(),
        "asmaY_To_Date": asmaYToDate?.toIso8601String(),
        "asmaY_PreAdm_F_Date": asmaYPreAdmFDate?.toIso8601String(),
        "asmaY_PreAdm_T_Date": asmaYPreAdmTDate?.toIso8601String(),
        "asmaY_Order": asmaYOrder,
        "asmaY_ActiveFlag": asmaYActiveFlag,
        "asmaY_Cut_Of_Date": asmaYCutOfDate?.toIso8601String(),
        "asmaY_Pre_ActiveFlag": asmaYPreActiveFlag,
        "is_Active": isActive,
        "asmaY_ReggularFlg": asmaYReggularFlg,
        "asmaY_NewFlg": asmaYNewFlg,
        "asmaY_NewAdmissionFlg": asmaYNewAdmissionFlg,
        "asmaY_TransportSDate": asmaYTransportSDate,
        "asmaY_TransportEDate": asmaYTransportEDate,
        "asmaY_CreatedBy": asmaYCreatedBy,
        "asmaY_UpdatedBy": asmaYUpdatedBy,
        "asmaY_ReferenceDate": asmaYReferenceDate,
        "asmaY_AcademicYearCode": asmaYAcademicYearCode,
        "createdDate": createdDate?.toIso8601String(),
        "updatedDate": updatedDate?.toIso8601String(),
        "asmaY_AdvanceFeeDate": asmaYAdvanceFeeDate,
        "asmaY_RegularFeeFDate": asmaYRegularFeeFDate,
        "asmaY_RegularFeeTDate": asmaYRegularFeeTDate,
        "asmaY_ArrearFeeDate": asmaYArrearFeeDate,
      };
}
