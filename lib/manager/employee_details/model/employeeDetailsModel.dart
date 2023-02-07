// To parse this JSON data, do
//
//     final employeDetailsModel = employeDetailsModelFromJson(jsonString);

import 'dart:convert';

EmployeDetailsModel employeDetailsModelFromJson(String str) =>
    EmployeDetailsModel.fromJson(json.decode(str));

String employeDetailsModelToJson(EmployeDetailsModel data) =>
    json.encode(data.toJson());

class EmployeDetailsModel {
  EmployeDetailsModel({
    this.employeeDetailsfromDatabase,
  });

  EmployeeDetails? employeeDetailsfromDatabase;

  factory EmployeDetailsModel.fromJson(Map<String, dynamic> json) =>
      EmployeDetailsModel(
        employeeDetailsfromDatabase:
            EmployeeDetails.fromJson(json["employeeDetailsfromDatabase"]),
      );

  Map<String, dynamic> toJson() => {
        "employeeDetailsfromDatabase": employeeDetailsfromDatabase!.toJson(),
      };
}

class EmployeeDetails {
  EmployeeDetails({
    this.type,
    this.values,
  });

  String? type;
  List<EmployeeDetailsValue?>? values;

  factory EmployeeDetails.fromJson(Map<String, dynamic> json) =>
      EmployeeDetails(
        type: json["\$type"],
        values: json["\$values"] == null
            ? []
            : List<EmployeeDetailsValue?>.from(
                json["\$values"].map((x) => EmployeeDetailsValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": values == null
            ? []
            : List<dynamic>.from(values!.map((x) => x!.toJson())),
      };
}

class EmployeeDetailsValue {
  EmployeeDetailsValue({
    this.type,
    this.hrmeFatherName,
    this.hrmeEmployeeCode,
    this.hrmeEmployeeFirstName,
    this.hrmeMobileNo,
    this.hrmeEmailId,
    this.hrmeDob,
  });

  String? type;
  String? hrmeFatherName;
  String? hrmeEmployeeCode;
  String? hrmeEmployeeFirstName;
  String? hrmeMobileNo;
  String? hrmeEmailId;
  String? hrmeDob;

  factory EmployeeDetailsValue.fromJson(Map<String, dynamic> json) =>
      EmployeeDetailsValue(
        type: json["\$type"],
        hrmeFatherName: json["HRME_FatherName"] ?? "Not Available",
        hrmeEmployeeCode: json["HRME_EmployeeCode"] ?? "Not Available",
        hrmeEmployeeFirstName:
            json["HRME_EmployeeFirstName"] ?? "Not Available",
        hrmeMobileNo: json["HRME_MobileNo"] ?? "Not Available",
        hrmeEmailId: json["HRME_EmailId"] ?? "Not Available",
        hrmeDob: json["HRME_DOB"] ?? "Not Available",
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "HRME_FatherName": hrmeFatherName,
        "HRME_EmployeeCode": hrmeEmployeeCode,
        "HRME_EmployeeFirstName": hrmeEmployeeFirstName,
        "HRME_MobileNo": hrmeMobileNo,
        "HRME_EmailId": hrmeEmailId,
        "HRME_DOB": hrmeDob,
      };
}
