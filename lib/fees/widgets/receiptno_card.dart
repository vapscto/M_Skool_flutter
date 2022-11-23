import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m_skool_flutter/fees/controller/fee_related_controller.dart';
import 'package:m_skool_flutter/fees/model/fee_receipt_no_model.dart';
import 'package:m_skool_flutter/main.dart';

class ReceiptNoCard extends StatefulWidget {
  final ReceiptNoList receiptDetail;
  final int index;
  final int asmayId;
  final Function(int) function;
  const ReceiptNoCard({
    super.key,
    required this.receiptDetail,
    required this.index,
    required this.asmayId,
    required this.function,
  });

  @override
  State<ReceiptNoCard> createState() => _ReceiptNoCardState();
}

class _ReceiptNoCardState extends State<ReceiptNoCard> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        children: [
          Checkbox(
            activeColor: Theme.of(context).primaryColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
            value: isChecked,
            onChanged: (value) {
              setState(
                () {
                  if (value!) {
                    widget.function(widget.receiptDetail.fyPId!.toInt());
                  }

                  isChecked = value;
                },
              );
            },
          ),
          Text(widget.receiptDetail.receiptNo!),
        ],
      ),
    );
  }
}
