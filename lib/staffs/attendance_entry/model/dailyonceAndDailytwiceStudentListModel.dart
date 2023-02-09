// To parse this JSON data, do
//
//     final dailyOnceAndDailyTwiceStudentListModel = dailyOnceAndDailyTwiceStudentListModelFromJson(jsonString);

import 'dart:convert';

DailyOnceAndDailyTwiceStudentListModel
    dailyOnceAndDailyTwiceStudentListModelFromJson(String str) =>
        DailyOnceAndDailyTwiceStudentListModel.fromJson(json.decode(str));

String dailyOnceAndDailyTwiceStudentListModelToJson(
        DailyOnceAndDailyTwiceStudentListModel data) =>
    json.encode(data.toJson());

class DailyOnceAndDailyTwiceStudentListModel {
  DailyOnceAndDailyTwiceStudentListModel({
    this.asAId,
    this.studentList,
  });

  int? asAId;
  DailyOnceAndDailyTwiceStudentList? studentList;

  factory DailyOnceAndDailyTwiceStudentListModel.fromJson(
          Map<String, dynamic> json) =>
      DailyOnceAndDailyTwiceStudentListModel(
        asAId: json["asA_Id"],
        studentList:
            DailyOnceAndDailyTwiceStudentList.fromJson(json["studentList"]),
      );

  Map<String, dynamic> toJson() => {
        "asA_Id": asAId,
        "studentList": studentList!.toJson(),
      };
}

class DailyOnceAndDailyTwiceStudentList {
  DailyOnceAndDailyTwiceStudentList({
    this.type,
    this.values,
  });

  String? type;
  List<DailyOnceAndDailyTwiceStudentListValue?>? values;

  factory DailyOnceAndDailyTwiceStudentList.fromJson(
          Map<String, dynamic> json) =>
      DailyOnceAndDailyTwiceStudentList(
        type: json["\$type"],
        values: List<DailyOnceAndDailyTwiceStudentListValue?>.from(
            json["\$values"].map(
                (x) => DailyOnceAndDailyTwiceStudentListValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "\$type": type,
        "\$values": List<dynamic>.from(values!.map((x) => x!.toJson())),
      };
}

class DailyOnceAndDailyTwiceStudentListValue {
  DailyOnceAndDailyTwiceStudentListValue({
    this.amaYRollNo,
    this.amsTAdmNo,
    this.amsTId,
    this.studentname,
    this.pdays,
    this.asaSId,
    this.asaDailytwiceFlag,
    this.asAId,
    this.ismSId,
    this.asasBId,
    this.amsTRegistrationNo,
  });

  int? amaYRollNo;
  String? amsTAdmNo;
  int? amsTId;
  String? studentname;
  double? pdays;
  int? asaSId;
  String? asaDailytwiceFlag;
  int? asAId;
  int? ismSId;
  int? asasBId;
  String? amsTRegistrationNo;

  factory DailyOnceAndDailyTwiceStudentListValue.fromJson(
          Map<String, dynamic> json) =>
      DailyOnceAndDailyTwiceStudentListValue(
        amaYRollNo: json["amaY_RollNo"],
        amsTAdmNo: json["amsT_AdmNo"],
        amsTId: json["amsT_Id"],
        studentname: json["studentname"],
        pdays: json["pdays"] ?? 0.0,
        asaSId: json["asaS_Id"] ?? 0,
        asaDailytwiceFlag: json["asA_Dailytwice_Flag"] ?? '',
        asAId: json["asA_Id"],
        ismSId: json["ismS_Id"],
        asasBId: json["asasB_Id"],
        amsTRegistrationNo: json["amsT_RegistrationNo"],
      );

  Map<String, dynamic> toJson() => {
        "amaY_RollNo": amaYRollNo,
        "amsT_AdmNo": amsTAdmNo,
        "amsT_Id": amsTId,
        "studentname": studentname,
        "pdays": pdays,
        "asaS_Id": asaSId,
        "asA_Dailytwice_Flag": asaDailytwiceFlag,
        "asA_Id": asAId,
        "ismS_Id": ismSId,
        "asasB_Id": asasBId,
        "amsT_RegistrationNo": amsTRegistrationNo,
      };
}
