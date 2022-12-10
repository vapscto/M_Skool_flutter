import 'package:flutter/material.dart';
import 'package:m_skool_flutter/fees/model/fee_receipt_details_model.dart';

class FeeReceiptDetailContainer extends StatefulWidget {
  final FillStudentViewDetails dataModel;
  const FeeReceiptDetailContainer({
    super.key,
    required this.dataModel,
  });

  @override
  State<FeeReceiptDetailContainer> createState() =>
      _FeeReceiptDetailContainerState();
}

class _FeeReceiptDetailContainerState extends State<FeeReceiptDetailContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 8,
            color: Colors.black12,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Fee Details',
            style: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: Colors.black),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/vpslogo.png',
                height: 36,
              ),
              const SizedBox(
                width: 12.0,
              ),
              Text(
                "VAPS International School",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .merge(const TextStyle(color: Color(0xFF35658F))),
              ),
            ],
          ),
          const SizedBox(height: 15),
          GridView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              childAspectRatio: 1 / 0.07,
            ),
            children: [
              Text(
                'Receipt No        : ${widget.dataModel.values!.first.fyPReceiptNo}',
                style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Date                     : ${widget.dataModel.values!.first.fyPDate!.day} - ${widget.dataModel.values!.first.fyPDate!.month} - ${widget.dataModel.values!.first.fyPDate!.year}',
                style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Adm No             : ${widget.dataModel.values!.first.admno}',
                style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Session               : ${widget.dataModel.values!.first.admno}',
                style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Name                 : ${widget.dataModel.values!.first.amsTFirstName} ${widget.dataModel.values!.first.amsTLastName}',
                style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Class/sec           : ${widget.dataModel.values!.first.classname}/${widget.dataModel.values!.first.sectionname}',
                style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Father Name    : ${widget.dataModel.values!.first.fathername}',
                style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Type                    : ${widget.dataModel.values!.first.fMCCConcessionName}',
                style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'TransactionId   : ${widget.dataModel.values!.first.fypTransactionId}',
                style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              Text(
                'Duration             : ${widget.dataModel.values!.first.admno}',
                style: const TextStyle(
                    fontSize: 9,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            child: DataTable(
              dataTextStyle: const TextStyle(
                  fontSize: 9,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
              dataRowHeight: 24,
              headingRowHeight: 20,
              horizontalMargin: 2,
              columnSpacing: 20,
              dividerThickness: 1,
              headingTextStyle: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.w600),
              border: TableBorder.all(width: 1, color: Colors.black),
              showBottomBorder: true,
              headingRowColor: MaterialStateProperty.all(Colors.blue.shade400),
              columns: const [
                DataColumn(
                  numeric: true,
                  label: Text(
                    ' S.No',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Particular',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Installment',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Concession',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
                DataColumn(
                  label: Text(
                    'Paid Amount',
                    style: TextStyle(fontSize: 10),
                  ),
                ),
              ],
              rows: List.generate(widget.dataModel.values!.length, (index) {
                var i = index + 1;
                return DataRow(
                  cells: [
                    DataCell(Text('$i')),
                    DataCell(Text(
                        widget.dataModel.values!.elementAt(index).fmHFeeName!)),
                    DataCell(Text(
                        widget.dataModel.values!.elementAt(index).ftIName!)),
                    DataCell(Center(
                        child: Text(widget.dataModel.values!
                            .elementAt(index)
                            .ftPConcessionAmt
                            .toString()))),
                    DataCell(Center(
                        child: Text(widget.dataModel.values!
                            .elementAt(index)
                            .ftPPaidAmt
                            .toString()))),
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
