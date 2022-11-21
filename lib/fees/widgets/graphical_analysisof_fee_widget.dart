import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphicalAnalysisFeeWidget extends StatefulWidget {
  final double receivable;
  final double collection;
  final double balance;
  final double adjustment;
  final double concession;
  const GraphicalAnalysisFeeWidget({
    super.key,
    required this.receivable,
    required this.collection,
    required this.balance,
    required this.adjustment,
    required this.concession,
  });

  @override
  State<GraphicalAnalysisFeeWidget> createState() =>
      _GraphicalAnalysisFeeWidgetState();
}

class _GraphicalAnalysisFeeWidgetState
    extends State<GraphicalAnalysisFeeWidget> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 7,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(211, 239, 255, 0.3),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Graphical Analysis of Fees for Different\n Academic Year',
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Color.fromRGBO(30, 56, 252, 1),
                    ),
                  ),
            ),
            const SizedBox(height: 20),
            SfCartesianChart(
              primaryYAxis: NumericAxis(
                labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
                majorGridLines: const MajorGridLines(width: 0),
              ),
              primaryXAxis: CategoryAxis(
                labelStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
                majorGridLines: const MajorGridLines(width: 0),
              ),
              series: <CartesianSeries>[
                ColumnSeries<ChartData, String>(
                  animationDuration: 2500,
                  dataSource: [
                    ChartData(
                      'Rec',
                      widget.receivable,
                      const Color(0xff59cdff),
                    ),
                    ChartData(
                      'Col',
                      widget.collection,
                      const Color(0xff8e5aff),
                    ),
                    ChartData(
                      'Bal',
                      widget.balance,
                      const Color(0xff6ecfbd),
                    ),
                    ChartData(
                      'Adj',
                      widget.adjustment,
                      const Color(0xfff9623e),
                    ),
                    ChartData(
                      'Con',
                      widget.concession,
                      const Color(0xffff8728),
                    ),
                  ],
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  pointColorMapper: (ChartData data, _) => data.color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: const Color(0xff59cdff),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Receivable',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: const Color(0xff8e5aff),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Collection',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: const Color(0xff6ecfbd),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Balance',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: Color(0xfff9623e),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Adjustment',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.circle,
                      size: 12,
                      color: Color(0xffff8728),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Concession',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final double? y;
  final Color? color;
}
