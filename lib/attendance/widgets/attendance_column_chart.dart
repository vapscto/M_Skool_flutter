// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AttendanceColumnChart extends StatefulWidget {
  const AttendanceColumnChart({super.key});

  @override
  State<AttendanceColumnChart> createState() => _AttendanceColumnChartState();
}

class _AttendanceColumnChartState extends State<AttendanceColumnChart> {
  List<ChartData> attendance = [
    ChartData(
      xAxisValues: XAxisValues(month: "January"),
      yAxisValue: YAxisValue(totalClassHeld: 12, totalPresent: 8),
    ),
    ChartData(
      xAxisValues: XAxisValues(month: "February"),
      yAxisValue: YAxisValue(totalClassHeld: 20, totalPresent: 14),
    ),
    ChartData(
      xAxisValues: XAxisValues(month: "March"),
      yAxisValue: YAxisValue(totalClassHeld: 16, totalPresent: 9),
    ),
    ChartData(
      xAxisValues: XAxisValues(month: "April"),
      yAxisValue: YAxisValue(totalClassHeld: 18, totalPresent: 12),
    ),
    // ChartData(
    //   xAxisValues: XAxisValues(month: "May"),
    //   yAxisValue: YAxisValue(totalClassHeld: 20, totalPresent: 10),
    // ),
    // ChartData(
    //   xAxisValues: XAxisValues(month: "June"),
    //   yAxisValue: YAxisValue(totalClassHeld: 12, totalPresent: 8),
    // ),
    // ChartData(
    //   xAxisValues: XAxisValues(month: "July"),
    //   yAxisValue: YAxisValue(totalClassHeld: 20, totalPresent: 14),
    // ),
    // ChartData(
    //   xAxisValues: XAxisValues(month: "August"),
    //   yAxisValue: YAxisValue(totalClassHeld: 16, totalPresent: 9),
    // ),
    // ChartData(
    //   xAxisValues: XAxisValues(month: "September"),
    //   yAxisValue: YAxisValue(totalClassHeld: 18, totalPresent: 12),
    // ),
    // ChartData(
    //   xAxisValues: XAxisValues(month: "October"),
    //   yAxisValue: YAxisValue(totalClassHeld: 20, totalPresent: 10),
    // )
  ];

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      primaryXAxis: CategoryAxis(
        name: "months",
        majorGridLines: const MajorGridLines(width: 0.0),
      ),
      primaryYAxis: NumericAxis(
          minimum: 0,
          maximum: 30,
          interval: 5,
          majorGridLines: const MajorGridLines(width: 0.0)),
      enableSideBySideSeriesPlacement: false,
      tooltipBehavior: TooltipBehavior(enable: true),
      //zoomPanBehavior: ZoomPanBehavior(enablePinching: true),
      series: <ChartSeries<ChartData, String>>[
        ColumnSeries(
            name: "Total Class Held",
            color: const Color(0xFF35658F),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            dataSource: attendance,
            xValueMapper: (datum, index) {
              return datum.xAxisValues.month;
            },
            yValueMapper: (datum, index) {
              return datum.yAxisValue.totalClassHeld;
            }),
        ColumnSeries(
            name: "Total Present",
            color: const Color(0xFFDFEFFD),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12.0),
              topRight: Radius.circular(12.0),
            ),
            dataSource: attendance,
            xValueMapper: (datum, index) {
              return datum.xAxisValues.month;
            },
            yValueMapper: (datum, index) {
              return datum.yAxisValue.totalPresent;
            }),
      ],
    );
  }
}

class XAxisValues {
  final String month;
  XAxisValues({
    required this.month,
  });

  XAxisValues copyWith({
    String? month,
  }) {
    return XAxisValues(
      month: month ?? this.month,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'month': month,
    };
  }

  factory XAxisValues.fromMap(Map<String, dynamic> map) {
    return XAxisValues(
      month: map['month'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory XAxisValues.fromJson(String source) =>
      XAxisValues.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'XAxisValues(month: $month)';

  @override
  bool operator ==(covariant XAxisValues other) {
    if (identical(this, other)) return true;

    return other.month == month;
  }

  @override
  int get hashCode => month.hashCode;
}

class YAxisValue {
  int totalClassHeld;
  int totalPresent;
  YAxisValue({
    required this.totalClassHeld,
    required this.totalPresent,
  });

  YAxisValue copyWith({
    int? totalClassHeld,
    int? totalPresent,
  }) {
    return YAxisValue(
      totalClassHeld: totalClassHeld ?? this.totalClassHeld,
      totalPresent: totalPresent ?? this.totalPresent,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'totalClassHeld': totalClassHeld,
      'totalPresent': totalPresent,
    };
  }

  factory YAxisValue.fromMap(Map<String, dynamic> map) {
    return YAxisValue(
      totalClassHeld: map['totalClassHeld'] as int,
      totalPresent: map['totalPresent'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory YAxisValue.fromJson(String source) =>
      YAxisValue.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'YAxisValue(totalClassHeld: $totalClassHeld, totalPresent: $totalPresent)';

  @override
  bool operator ==(covariant YAxisValue other) {
    if (identical(this, other)) return true;

    return other.totalClassHeld == totalClassHeld &&
        other.totalPresent == totalPresent;
  }

  @override
  int get hashCode => totalClassHeld.hashCode ^ totalPresent.hashCode;
}

class ChartData {
  final XAxisValues xAxisValues;
  final YAxisValue yAxisValue;
  ChartData({
    required this.xAxisValues,
    required this.yAxisValue,
  });

  ChartData copyWith({
    XAxisValues? xAxisValues,
    YAxisValue? yAxisValue,
  }) {
    return ChartData(
      xAxisValues: xAxisValues ?? this.xAxisValues,
      yAxisValue: yAxisValue ?? this.yAxisValue,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'xAxisValues': xAxisValues.toMap(),
      'yAxisValue': yAxisValue.toMap(),
    };
  }

  factory ChartData.fromMap(Map<String, dynamic> map) {
    return ChartData(
      xAxisValues:
          XAxisValues.fromMap(map['xAxisValues'] as Map<String, dynamic>),
      yAxisValue: YAxisValue.fromMap(map['yAxisValue'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChartData.fromJson(String source) =>
      ChartData.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChartData(xAxisValues: $xAxisValues, yAxisValue: $yAxisValue)';

  @override
  bool operator ==(covariant ChartData other) {
    if (identical(this, other)) return true;

    return other.xAxisValues == xAxisValues && other.yAxisValue == yAxisValue;
  }

  @override
  int get hashCode => xAxisValues.hashCode ^ yAxisValue.hashCode;
}
