// To parse this JSON data, do
//
//     final classwiseFeeAcademicModel = classwiseFeeAcademicModelFromJson(jsonString);

import 'dart:convert';

ClasswiseFeeResultModel classwiseFeeAcademicModelFromJson(String str) =>
    ClasswiseFeeResultModel.fromJson(json.decode(str));

String classwiseFeeAcademicModelToJson(ClasswiseFeeResultModel data) =>
    json.encode(data.toJson());

class ClasswiseFeeResultModel {
  ClasswiseFeeResultModel({
    this.academicFeesdetails,
  });

  AcademicFeesdetails? academicFeesdetails;

  factory ClasswiseFeeResultModel.fromJson(Map<String, dynamic> json) =>
      ClasswiseFeeResultModel(
        academicFeesdetails:
            AcademicFeesdetails.fromJson(json["academicFeesdetails"]),
      );

  Map<String, dynamic> toJson() => {
        "academicFeesdetails": academicFeesdetails!.toJson(),
      };
}

class AcademicFeesdetails {
  AcademicFeesdetails({
    this.type,
    this.values,
  });

  String? type;
  List<AcademicFeesdetailsValue?>? values;

  factory AcademicFeesdetails.fromJson(Map<String, dynamic> json) =>
      AcademicFeesdetails(
        type: json["\$type"],
        values: json['\$values'] == null
            ? []
            : List<AcademicFeesdetailsValue?>.from(json["\$values"]
                .map((x) => AcademicFeesdetailsValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x!.toJson())),
      };
}

class AcademicFeesdetailsValue {
  AcademicFeesdetailsValue({
    this.type,
    this.asmclClassName,
    this.asmclId,
    this.fssPaidAmount,
    this.balance,
    this.concession,
    this.fssCurrentYrCharges,
  });

  String? type;
  String? asmclClassName;
  int? asmclId;
  num? fssPaidAmount;
  num? balance;
  num? concession;
  num? fssCurrentYrCharges;

  factory AcademicFeesdetailsValue.fromJson(Map<String, dynamic> json) =>
      AcademicFeesdetailsValue(
        type: json["\$type"],
        asmclClassName: json["ASMCL_ClassName"],
        asmclId: json["ASMCL_Id"],
        fssPaidAmount: json["FSS_PaidAmount"],
        balance: json["balance"],
        concession: json["concession"],
        fssCurrentYrCharges: json["FSS_CurrentYrCharges"],
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "ASMCL_ClassName": asmclClassName,
        "ASMCL_Id": asmclId,
        "FSS_PaidAmount": fssPaidAmount,
        "balance": balance,
        "concession": concession,
        "FSS_CurrentYrCharges": fssCurrentYrCharges,
      };
}
