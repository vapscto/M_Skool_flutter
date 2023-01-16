import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/salary_details/models/salary_det_graph_model.dart';
import 'package:m_skool_flutter/staffs/salary_details/models/salary_details_graph_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SalaryLineChart extends StatefulWidget {
  final List<SalaryDetailsGraphValues> graphValues;
  const SalaryLineChart({super.key, required this.graphValues});

  @override
  State<SalaryLineChart> createState() => _SalaryLineChartState();
}

class _SalaryLineChartState extends State<SalaryLineChart> {
  List<SalaryGraphDetModel> salary = [];

  List<SalaryGraphDetModel> deduction = [];

  List<SalaryGraphDetModel> lop = [];

  @override
  void initState() {
    for (var e in widget.graphValues) {
      salary.add(SalaryGraphDetModel(
          salary: e.earning! / 1000, month: e.hRESMonth!, type: "Salary"));

      deduction.add(SalaryGraphDetModel(
          salary: e.deduction! / 1000, month: e.hRESMonth!, type: "Deduction"));

      lop.add(SalaryGraphDetModel(
          salary: e.lOP! / 1000, month: e.hRESMonth!, type: "LOP"));
    }
    widget.graphValues.map((e) {
      setState(() {});
    });
    super.initState();
  }

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
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <LineSeries>[
                LineSeries<SalaryGraphDetModel, String>(
                    name: "Salary",
                    enableTooltip: true,
                    color: const Color.fromARGB(255, 74, 173, 212),
                    dataSource: salary,
                    xValueMapper: ((datum, index) => datum.month),
                    yValueMapper: (datum, index) => datum.salary),
                LineSeries<SalaryGraphDetModel, String>(
                    name: "Deduction",
                    enableTooltip: true,
                    color: const Color(0xFFD0F801),
                    dataSource: deduction,
                    xValueMapper: ((datum, index) => datum.month),
                    yValueMapper: (datum, index) => datum.salary),
                LineSeries<SalaryGraphDetModel, String>(
                    dataSource: lop,
                    enableTooltip: true,
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
