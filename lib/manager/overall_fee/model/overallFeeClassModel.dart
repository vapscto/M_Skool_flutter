// To parse this JSON data, do
//
//     final overallFeeClassModel = overallFeeClassModelFromJson(jsonString);

import 'dart:convert';

OverallFeeClassModel overallFeeClassModelFromJson(String str) =>
    OverallFeeClassModel.fromJson(json.decode(str));

String overallFeeClassModelToJson(OverallFeeClassModel data) =>
    json.encode(data.toJson());

class OverallFeeClassModel {
  OverallFeeClassModel({
    this.classarray,
  });

  Classarray? classarray;

  factory OverallFeeClassModel.fromJson(Map<String, dynamic> json) =>
      OverallFeeClassModel(
        classarray: Classarray.fromJson(json["classarray"]),
      );

  Map<String, dynamic> toJson() => {
        "classarray": classarray!.toJson(),
      };
}

class Classarray {
  Classarray({
    this.type,
    this.values,
  });

  String? type;
  List<ClassarrayValue?>? values;

  factory Classarray.fromJson(Map<String, dynamic> json) => Classarray(
        type: json["\$type"],
        values: json["\$values"] == null
            ? []
            : List<ClassarrayValue?>.from(
                json["\$values"].map((x) => ClassarrayValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x!.toJson())),
      };
}

class ClassarrayValue {
  ClassarrayValue({
    this.emEId,
    this.mIId,
    this.asmaYId,
    this.totalsms,
    this.totalEmail,
    this.castid,
    this.balance,
    this.paid,
    this.receivable,
    this.concession,
    this.asmSId,
    this.classid,
    this.asmcLId,
    this.className,
    this.studCount,
  });

  int? emEId;
  int? mIId;
  int? asmaYId;
  int? totalsms;
  int? totalEmail;
  int? castid;
  int? balance;
  double? paid;
  double? receivable;
  double? concession;
  int? asmSId;
  int? classid;
  int? asmcLId;
  String? className;
  int? studCount;

  factory ClassarrayValue.fromJson(Map<String, dynamic> json) =>
      ClassarrayValue(
        emEId: json["emE_Id"],
        mIId: json["mI_Id"],
        asmaYId: json["asmaY_Id"],
        totalsms: json["totalsms"],
        totalEmail: json["totalEmail"],
        castid: json["castid"],
        balance: json["balance"],
        paid: json["paid"],
        receivable: json["receivable"],
        concession: json["concession"],
        asmSId: json["asmS_Id"],
        classid: json["classid"],
        asmcLId: json["asmcL_Id"],
        className: json["class_Name"],
        studCount: json["stud_count"],
      );

  Map<String, dynamic> toJson() => {
        "emE_Id": emEId,
        "mI_Id": mIId,
        "asmaY_Id": asmaYId,
        "totalsms": totalsms,
        "totalEmail": totalEmail,
        "castid": castid,
        "balance": balance,
        "paid": paid,
        "receivable": receivable,
        "concession": concession,
        "asmS_Id": asmSId,
        "classid": classid,
        "asmcL_Id": asmcLId,
        "class_Name": className,
        "stud_count": studCount,
      };
}
