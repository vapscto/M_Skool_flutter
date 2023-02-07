// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class SearchTypes {
  SearchTypes.init();
  static final SearchTypes instance = SearchTypes.init();

  List<Map<String, dynamic>> getTypes = [
    {
      "value": "AMST_FirstName",
      "name": "FirstName",
      "keyboardType": TextInputType.name,
    },
    {
      "value": "AMST_MiddleName",
      "name": "MiddleName",
      "keyboardType": TextInputType.name,
    },
    {
      "value": "AMST_LastName",
      "name": "LastName",
      "keyboardType": TextInputType.name,
    },
    {
      "value": "AMST_RegistrationNo",
      "name": "RegNo",
      "keyboardType": TextInputType.text,
    },
    {
      "value": "AMST_AdmNo",
      "name": "AdmissionNo",
      "keyboardType": TextInputType.number,
    },
    {
      "value": "PASR_Age",
      "name": "Age",
      "keyboardType": TextInputType.number,
    },
    {
      "value": "AMST_AadharNo",
      "name": "AadharNo",
      "keyboardType": TextInputType.number,
    },
    {
      "value": "AMST_MobileNo",
      "name": "MobileNo",
      "keyboardType": TextInputType.number,
    },
    {
      "value": "AMST_Sex",
      "name": "Sex",
      "keyboardType": TextInputType.text,
    },
    {
      "value": "AMST_Date",
      "name": "Date",
      "keyboardType": TextInputType.datetime,
    },
    {
      "value": "AMST_emailId",
      "name": "Email id",
      "keyboardType": TextInputType.emailAddress,
    },
    {
      "value": "AMST_FatherName",
      "name": "Father Name",
      "keyboardType": TextInputType.name,
    },
    {
      "value": "AMST_MotherName",
      "name": "Mother Name",
      "keyboardType": TextInputType.name,
    },
    {
      "value": "StudentName",
      "name": "Student Name",
      "keyboardType": TextInputType.name,
    },
    {
      "value": "ASMCL_ClassName",
      "name": "Class",
      "keyboardType": TextInputType.name,
    },
    {
      "value": "ASMC_SectionName",
      "name": "Section",
      "keyboardType": TextInputType.name,
    }
  ];

  List<Map<String, dynamic>> operators = [
    {
      "value": "=",
      "name": "Equal to",
    },
    {
      "value": "!=",
      "name": "Not Equal to",
    },
    {
      "value": "like",
      "name": "Like",
    },
    {
      "value": ">",
      "name": "Greater than",
    },
    {
      "value": "<",
      "name": "Less than",
    }
  ];

  List<Map<String, dynamic>> conditions = [
    {
      "value": "AND",
      "name": "AND",
    },
    {
      "value": "OR",
      "name": "OR",
    }
  ];
}

class SearchTypeModel {
  final String name;
  final String value;
  final TextInputType keyboardType;
  SearchTypeModel({
    required this.name,
    required this.value,
    required this.keyboardType,
  });

  SearchTypeModel copyWith({
    String? name,
    String? value,
    TextInputType? keyboardType,
  }) {
    return SearchTypeModel(
      name: name ?? this.name,
      value: value ?? this.value,
      keyboardType: keyboardType ?? this.keyboardType,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'value': value,
      'keyboardType': keyboardType,
    };
  }

  factory SearchTypeModel.fromMap(Map<String, dynamic> map) {
    return SearchTypeModel(
      name: map['name'] as String,
      value: map['value'] as String,
      keyboardType: map['keyboardType'] as TextInputType,
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchTypeModel.fromJson(String source) =>
      SearchTypeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'SearchTypeModel(name: $name, value: $value, keyboardType: $keyboardType)';

  @override
  bool operator ==(covariant SearchTypeModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.value == value &&
        other.keyboardType == keyboardType;
  }

  @override
  int get hashCode => name.hashCode ^ value.hashCode ^ keyboardType.hashCode;
}
