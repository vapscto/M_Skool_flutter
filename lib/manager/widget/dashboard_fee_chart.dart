// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:m_skool_flutter/manager/controller/manager_dashboard_controller.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class DashboardFeeChart extends StatefulWidget {
  final ManagerDashboardController dashboardController;
  const DashboardFeeChart({super.key, required this.dashboardController});

  @override
  State<DashboardFeeChart> createState() => _DashboardFeeChartState();
}

class _DashboardFeeChartState extends State<DashboardFeeChart> {
  List<ManagerFeeModel> fee = [];

  @override
  void initState() {
    fee.add(ManagerFeeModel(
        amount: widget.dashboardController.fee.first.fSSCurrentYrCharges! /
            1000.toDouble(),
        name: "Total Charges",
        color: const Color(0xFF2F8F9D)));
    fee.add(ManagerFeeModel(
        amount:
            widget.dashboardController.fee.first.concession! / 1000.toDouble(),
        name: "Concession",
        color: const Color(0xFF3BACB6)));

    fee.add(ManagerFeeModel(
        amount: widget.dashboardController.fee.first.fSSPaidAmount! /
            1000.toDouble(),
        name: "Total Paid",
        color: const Color(0xFF82DBD8)));
    fee.add(ManagerFeeModel(
        amount: widget.dashboardController.fee.first.balance! / 1000.toDouble(),
        name: "Now Payable",
        color: const Color(0xFFB3E8E5)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16.0,
        ),
        CustomContainer(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12.0),
                      topRight: Radius.circular(12.0),
                    ),
                    color: Color(0xFFE2FCFF)),
                child: ListTile(
                  visualDensity: const VisualDensity(
                      vertical: VisualDensity.minimumDensity),
                  title: Text(
                    "Fee Analysis",
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                        const TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF158592))),
                  ),
                  // trailing: Chip(label: Text("${widget.dashboardController.preAdmission.first.}")),
                ),
              ),
              const SizedBox(
                height: 12.0,
              ),
              SfCartesianChart(
                  primaryXAxis: CategoryAxis(),
                  primaryYAxis: NumericAxis(labelFormat: "{value} K"),
                  series: [
                    ColumnSeries<ManagerFeeModel, String>(
                        dataSource: fee,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(
                              8.0,
                            ),
                            topRight: Radius.circular(8.0)),
                        pointColorMapper: (datum, index) => datum.color,
                        xValueMapper: ((datum, index) => datum.name),
                        yValueMapper: ((datum, index) => datum.amount))
                  ]),
              const SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class ManagerFeeModel {
  final double amount;
  final String name;
  final Color color;
  ManagerFeeModel({
    required this.amount,
    required this.name,
    required this.color,
  });

  ManagerFeeModel copyWith({
    double? amount,
    String? name,
    Color? color,
  }) {
    return ManagerFeeModel(
      amount: amount ?? this.amount,
      name: name ?? this.name,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'amount': amount,
      'name': name,
      'color': color.value,
    };
  }

  factory ManagerFeeModel.fromMap(Map<String, dynamic> map) {
    return ManagerFeeModel(
      amount: map['amount'] as double,
      name: map['name'] as String,
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory ManagerFeeModel.fromJson(String source) =>
      ManagerFeeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ManagerFeeModel(amount: $amount, name: $name, color: $color)';

  @override
  bool operator ==(covariant ManagerFeeModel other) {
    if (identical(this, other)) return true;

    return other.amount == amount && other.name == name && other.color == color;
  }

  @override
  int get hashCode => amount.hashCode ^ name.hashCode ^ color.hashCode;
}
