import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/fees/controller/fee_related_controller.dart';
import 'package:m_skool_flutter/fees/widgets/installment_detail_widget.dart';

import '../../widget/pgr_widget.dart';

class HeadwiseAnalysisTab extends StatefulWidget {
  const HeadwiseAnalysisTab({super.key});

  @override
  State<HeadwiseAnalysisTab> createState() => _HeadwiseAnalysisTabState();
}

class _HeadwiseAnalysisTabState extends State<HeadwiseAnalysisTab> {
  final feeController = Get.put(FeeController());

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Obx(
        () => feeController.isLoading.value
            ? const Center(child: ProgressWidget())
            : Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: feeController.headWiseAnalysisData.length,
                    itemBuilder: (context, index) {
                      return InstallmentDetailWidget(
                        leadText: feeController
                            .headWiseAnalysisData[index].fmhFeeName!,
                        instalText:
                            feeController.headWiseAnalysisData[index].ftiName!,
                        netAmount: feeController
                            .headWiseAnalysisData[index].netAmount!,
                        concessionAmount: feeController
                            .headWiseAnalysisData[index].concessionAmount!,
                        paidAmount: feeController
                            .headWiseAnalysisData[index].paidAmount!,
                        balanceAmount: feeController
                            .headWiseAnalysisData[index].balanceAmount!
                            .toDouble(),
                      );
                    },
                  ),
                ],
              ),
      ),
    );
  }
}