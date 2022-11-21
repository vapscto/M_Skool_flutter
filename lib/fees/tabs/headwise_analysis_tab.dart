import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/fees/controller/fee_related_controller.dart';
import 'package:m_skool_flutter/fees/widgets/installment_detail_widget.dart';

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
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: const [
          InstallmentDetailWidget(
            leadText: 'Tution Fees',
            instalText: 'I Installment',
            netAmount: 15925,
            concessionAmount: 0,
            paidAmount: 5390,
            balanceAmount: 0,
          ),
          SizedBox(height: 16),
          InstallmentDetailWidget(
            leadText: 'Tution Fees',
            instalText: 'II Installment',
            netAmount: 15925,
            concessionAmount: 0,
            paidAmount: 5390,
            balanceAmount: 0,
          ),
          SizedBox(height: 16),
          InstallmentDetailWidget(
            leadText: 'Tution Fees',
            instalText: 'III Installment',
            netAmount: 15925,
            concessionAmount: 0,
            paidAmount: 5390,
            balanceAmount: 0,
          ),
          SizedBox(height: 16),
          InstallmentDetailWidget(
            leadText: 'Term Fees',
            instalText: 'I Installment',
            netAmount: 1500,
            concessionAmount: 0,
            paidAmount: 1500,
            balanceAmount: 0,
            backgroundColor: Color.fromRGBO(238, 232, 255, 0.4),
            instalTextBgColor: Color.fromRGBO(209, 193, 255, 1),
          ),
        ],
      ),
    );
  }
}
