// To parse this JSON data, do
//
//     final examDropdownModel = examDropdownModelFromJson(jsonString);

import 'dart:convert';

ExamDropdownModel? examDropdownModelFromJson(String str) =>
    ExamDropdownModel.fromJson(json.decode(str));

String examDropdownModelToJson(ExamDropdownModel? data) =>
    json.encode(data!.toJson());

class ExamDropdownModel {
  ExamDropdownModel({
    this.estMId,
    this.mIId,
    this.asmaYId,
    this.asmcLId,
    this.asmSId,
    this.amsTId,
    this.emEId,
    this.ismSId,
    this.roleid,
    this.estMMarks,
    this.id,
    this.loginDateTime,
    this.estMActiveFlg,
    this.examlist,
    this.emgRId,
    this.saveupdatecount,
    this.lastdateentry,
    this.lastdateentryflag,
    this.emsSId,
    this.emsEId,
    this.lastdateexam,
    this.lastdateexamflag,
  });

  int? estMId;
  int? mIId;
  int? asmaYId;
  int? asmcLId;
  int? asmSId;
  int? amsTId;
  int? emEId;
  int? ismSId;
  int? roleid;
  int? estMMarks;
  int? id;
  DateTime? loginDateTime;
  bool? estMActiveFlg;
  Examlist? examlist;
  int? emgRId;
  int? saveupdatecount;
  int? lastdateentry;
  bool? lastdateentryflag;
  int? emsSId;
  int? emsEId;
  int? lastdateexam;
  bool? lastdateexamflag;

  factory ExamDropdownModel.fromJson(Map<String, dynamic> json) =>
      ExamDropdownModel(
        estMId: json["estM_Id"],
        mIId: json["mI_Id"],
        asmaYId: json["asmaY_Id"],
        asmcLId: json["asmcL_Id"],
        asmSId: json["asmS_Id"],
        amsTId: json["amsT_Id"],
        emEId: json["emE_Id"],
        ismSId: json["ismS_Id"],
        roleid: json["roleid"],
        estMMarks: json["estM_Marks"],
        id: json["id"],
        loginDateTime: DateTime.parse(json["loginDateTime"]),
        estMActiveFlg: json["estM_ActiveFlg"],
        examlist: Examlist.fromJson(json["examlist"]),
        emgRId: json["emgR_Id"],
        saveupdatecount: json["saveupdatecount"],
        lastdateentry: json["lastdateentry"],
        lastdateentryflag: json["lastdateentryflag"],
        emsSId: json["emsS_Id"],
        emsEId: json["emsE_Id"],
        lastdateexam: json["lastdateexam"],
        lastdateexamflag: json["lastdateexamflag"],
      );

  Map<String, dynamic> toJson() => {
        "estM_Id": estMId,
        "mI_Id": mIId,
        "asmaY_Id": asmaYId,
        "asmcL_Id": asmcLId,
        "asmS_Id": asmSId,
        "amsT_Id": amsTId,
        "emE_Id": emEId,
        "ismS_Id": ismSId,
        "roleid": roleid,
        "estM_Marks": estMMarks,
        "id": id,
        "loginDateTime": loginDateTime?.toIso8601String(),
        "estM_ActiveFlg": estMActiveFlg,
        "examlist": examlist!.toJson(),
        "emgR_Id": emgRId,
        "saveupdatecount": saveupdatecount,
        "lastdateentry": lastdateentry,
        "lastdateentryflag": lastdateentryflag,
        "emsS_Id": emsSId,
        "emsE_Id": emsEId,
        "lastdateexam": lastdateexam,
        "lastdateexamflag": lastdateexamflag,
      };
}

class Examlist {
  Examlist({
    this.type,
    this.values,
  });

  String? type;
  List<Value?>? values;

  factory Examlist.fromJson(Map<String, dynamic> json) => Examlist(
        type: json["\$type"],
        values: json["\$values"] == null
            ? []
            : List<Value?>.from(
                json["\$values"]!.map((x) => Value.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\u0024type": type,
        "\u0024values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x!.toJson())),
      };
}

class Value {
  Value({
    this.emEId,
    this.mIId,
    this.emEExamName,
    this.emEExamCode,
    this.emEIvrsExamName,
    this.emEExamOrder,
    this.emEFinalExamFlag,
    this.emEActiveFlag,
    this.updatedDate,
    this.createdDate,
    this.emEExamDescription,
  });

  int? emEId;
  int? mIId;
  String? emEExamName;
  String? emEExamCode;
  String? emEIvrsExamName;
  int? emEExamOrder;
  bool? emEFinalExamFlag;
  bool? emEActiveFlag;
  DateTime? updatedDate;
  DateTime? createdDate;
  String? emEExamDescription;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        emEId: json["emE_Id"],
        mIId: json["mI_Id"],
        emEExamName: json["emE_ExamName"],
        emEExamCode: json["emE_ExamCode"],
        emEIvrsExamName: json["emE_IVRSExamName"],
        emEExamOrder: json["emE_ExamOrder"],
        emEFinalExamFlag: json["emE_FinalExamFlag"],
        emEActiveFlag: json["emE_ActiveFlag"],
        updatedDate: DateTime.parse(json["updatedDate"]),
        createdDate: json["createdDate"],
        emEExamDescription: json["emE_ExamDescription"],
      );

  Map<String, dynamic> toJson() => {
        "emE_Id": emEId,
        "mI_Id": mIId,
        "emE_ExamName": emEExamName,
        "emE_ExamCode": emEExamCode,
        "emE_IVRSExamName": emEIvrsExamName,
        "emE_ExamOrder": emEExamOrder,
        "emE_FinalExamFlag": emEFinalExamFlag,
        "emE_ActiveFlag": emEActiveFlag,
        "updatedDate": updatedDate?.toIso8601String(),
        "createdDate": createdDate,
        "emE_ExamDescription": emEExamDescription,
      };
}
