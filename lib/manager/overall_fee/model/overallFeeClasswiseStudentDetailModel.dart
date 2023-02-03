// To parse this JSON data, do
//
//     final overallFeeClasswiseStudentDetailModel = overallFeeClasswiseStudentDetailModelFromJson(jsonString);

import 'dart:convert';

OverallFeeClasswiseStudentDetailModel
    overallFeeClasswiseStudentDetailModelFromJson(String str) =>
        OverallFeeClasswiseStudentDetailModel.fromJson(json.decode(str));

String overallFeeClasswiseStudentDetailModelToJson(
        OverallFeeClasswiseStudentDetailModel data) =>
    json.encode(data.toJson());

class OverallFeeClasswiseStudentDetailModel {
  OverallFeeClasswiseStudentDetailModel({
    this.studbal,
  });

  Studbal? studbal;

  factory OverallFeeClasswiseStudentDetailModel.fromJson(
          Map<String, dynamic> json) =>
      OverallFeeClasswiseStudentDetailModel(
        studbal: Studbal.fromJson(json["studbal"]),
      );

  Map<String, dynamic> toJson() => {
        "studbal": studbal!.toJson(),
      };
}

class Studbal {
  Studbal({
    this.type,
    this.values,
  });

  String? type;
  List<StudbalValue?>? values;

  factory Studbal.fromJson(Map<String, dynamic> json) => Studbal(
        type: json["\$type"],
        values: json["\$values"] == null
            ? []
            : List<StudbalValue?>.from(
                json["\$values"].map((x) => StudbalValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x!.toJson())),
      };
}

class StudbalValue {
  StudbalValue({
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
    this.section,
    this.classid,
    this.asmcLId,
    this.name,
    this.admno,
    this.regno,
    this.mobile,
    this.className,
    this.studCount,
  });

  int? emEId;
  int? mIId;
  int? asmaYId;
  int? totalsms;
  int? totalEmail;
  int? castid;
  num? balance;
  num? paid;
  num? receivable;
  num? concession;
  int? asmSId;
  String? section;
  int? classid;
  int? asmcLId;
  String? name;
  String? admno;
  String? regno;
  String? mobile;
  String? className;
  int? studCount;

  factory StudbalValue.fromJson(Map<String, dynamic> json) => StudbalValue(
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
        section: json["section"],
        classid: json["classid"],
        asmcLId: json["asmcL_Id"],
        name: json["name"],
        admno: json["admno"],
        regno: json["regno"],
        mobile: json["mobile"],
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
        "section": section,
        "classid": classid,
        "asmcL_Id": asmcLId,
        "name": name,
        "admno": admno,
        "regno": regno,
        "mobile": mobile,
        "class_Name": className,
        "stud_count": studCount,
      };
}
