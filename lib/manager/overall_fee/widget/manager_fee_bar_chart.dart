import 'package:flutter/material.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ManagerFeeBarChart extends StatefulWidget {
  const ManagerFeeBarChart({super.key});

  @override
  State<ManagerFeeBarChart> createState() => _ManagerFeeBarChartState();
}

class _ManagerFeeBarChartState extends State<ManagerFeeBarChart> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Chip(
              backgroundColor: Color.fromARGB(255, 255, 228, 224),
              label: Text(
                "2022-2023",
                style: TextStyle(color: Color(0xFFD05954)),
              ),
            ),
            SfCartesianChart(
              primaryYAxis: NumericAxis(),
            ),
          ],
        ),
      ),
    );
  }
}
