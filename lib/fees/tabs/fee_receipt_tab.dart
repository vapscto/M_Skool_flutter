import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_titled_container/flutter_titled_container.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:data_tables/data_tables.dart';
import 'package:m_skool_flutter/fees/controller/fee_related_controller.dart';
import 'package:m_skool_flutter/fees/model/fee_receipt_year_list_model.dart';
import 'package:m_skool_flutter/main.dart';

import '../../controller/global_utilities.dart';
import '../../controller/mskoll_controller.dart';
import '../../model/login_success_model.dart';
import '../../widget/pgr_widget.dart';
import '../widgets/receiptno_card.dart';

class FeeReceiptTab extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const FeeReceiptTab({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<FeeReceiptTab> createState() => _FeeReceiptTabState();
}

class _FeeReceiptTabState extends State<FeeReceiptTab> {
  final ScrollController _controller = ScrollController();
  final feeController = Get.put(FeeController());

  YearlistValue? selectedValue;

  Future<void> getFeeYearList() async {
    feeController.isfeeloading(true);
    await feeController
        .getFeeReceiptYearData(
      miId: widget.loginSuccessModel.mIID!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      amstId: widget.loginSuccessModel.amsTId!,
      base: baseUrlFromInsCode('portal', widget.mskoolController),
    )
        .then((value) {
      if (value) {
        selectedValue = feeController.feeReceiptYearList.first;
        getFeeReceiptList(this.selectedValue!.asmaYId!);
      }
      debugPrint(value.toString());
    });
    feeController.isfeeloading(false);
  }

  Future<void> getFeeReceiptList(int asmayId) async {
    feeController.feeReceiptNoList.clear();
    feeController.feeReceiptDetailsList.clear();
    feeController.isreceipt(true);

    await feeController.getFeeReceiptNoListData(
      miId: widget.loginSuccessModel.mIID!,
      asmayId: asmayId,
      amstId: widget.loginSuccessModel.amsTId!,
      base: baseUrlFromInsCode('portal', widget.mskoolController),
    );
    feeController.isreceipt(false);
  }

  Future<void> getFeesReceiptDetail(int fypId) async {
    feeController.isfeeDetail(true);
    await feeController.getFeeReceiptDetail(
      miId: widget.loginSuccessModel.mIID!,
      asmayId: selectedValue!.asmaYId!,
      amstId: widget.loginSuccessModel.amsTId!,
      fypId: fypId,
      base: baseUrlFromInsCode(
        'portal',
        widget.mskoolController,
      ),
    );
    feeController.isfeeDetail(false);
  }

  void removeFeeDetailsContainer(int index) {
    feeController.feeReceiptDetailsList.removeAt(index);
  }

  @override
  void initState() {
    super.initState();
    getFeeYearList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => feeController.isFeeLoading.value
            ? const Center(child: ProgressWidget())
            : SingleChildScrollView(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
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
                      child: DropdownButtonFormField<YearlistValue>(
                        value: selectedValue,
                        decoration: InputDecoration(
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          isDense: true,
                          label: Text(
                            "Select Year",
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .merge(TextStyle(color: Colors.grey.shade600)),
                          ),
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                        ),
                        iconSize: 30,
                        items: List.generate(
                            feeController.feeReceiptYearList.length, (index) {
                          return DropdownMenuItem(
                            value: feeController.feeReceiptYearList
                                .elementAt(index),
                            child: Text(
                              feeController.feeReceiptYearList
                                  .elementAt(index)
                                  .asmaYYear!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .merge(const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16.0,
                                      letterSpacing: 0.3)),
                            ),
                          );
                        }),
                        onChanged: (s) {
                          selectedValue = s;
                          getFeeReceiptList(s!.asmaYId!);
                        },
                      ),
                    ),
                    const SizedBox(height: 35),
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 106,
                          padding: const EdgeInsets.only(
                              left: 15, top: 10, bottom: 10),
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
                          child: feeController.isReceipt.value
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : feeController.feeReceiptNoList.isEmpty
                                  ? const Center(
                                      child: Text(
                                          'No Receipt available for selected year!!'),
                                    )
                                  : RawScrollbar(
                                      thumbColor: const Color(0xFF1E38FC),
                                      trackColor: const Color.fromRGBO(
                                          223, 239, 253, 1),
                                      trackRadius: const Radius.circular(10),
                                      trackVisibility: true,
                                      radius: const Radius.circular(10),
                                      thickness: 6,
                                      thumbVisibility: true,
                                      controller: _controller,
                                      child: ListView.builder(
                                        controller: _controller,
                                        itemCount: feeController
                                            .feeReceiptNoList.length,
                                        itemBuilder: (context, index) {
                                          return ReceiptNoCard(
                                            receiptDetail: feeController
                                                .feeReceiptNoList
                                                .elementAt(index),
                                            index: index,
                                            asmayId: selectedValue!.asmaYId!,
                                            function: getFeesReceiptDetail,
                                            function1:
                                                removeFeeDetailsContainer,
                                          );
                                        },
                                      ),
                                    ),
                        ),
                        const Positioned(
                          top: -10,
                          left: 17,
                          child: Text(
                            'Receipt No.',
                            style: TextStyle(
                                color: Color.fromRGBO(137, 137, 137, 1)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Obx(
                      () => feeController.isFeeDetail.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : feeController.feeReceiptDetailsList.isEmpty
                              ? feeController.feeReceiptNoList.isEmpty
                                  ? const SizedBox()
                                  : const Center(
                                      child: Text(
                                          'No Receipt Details available for selected receipt No.!!'),
                                    )
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: feeController
                                      .feeReceiptDetailsList.length,
                                  itemBuilder: (context, receiptIndex) {
                                    return Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 10),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 10),
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        borderRadius:
                                            BorderRadius.circular(16.0),
                                        boxShadow: const [
                                          BoxShadow(
                                            offset: Offset(0, 1),
                                            blurRadius: 8,
                                            color: Colors.black12,
                                          ),
                                        ],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
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
                                                    .merge(const TextStyle(
                                                        color:
                                                            Color(0xFF35658F))),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 15),
                                          GridView(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              crossAxisSpacing: 20,
                                              childAspectRatio: 1 / 0.07,
                                            ),
                                            children: [
                                              Text(
                                                'Receipt No        : ${feeController.feeReceiptDetailsList.elementAt(receiptIndex).values!.first.fyPReceiptNo}',
                                                style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                'Date                     : ${feeController.feeReceiptDetailsList.elementAt(receiptIndex).values!.first.fyPDate!.day} - ${feeController.feeReceiptDetailsList.elementAt(receiptIndex).values!.first.fyPDate!.month} - ${feeController.feeReceiptDetailsList.elementAt(receiptIndex).values!.first.fyPDate!.year}',
                                                style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                'Adm No             : ${feeController.feeReceiptDetailsList.elementAt(receiptIndex).values!.first.admno}',
                                                style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                'Session               :',
                                                style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                'Name                 :',
                                                style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                'Class/sec           :',
                                                style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                'Father Name    :',
                                                style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                'Type                    :',
                                                style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                'TransactionId   : ${feeController.feeReceiptDetailsList.elementAt(receiptIndex).values!.first.fypTransactionId}',
                                                style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              Text(
                                                'Duration             :',
                                                style: const TextStyle(
                                                    fontSize: 9,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.w500),
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
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                              border: TableBorder.all(
                                                  width: 1,
                                                  color: Colors.black),
                                              showBottomBorder: true,
                                              headingRowColor:
                                                  MaterialStateProperty.all(
                                                      Colors.blue.shade400),
                                              columns: const [
                                                DataColumn(
                                                  numeric: true,
                                                  label: Text(
                                                    ' S.No',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Particular',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Installment',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Concession',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                                DataColumn(
                                                  label: Text(
                                                    'Paid Amount',
                                                    style:
                                                        TextStyle(fontSize: 10),
                                                  ),
                                                ),
                                              ],
                                              rows: List.generate(
                                                  feeController
                                                      .feeReceiptDetailsList
                                                      .elementAt(receiptIndex)
                                                      .values!
                                                      .length, (index) {
                                                var i = index + 1;
                                                return DataRow(
                                                  cells: [
                                                    DataCell(Text('$i')),
                                                    DataCell(Text(feeController
                                                        .feeReceiptDetailsList
                                                        .elementAt(receiptIndex)
                                                        .values!
                                                        .elementAt(index)
                                                        .fmHFeeName!)),
                                                    DataCell(Text(feeController
                                                        .feeReceiptDetailsList
                                                        .elementAt(receiptIndex)
                                                        .values!
                                                        .elementAt(index)
                                                        .ftIName!)),
                                                    DataCell(Center(
                                                        child: Text(feeController
                                                            .feeReceiptDetailsList
                                                            .elementAt(
                                                                receiptIndex)
                                                            .values!
                                                            .elementAt(index)
                                                            .ftPConcessionAmt
                                                            .toString()))),
                                                    DataCell(Center(
                                                        child: Text(feeController
                                                            .feeReceiptDetailsList
                                                            .elementAt(
                                                                receiptIndex)
                                                            .values!
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
                                  }),
                    ),
                    const SizedBox(height: 200),
                  ],
                ),
              ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40),
            child: Text(
              'Generate PDF',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
