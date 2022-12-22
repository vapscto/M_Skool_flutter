import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/fees/controller/fee_related_controller.dart';
import 'package:m_skool_flutter/fees/model/fee_receipt_no_model.dart';
import 'package:m_skool_flutter/fees/model/fee_receipt_year_list_model.dart';
import 'package:m_skool_flutter/fees/widgets/feereceipt_detail_container.dart';

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

  YearlistValues? selectedValue;
  ReceiptNoList? receiptNoSelectedValue;

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
        getFeeReceiptList(selectedValue!.asmaYId!);
      }
      debugPrint(value.toString());
    });
    feeController.isfeeloading(false);
  }

  Future<void> getFeeReceiptList(int asmayId) async {
    feeController.feeReceiptNoList.clear();
    feeController.feeReceiptDetailsList.clear();
    feeController.isreceipt(true);

    await feeController
        .getFeeReceiptNoListData(
      miId: widget.loginSuccessModel.mIID!,
      asmayId: asmayId,
      amstId: widget.loginSuccessModel.amsTId!,
      base: baseUrlFromInsCode('portal', widget.mskoolController),
    )
        .then((value) {
      if (value) {
        if (feeController.feeReceiptNoList.isNotEmpty) {
          receiptNoSelectedValue = feeController.feeReceiptNoList.first;
          getFeesReceiptDetail(this.receiptNoSelectedValue!.fyPId!);
        }
      }
    });
    feeController.isreceipt(false);
  }

  Future<void> getFeesReceiptDetail(int fypId) async {
    feeController.feeReceiptDetailsList.clear();
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

  // void removeFeeDetailsContainer(int index) {
  //   feeController.feeReceiptDetailsList.removeAt(index);
  // }

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
                      child: DropdownButtonFormField<YearlistValues>(
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
                          label: Container(
                            // height: 40,
                            // width: 250,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 6),
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(223, 251, 254, 1),
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 33,
                                  child: Image.asset(
                                    'assets/images/hat.png',
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Academic Year',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .merge(
                                        const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 20.0,
                                            color: Color.fromRGBO(
                                                40, 182, 200, 1)),
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        icon: const Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30,
                          ),
                        ),
                        iconSize: 30,
                        items: List.generate(
                            feeController.feeReceiptYearList.length, (index) {
                          return DropdownMenuItem(
                            value: feeController.feeReceiptYearList
                                .elementAt(index),
                            child: Padding(
                              padding: const EdgeInsets.only(top: 13, left: 5),
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
                            ),
                          );
                        }),
                        onChanged: (s) {
                          selectedValue = s;
                          getFeeReceiptList(s!.asmaYId!);
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    feeController.isReceipt.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : feeController.feeReceiptNoList.isEmpty
                            ? Center(
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 16),
                                      child:
                                          Image.asset('assets/images/pana.png'),
                                    ),
                                    const SizedBox(height: 15),
                                    const Text(
                                      'No Receipts available for selected year!!',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(
                                      height: 30,
                                    ),
                                  ],
                                ),
                              )
                            : Container(
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      blurRadius: 8,
                                      color: Colors.black12,
                                    ),
                                  ],
                                ),
                                child: DropdownButtonFormField<ReceiptNoList>(
                                  value: receiptNoSelectedValue,
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
                                    label: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: const BoxDecoration(
                                        color: Color.fromRGBO(255, 235, 234, 1),
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(24),
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(
                                            height: 25,
                                            child: Image.asset(
                                                'assets/images/receipt.png'),
                                          ),
                                          const SizedBox(width: 10),
                                          Text(
                                            'Receipt No.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .merge(
                                                  const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 20.0,
                                                      color: Color.fromRGBO(
                                                          255, 111, 103, 1)),
                                                ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  icon: const Padding(
                                    padding: EdgeInsets.only(top: 3.0),
                                    child: Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                      size: 30,
                                    ),
                                  ),
                                  iconSize: 30,
                                  items: List.generate(
                                      feeController.feeReceiptNoList.length,
                                      (index) {
                                    return DropdownMenuItem(
                                      value: feeController.feeReceiptNoList
                                          .elementAt(index),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 13, left: 5),
                                        child: Text(
                                          feeController.feeReceiptNoList
                                              .elementAt(index)
                                              .fyPReceiptNo!,
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .merge(const TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 16.0,
                                                  letterSpacing: 0.3)),
                                        ),
                                      ),
                                    );
                                  }),
                                  onChanged: (s) {
                                    receiptNoSelectedValue = s;
                                    getFeesReceiptDetail(s!.fyPId!);
                                  },
                                ),
                              ),

                    // ///////////
                    // Stack(
                    //   clipBehavior: Clip.none,
                    //   children: [
                    //     Container(
                    //       height: 106,
                    //       padding: const EdgeInsets.only(
                    //           left: 15, top: 10, bottom: 10),
                    //       decoration: BoxDecoration(
                    //         color: Theme.of(context).scaffoldBackgroundColor,
                    //         borderRadius: BorderRadius.circular(16.0),
                    //         boxShadow: const [
                    //           BoxShadow(
                    //             offset: Offset(0, 1),
                    //             blurRadius: 4,
                    //             color: Colors.black12,
                    //           ),
                    //         ],
                    //       ),
                    //       child: feeController.isReceipt.value
                    //           ? const Center(
                    //               child: CircularProgressIndicator(),
                    //             )
                    //           : feeController.feeReceiptNoList.isEmpty
                    //               ? const Center(
                    //                   child: Text(
                    //                       'No Receipt available for selected year!!'),
                    //                 )
                    //               : RawScrollbar(
                    //                   thumbColor: const Color(0xFF1E38FC),
                    //                   trackColor: const Color.fromRGBO(
                    //                       223, 239, 253, 1),
                    //                   trackRadius: const Radius.circular(10),
                    //                   trackVisibility: true,
                    //                   radius: const Radius.circular(10),
                    //                   thickness: 6,
                    //                   thumbVisibility: true,
                    //                   controller: _controller,
                    //                   child: ListView.builder(
                    //                     controller: _controller,
                    //                     itemCount: feeController
                    //                         .feeReceiptNoList.length,
                    //                     itemBuilder: (context, index) {
                    //                       return ReceiptNoCard(
                    //                         receiptDetail: feeController
                    //                             .feeReceiptNoList
                    //                             .elementAt(index),
                    //                         index: index,
                    //                         asmayId: selectedValue!.asmaYId!,
                    //                         function: getFeesReceiptDetail,
                    //                         function1:
                    //                             removeFeeDetailsContainer,
                    //                       );
                    //                     },
                    //                   ),
                    //                 ),
                    //     ),
                    //     Positioned(
                    //       top: -10,
                    //       left: 14,
                    //       child: Container(
                    //         padding: const EdgeInsets.symmetric(
                    //             horizontal: 16, vertical: 7),
                    //         decoration: const BoxDecoration(
                    //           color: Color.fromRGBO(255, 235, 234, 1),
                    //           borderRadius: BorderRadius.all(
                    //             Radius.circular(12),
                    //           ),
                    //         ),
                    //         child: Row(
                    //           mainAxisSize: MainAxisSize.min,
                    //           children: [
                    //             Image.asset('assets/images/receipt.png'),
                    //             const SizedBox(width: 5),
                    //             Text(
                    //               'Receipt No.',
                    //               style: Theme.of(context)
                    //                   .textTheme
                    //                   .titleSmall!
                    //                   .merge(
                    //                     const TextStyle(
                    //                         fontWeight: FontWeight.w400,
                    //                         fontSize: 14.0,
                    //                         color: Color.fromARGB(
                    //                             255, 111, 103, 1)),
                    //                   ),
                    //             ),
                    //           ],
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    const SizedBox(height: 16),
                    Obx(
                      () => feeController.isFeeDetail.value
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : feeController.feeReceiptDetailsList.isEmpty
                              ? feeController.feeReceiptNoList.isEmpty
                                  ? const SizedBox()
                                  : Center(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 10),
                                            child: Image.asset(
                                                'assets/images/pana.png'),
                                          ),
                                          const SizedBox(height: 15),
                                          const Text(
                                            'No Receipt Details available for selected receipt No.!!',
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                    )
                              : ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: feeController
                                      .feeReceiptDetailsList.length,
                                  itemBuilder: (context, receiptIndex) {
                                    return FeeReceiptDetailContainer(
                                        dataModel: feeController
                                            .feeReceiptDetailsList
                                            .elementAt(receiptIndex));
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
