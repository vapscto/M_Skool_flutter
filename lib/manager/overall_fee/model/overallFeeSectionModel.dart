// To parse this JSON data, do
//
//     final overallFeeSectionModel = overallFeeSectionModelFromJson(jsonString);

import 'dart:convert';

OverallFeeSectionModel overallFeeSectionModelFromJson(String str) =>
    OverallFeeSectionModel.fromJson(json.decode(str));

String overallFeeSectionModelToJson(OverallFeeSectionModel data) =>
    json.encode(data.toJson());

class OverallFeeSectionModel {
  OverallFeeSectionModel({
    this.fillsection,
  });

  Fillsection? fillsection;

  factory OverallFeeSectionModel.fromJson(Map<String, dynamic> json) =>
      OverallFeeSectionModel(
        fillsection: Fillsection.fromJson(json["fillsection"]),
      );

  Map<String, dynamic> toJson() => {
        "fillsection": fillsection!.toJson(),
      };
}

class Fillsection {
  Fillsection({
    this.type,
    this.values,
  });

  String? type;
  List<FillsectionValue?>? values;

  factory Fillsection.fromJson(Map<String, dynamic> json) => Fillsection(
        type: json["\$type"],
        values: json["\$values"] == null
            ? []
            : List<FillsectionValue>.from(
                json["\$values"].map((x) => FillsectionValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x!.toJson())),
      };
}

class FillsectionValue {
  FillsectionValue({
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
    this.sectionname,
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
  String? sectionname;
  int? studCount;

  factory FillsectionValue.fromJson(Map<String, dynamic> json) =>
      FillsectionValue(
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
        sectionname: json["sectionname"],
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
        "sectionname": sectionname,
        "stud_count": studCount,
      };
}
