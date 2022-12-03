// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:get/get.dart';

import 'package:m_skool_flutter/fees/model/custom_grp_list.dart';
import 'package:m_skool_flutter/fees/model/disable_terms_model.dart';

class PaymentSelectionTracking extends GetxController {
  final RxList<Selections> selectedCheckBox = RxList();

  final RxList<PaymentInfo> payment = RxList();
}

class Selections {
  final int fmggId;
  final int fmtId;
  RxBool isDisabled;
  RxBool isChecked;
  Selections({
    required this.fmggId,
    required this.fmtId,
    required this.isDisabled,
    required this.isChecked,
  });

  Selections copyWith({
    int? fmggId,
    int? fmtId,
    RxBool? isDisabled,
    RxBool? isChecked,
  }) {
    return Selections(
      fmggId: fmggId ?? this.fmggId,
      fmtId: fmtId ?? this.fmtId,
      isDisabled: isDisabled ?? this.isDisabled,
      isChecked: isChecked ?? this.isChecked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fmggId': fmggId,
      'fmtId': fmtId,
      // 'isDisabled': isDisabled.toMap(),
      // 'isChecked': isChecked.toMap(),
    };
  }

  // factory Selections.fromMap(Map<String, dynamic> map) {
  //   return Selections(
  //     fmggId: map['fmggId'] as int,
  //     fmtId: map['fmtId'] as int,
  //     // isDisabled: RxBool.fromMap(map['isDisabled'] as Map<String,dynamic>),
  //     // isChecked: RxBool.fromMap(map['isChecked'] as Map<String,dynamic>),
  //   );
  // }

  String toJson() => json.encode(toMap());

  // factory Selections.fromJson(String source) => Selections.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Selections(fmggId: $fmggId, fmtId: $fmtId, isDisabled: $isDisabled, isChecked: $isChecked)';
  }

  @override
  bool operator ==(covariant Selections other) {
    if (identical(this, other)) return true;

    return other.fmggId == fmggId &&
        other.fmtId == fmtId &&
        other.isDisabled == isDisabled &&
        other.isChecked == isChecked;
  }

  @override
  int get hashCode {
    return fmggId.hashCode ^
        fmtId.hashCode ^
        isDisabled.hashCode ^
        isChecked.hashCode;
  }
}

class PaymentInfo {
  final int fmggId;
  final int fmtId;
  final DisableTermsModelValues disableTermsModelValues;
  final CustomgGrplistValues customgGrplistValues;
  PaymentInfo({
    required this.fmggId,
    required this.fmtId,
    required this.disableTermsModelValues,
    required this.customgGrplistValues,
  });

  PaymentInfo copyWith({
    int? fmggId,
    int? fmtId,
    DisableTermsModelValues? disableTermsModelValues,
    CustomgGrplistValues? customgGrplistValues,
  }) {
    return PaymentInfo(
      fmggId: fmggId ?? this.fmggId,
      fmtId: fmtId ?? this.fmtId,
      disableTermsModelValues:
          disableTermsModelValues ?? this.disableTermsModelValues,
      customgGrplistValues: customgGrplistValues ?? this.customgGrplistValues,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fmggId': fmggId,
      'fmtId': fmtId,
      'disableTermsModelValues': disableTermsModelValues.toJson(),
      'customgGrplistValues': customgGrplistValues.toJson(),
    };
  }

  factory PaymentInfo.fromMap(Map<String, dynamic> map) {
    return PaymentInfo(
      fmggId: map['fmggId'] as int,
      fmtId: map['fmtId'] as int,
      disableTermsModelValues: DisableTermsModelValues.fromJson(
          map['disableTermsModelValues'] as Map<String, dynamic>),
      customgGrplistValues: CustomgGrplistValues.fromJson(
          map['customgGrplistValues'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentInfo.fromJson(String source) =>
      PaymentInfo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PaymentInfo(fmggId: $fmggId, fmtId: $fmtId, disableTermsModelValues: $disableTermsModelValues, customgGrplistValues: $customgGrplistValues)';
  }

  @override
  bool operator ==(covariant PaymentInfo other) {
    if (identical(this, other)) return true;

    return other.fmggId == fmggId &&
        other.fmtId == fmtId &&
        other.disableTermsModelValues == disableTermsModelValues &&
        other.customgGrplistValues == customgGrplistValues;
  }

  @override
  int get hashCode {
    return fmggId.hashCode ^
        fmtId.hashCode ^
        disableTermsModelValues.hashCode ^
        customgGrplistValues.hashCode;
  }
}
