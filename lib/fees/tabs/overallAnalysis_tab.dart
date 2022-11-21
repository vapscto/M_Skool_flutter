import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m_skool_flutter/fees/widgets/custom_analysis_container.dart';
import 'package:m_skool_flutter/fees/widgets/graphical_analysisof_fee_widget.dart';

class OverallAnalysisTab extends StatefulWidget {
  const OverallAnalysisTab({super.key});

  @override
  State<OverallAnalysisTab> createState() => _OverallAnalysisTabState();
}

class _OverallAnalysisTabState extends State<OverallAnalysisTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(16.0),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 4,
                  color: Colors.black12,
                ),
              ],
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 10, right: 8, top: 8, bottom: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "2022-2023",
                        style: Theme.of(context).textTheme.titleSmall!.merge(
                              const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14.0,
                                letterSpacing: 0.2,
                              ),
                            ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 7),
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(81, 169, 100, 1),
                          borderRadius: BorderRadius.all(
                            Radius.circular(12),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Balance : ₹ 0',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .merge(
                                  const TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 14.0,
                                      color: Color.fromRGBO(255, 255, 255, 1)),
                                ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: Color.fromRGBO(0, 0, 0, 0.15),
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 6, right: 10, top: 8, bottom: 8),
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        CustomAnalysisContainer(
                            title: ' Receivable', amount: 61665),
                        VerticalDivider(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          thickness: 1,
                        ),
                        CustomAnalysisContainer(
                            title: ' Collection', amount: 61665),
                        VerticalDivider(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          thickness: 1,
                        ),
                        CustomAnalysisContainer(
                            title: ' Concession', amount: 0),
                        VerticalDivider(
                          color: Color.fromRGBO(0, 0, 0, 0.15),
                          thickness: 1,
                        ),
                        CustomAnalysisContainer(
                            title: ' Adjustment', amount: 0),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          GraphicalAnalysisFeeWidget(),
        ],
      ),
    );
  }
}
