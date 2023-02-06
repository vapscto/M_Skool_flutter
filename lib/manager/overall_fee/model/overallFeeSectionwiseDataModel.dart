// To parse this JSON data, do
//
//     final classwiseSectionDetailModel = classwiseSectionDetailModelFromJson(jsonString);

import 'dart:convert';

ClasswiseSectionDetailModel classwiseSectionDetailModelFromJson(String str) =>
    ClasswiseSectionDetailModel.fromJson(json.decode(str));

String classwiseSectionDetailModelToJson(ClasswiseSectionDetailModel data) =>
    json.encode(data.toJson());

class ClasswiseSectionDetailModel {
  ClasswiseSectionDetailModel({
    this.academicFeesdetails,
  });

  SectionWiseFeedetails? academicFeesdetails;

  factory ClasswiseSectionDetailModel.fromJson(Map<String, dynamic> json) =>
      ClasswiseSectionDetailModel(
        academicFeesdetails:
            SectionWiseFeedetails.fromJson(json["academicFeesdetails"]),
      );

  Map<String, dynamic> toJson() => {
        "academicFeesdetails": academicFeesdetails!.toJson(),
      };
}

class SectionWiseFeedetails {
  SectionWiseFeedetails({
    this.type,
    this.values,
  });

  String? type;
  List<SectionWiseFeedetailsValue?>? values;

  factory SectionWiseFeedetails.fromJson(Map<String, dynamic> json) =>
      SectionWiseFeedetails(
        type: json["\$type"],
        values: json['\$values'] == null
            ? []
            : List<SectionWiseFeedetailsValue?>.from(json["\$values"]
                .map((x) => SectionWiseFeedetailsValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x!.toJson())),
      };
}

class SectionWiseFeedetailsValue {
  SectionWiseFeedetailsValue({
    this.type,
    this.asmclClassName,
    this.asmcSectionName,
    this.fssPaidAmount,
    this.balance,
    this.concession,
    this.fssCurrentYrCharges,
  });

  String? type;
  String? asmclClassName;
  String? asmcSectionName;
  num? fssPaidAmount;
  num? balance;
  num? concession;
  num? fssCurrentYrCharges;

  factory SectionWiseFeedetailsValue.fromJson(Map<String, dynamic> json) =>
      SectionWiseFeedetailsValue(
        type: json["\$type"],
        asmclClassName: json["ASMCL_ClassName"],
        asmcSectionName: json["ASMC_SectionName"],
        fssPaidAmount: json["FSS_PaidAmount"],
        balance: json["balance"],
        concession: json["concession"],
        fssCurrentYrCharges: json["FSS_CurrentYrCharges"],
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "ASMCL_ClassName": asmclClassName,
        "ASMC_SectionName": asmcSectionName,
        "FSS_PaidAmount": fssPaidAmount,
        "balance": balance,
        "concession": concession,
        "FSS_CurrentYrCharges": fssCurrentYrCharges,
      };
}
