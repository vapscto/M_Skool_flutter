import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/salary_details/models/salary_det_graph_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalaryLineChart extends StatefulWidget {
  const SalaryLineChart({super.key});

  @override
  State<SalaryLineChart> createState() => _SalaryLineChartState();
}

class _SalaryLineChartState extends State<SalaryLineChart> {
  List<SalaryGraphDetModel> salary = [
    SalaryGraphDetModel(salary: 49500 / 1000, month: "Jan"),
    SalaryGraphDetModel(salary: 51500 / 1000, month: "Feb"),
    SalaryGraphDetModel(salary: 40000 / 1000, month: "Mar"),
    SalaryGraphDetModel(salary: 47580 / 1000, month: "Apr"),
    SalaryGraphDetModel(salary: 49000 / 1000, month: "May"),
  ];

  List<SalaryGraphDetModel> deduction = [
    SalaryGraphDetModel(salary: 500 / 1000, month: "Jan"),
    SalaryGraphDetModel(salary: 1500 / 1000, month: "Feb"),
    SalaryGraphDetModel(salary: 4000 / 1000, month: "Mar"),
    SalaryGraphDetModel(salary: 580 / 1000, month: "Apr"),
    SalaryGraphDetModel(salary: 4900 / 1000, month: "May"),
  ];

  List<SalaryGraphDetModel> lop = [
    SalaryGraphDetModel(salary: 5070 / 1000, month: "Jan"),
    SalaryGraphDetModel(salary: 1500 / 1000, month: "Feb"),
    SalaryGraphDetModel(salary: 0 / 1000, month: "Mar"),
    SalaryGraphDetModel(salary: 5880 / 1000, month: "Apr"),
    SalaryGraphDetModel(salary: 0 / 1000, month: "May"),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const SizedBox(
              height: 4.0,
            ),
            SfCartesianChart(
              primaryYAxis: NumericAxis(labelFormat: "{value}K"),
              primaryXAxis: CategoryAxis(name: "Months"),
              series: <LineSeries>[
                LineSeries<SalaryGraphDetModel, String>(
                    name: "Salary",
                    color: const Color.fromARGB(255, 74, 173, 212),
                    dataSource: salary,
                    xValueMapper: ((datum, index) => datum.month),
                    yValueMapper: (datum, index) => datum.salary),
                LineSeries<SalaryGraphDetModel, String>(
                    name: "Deduction",
                    color: const Color(0xFFD0F801),
                    dataSource: deduction,
                    xValueMapper: ((datum, index) => datum.month),
                    yValueMapper: (datum, index) => datum.salary),
                LineSeries<SalaryGraphDetModel, String>(
                    dataSource: lop,
                    color: const Color(0xFFFF828A),
                    name: "LOP",
                    xValueMapper: ((datum, index) => datum.month),
                    yValueMapper: (datum, index) => datum.salary)
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      color: Color.fromARGB(255, 74, 173, 212),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text("Salary"),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      color: Color(0xFFD0F801),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text("Deduction"),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      color: Color(0xFFFF828A),
                    ),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text("LOP"),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
          ],
        ),
      ),
    );
  }
}
