// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class DayWisett {
  final String dayName;
  final List<DayWisettValue> value;
  DayWisett({
    required this.dayName,
    required this.value,
  });

  DayWisett copyWith({
    String? dayName,
    List<DayWisettValue>? value,
  }) {
    return DayWisett(
      dayName: dayName ?? this.dayName,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dayName': dayName,
      'value': value.map((x) => x.toMap()).toList(),
    };
  }

  factory DayWisett.fromMap(Map<String, dynamic> map) {
    return DayWisett(
      dayName: map['dayName'] as String,
      value: List<DayWisettValue>.from(
        (map['value'] as List<int>).map<DayWisettValue>(
          (x) => DayWisettValue.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory DayWisett.fromJson(String source) =>
      DayWisett.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'DayWisett(dayName: $dayName, value: $value)';

  @override
  bool operator ==(covariant DayWisett other) {
    if (identical(this, other)) return true;

    return other.dayName == dayName && listEquals(other.value, value);
  }

  @override
  int get hashCode => dayName.hashCode ^ value.hashCode;
}

class DayWisettValue {
  final String subjectName;
  final String teacher;
  final int period;
  DayWisettValue({
    required this.subjectName,
    required this.teacher,
    required this.period,
  });

  DayWisettValue copyWith({
    String? subjectName,
    String? teacher,
    int? period,
  }) {
    return DayWisettValue(
      subjectName: subjectName ?? this.subjectName,
      teacher: teacher ?? this.teacher,
      period: period ?? this.period,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subjectName': subjectName,
      'teacher': teacher,
      'period': period,
    };
  }

  factory DayWisettValue.fromMap(Map<String, dynamic> map) {
    return DayWisettValue(
      subjectName: map['subjectName'] as String,
      teacher: map['teacher'] as String,
      period: map['period'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory DayWisettValue.fromJson(String source) =>
      DayWisettValue.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'DayWisettValue(subjectName: $subjectName, teacher: $teacher, period: $period)';

  @override
  bool operator ==(covariant DayWisettValue other) {
    if (identical(this, other)) return true;

    return other.subjectName == subjectName &&
        other.teacher == teacher &&
        other.period == period;
  }

  @override
  int get hashCode => subjectName.hashCode ^ teacher.hashCode ^ period.hashCode;
}
