import 'package:dotted_border/dotted_border.dart';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';

import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/fees/apis/get_academic_bal_fee_detail.dart';
import 'package:m_skool_flutter/fees/apis/get_installment_details.dart';
import 'package:m_skool_flutter/fees/apis/get_payment_detail.dart';
import 'package:m_skool_flutter/fees/apis/payment_charges_api.dart';
import 'package:m_skool_flutter/fees/apis/sucess_payment_call_api.dart';
import 'package:m_skool_flutter/fees/controller/pay_online_data_controller.dart';
import 'package:m_skool_flutter/fees/controller/payment_selection_tracking.dart';
import 'package:m_skool_flutter/fees/model/disable_terms_model.dart';

import 'package:m_skool_flutter/fees/model/installment_model.dart';
import 'package:m_skool_flutter/fees/model/payment_charges.dart';
import 'package:m_skool_flutter/fees/model/payment_gateway_detail.dart';
import 'package:m_skool_flutter/fees/screens/transaction_history.dart';
import 'package:m_skool_flutter/fees/widgets/custom_detail_widget.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:m_skool_flutter/widget/pgr_widget.dart';

import 'package:m_skool_flutter/widget/success_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PayOnlineTab extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const PayOnlineTab(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<PayOnlineTab> createState() => _PayOnlineTabState();
}

class _PayOnlineTabState extends State<PayOnlineTab> {
  String paymentType = "razorpay";
  final PayOnlineDataController payOnlineDataController =
      Get.put<PayOnlineDataController>(PayOnlineDataController());
  final PaymentSelectionTracking trackSelection =
      Get.put(PaymentSelectionTracking());

  int color = -1;

  @override
  void initState() {
    loadFeePaymentDetails();
    super.initState();
  }

  void loadFeePaymentDetails() async {
    payOnlineDataController.updateisPageLoading(true);
    payOnlineDataController.updateIsAcademicFeeDetailLoaded(false);
    await GetAcademicFeeDetailBalanceApi.instance
        .getDetailsForCurrentAcademicYear(
            miId: widget.loginSuccessModel.mIID!,
            asmayId: widget.loginSuccessModel.asmaYId!,
            amstId: widget.loginSuccessModel.amsTId!,
            configSet: "T",
            base: baseUrlFromInsCode("fee", widget.mskoolController),
            payOnlineDataController: payOnlineDataController);
    await GetInstallmentDetails.instance.getInstallmentDetails(
      miId: widget.loginSuccessModel.mIID!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      amstId: widget.loginSuccessModel.amsTId!,
      configSet: "T",
      base: baseUrlFromInsCode("fee", widget.mskoolController),
      payOnlineDataController: payOnlineDataController,
      tracking: trackSelection,
    );
  }

  @override
  void dispose() {
    Get.delete<PayOnlineDataController>();
    Get.delete<PaymentSelectionTracking>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    trackSelection.totalInstallment.value = -1;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Obx(() {
        return payOnlineDataController.isPageLoading.value == true
            ? const CustomPgrWidget(
                title: "Loading Payment Details",
                desc: "We are fetching your fee details, please wait")
            : Column(
                children: [
                  Obx(() {
                    return payOnlineDataController
                                .isAcademicFeeDetailLoaded.value ==
                            false
                        ? const CustomPgrWidget(
                            title: "Loading Paid Details & Balances",
                            desc:
                                "We are loading fee details for current academics")
                        : AcademicYearFeeDetail(
                            payOnlineDataController: payOnlineDataController,
                          );
                  }),
                  const SizedBox(height: 15),
                  PrevTransactionDetails(
                    loginSuccessModel: widget.loginSuccessModel,
                    mskoolController: widget.mskoolController,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Obx(() {
                    return payOnlineDataController
                                .isInstallmentDetailLoaded.value ==
                            false
                        ? const CustomPgrWidget(
                            title: "Loading Installment Details",
                            desc:
                                "We are loading installment details ... Please wait")
                        : Column(
                            children: [
                              ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemBuilder: (_, index) {
                                    final InstallmentModel model =
                                        payOnlineDataController.installment
                                            .elementAt(index);
                                    color += 1;
                                    if (index % 6 == 0) {
                                      color = 0;
                                    }
                                    if (color > 6) {
                                      color = 0;
                                    }

                                    return CustomContainer(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 6.0),
                                                  decoration: BoxDecoration(
                                                    color: noticeColor
                                                        .elementAt(color)
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  child: Text(
                                                    model.grplistValues
                                                        .fmgGGroupName!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleSmall!
                                                        .merge(TextStyle(
                                                            fontSize: 16.0,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color: noticeColor
                                                                .elementAt(
                                                              color,
                                                            ))),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 16.0,
                                            ),
                                            ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: model
                                                    .disableTermsModelValues
                                                    .length,
                                                physics:
                                                    const NeverScrollableScrollPhysics(),
                                                itemBuilder:
                                                    (_, installmentIndex) {
                                                  trackSelection
                                                      .totalInstallment
                                                      .value += 1;

                                                  return InstallmentInfoWidget(
                                                    model: model
                                                        .disableTermsModelValues
                                                        .elementAt(
                                                            installmentIndex),
                                                    selected: trackSelection
                                                        .selectedCheckBox
                                                        .elementAt(trackSelection
                                                            .totalInstallment
                                                            .value)
                                                        .isChecked
                                                        .value,
                                                    disabled: trackSelection
                                                        .selectedCheckBox
                                                        .elementAt(trackSelection
                                                            .totalInstallment
                                                            .value)
                                                        .isDisabled
                                                        .value,
                                                    onChecked: () {
                                                      if (trackSelection
                                                          .selectedInstallment
                                                          .isEmpty) {
                                                        trackSelection
                                                            .selectedInstallment
                                                            .add(
                                                          SelectedInstallment(
                                                            groupInfo: model
                                                                .grplistValues,
                                                            disableTermsModelValues: model
                                                                .disableTermsModelValues
                                                                .elementAt(
                                                                    installmentIndex),
                                                          ),
                                                        );
                                                        return;
                                                      }
                                                      final DisableTermsModelValues
                                                          terms = model
                                                              .disableTermsModelValues
                                                              .elementAt(
                                                                  installmentIndex);
                                                      for (int i = 0;
                                                          i <
                                                              trackSelection
                                                                  .selectedInstallment
                                                                  .length;
                                                          i++) {
                                                        if (terms.fMGGId ==
                                                                trackSelection
                                                                    .selectedInstallment
                                                                    .elementAt(
                                                                        i)
                                                                    .disableTermsModelValues
                                                                    .fMGGId &&
                                                            terms.fmtId ==
                                                                trackSelection
                                                                    .selectedInstallment
                                                                    .elementAt(
                                                                        i)
                                                                    .disableTermsModelValues
                                                                    .fmtId) {
                                                          trackSelection
                                                              .selectedInstallment
                                                              .removeAt(i);
                                                          return;
                                                        }
                                                      }

                                                      trackSelection
                                                          .selectedInstallment
                                                          .add(
                                                        SelectedInstallment(
                                                          groupInfo: model
                                                              .grplistValues,
                                                          disableTermsModelValues: model
                                                              .disableTermsModelValues
                                                              .elementAt(
                                                                  installmentIndex),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                }),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  separatorBuilder: (_, index) {
                                    return const SizedBox(
                                      height: 16.0,
                                    );
                                  },
                                  itemCount: payOnlineDataController
                                      .installment.length),
                              const SizedBox(
                                height: 16.0,
                              ),
                              Obx(() {
                                return trackSelection
                                        .selectedInstallment.isEmpty
                                    ? const SizedBox()
                                    : Column(
                                        children: [
                                          Stack(
                                            children: [
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(2.0),
                                                child: DottedBorder(
                                                  strokeWidth: 2,
                                                  color:
                                                      const Color(0xFF2979BF),
                                                  dashPattern: const [10, 10],
                                                  radius: const Radius.circular(
                                                      16.0),
                                                  borderType: BorderType.RRect,
                                                  child: CustomContainer(
                                                    child: Container(
                                                      margin:
                                                          const EdgeInsets.only(
                                                              top: 60),
                                                      child: Column(children: [
                                                        Obx(() {
                                                          return trackSelection
                                                                  .selectedInstallment
                                                                  .isEmpty
                                                              ? const SizedBox()
                                                              : Column(
                                                                  children: [
                                                                    ListView
                                                                        .separated(
                                                                      shrinkWrap:
                                                                          true,
                                                                      physics:
                                                                          const NeverScrollableScrollPhysics(),
                                                                      itemCount: trackSelection
                                                                          .selectedInstallment
                                                                          .length,
                                                                      itemBuilder:
                                                                          (_, index) {
                                                                        return ListTile(
                                                                          title:
                                                                              Text(
                                                                            trackSelection.selectedInstallment.elementAt(index).groupInfo.fmgGGroupName!,
                                                                            style: Theme.of(context).textTheme.titleSmall!.merge(
                                                                                  const TextStyle(
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                          ),
                                                                          subtitle: Text(trackSelection
                                                                              .selectedInstallment
                                                                              .elementAt(index)
                                                                              .disableTermsModelValues
                                                                              .fMTName!),
                                                                          trailing:
                                                                              Text(
                                                                            "₹${trackSelection.selectedInstallment.elementAt(index).disableTermsModelValues.payable.toString()}",
                                                                            style: Theme.of(context).textTheme.titleSmall!.merge(
                                                                                  const TextStyle(
                                                                                    fontWeight: FontWeight.w600,
                                                                                  ),
                                                                                ),
                                                                          ),
                                                                        );
                                                                      },
                                                                      separatorBuilder:
                                                                          (BuildContext context,
                                                                              int index) {
                                                                        return const Divider(
                                                                          thickness:
                                                                              1,
                                                                          height:
                                                                              1,
                                                                        );
                                                                      },
                                                                    ),
                                                                  ],
                                                                );
                                                        }),
                                                        // Container(
                                                        //   margin:
                                                        //       const EdgeInsets
                                                        //           .all(16.0),
                                                        //   child:
                                                        //       CustomContainer(
                                                        //           color: const Color(
                                                        //               0xFFF0F7FE),
                                                        //           child:
                                                        //               Padding(
                                                        //             padding: const EdgeInsets
                                                        //                     .symmetric(
                                                        //                 vertical:
                                                        //                     6.0),
                                                        //             child:
                                                        //                 ListTile(
                                                        //               title: const Text(
                                                        //                   "Total Payable Amount"),
                                                        //               trailing:
                                                        //                   Obx(() {
                                                        //                 return Text(
                                                        //                   "₹${trackSelection.totalAmount.value}",
                                                        //                   style: Theme.of(context)
                                                        //                       .textTheme
                                                        //                       .titleSmall!
                                                        //                       .merge(
                                                        //                         const TextStyle(
                                                        //                           fontWeight: FontWeight.w600,
                                                        //                         ),
                                                        //                       ),
                                                        //                 );
                                                        //               }),
                                                        //             ),
                                                        //           )),
                                                        // )
                                                      ]),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xFF2979BF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                                child: ListTile(
                                                  title: Text(
                                                    "Total Amount",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .merge(
                                                          const TextStyle(
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                  ),
                                                  // trailing: Obx(() {
                                                  //   return Text(
                                                  //     "₹${trackSelection.totalAmount.value}",
                                                  //     style: Theme.of(context)
                                                  //         .textTheme
                                                  //         .labelMedium!
                                                  //         .merge(
                                                  //           const TextStyle(
                                                  //             color:
                                                  //                 Colors.white,
                                                  //           ),
                                                  //         ),
                                                  //   );
                                                  // }),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 16.0,
                                          ),
                                          Row(
                                            children: [
                                              Theme(
                                                data: ThemeData(
                                                    unselectedWidgetColor:
                                                        Theme.of(context)
                                                            .primaryColor),
                                                child: Radio(
                                                  value: "razorpay",
                                                  activeColor: Theme.of(context)
                                                      .primaryColor,
                                                  groupValue: paymentType,
                                                  onChanged: ((value) {
                                                    paymentType = value!;
                                                    setState(() {});
                                                  }),
                                                ),
                                              ),
                                              Image.asset(
                                                "assets/images/razorpay-icon.png",
                                                width: 100,
                                              ),
                                            ],
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Radio(
                                          //       value: "easybuzz",
                                          //       groupValue: paymentType,
                                          //       onChanged: ((value) {
                                          //         paymentType = value!;
                                          //         setState(() {});
                                          //       }),
                                          //     ),
                                          //     Image.asset(
                                          //       "assets/images/easebuzz_logo.jpg",
                                          //       width: 100,
                                          //     ),
                                          //   ],
                                          // ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          backgroundColor: Theme
                                                                  .of(context)
                                                              .scaffoldBackgroundColor,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                          )),
                                                  child: Text(
                                                    "Payment Charges",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .merge(
                                                          TextStyle(
                                                            color: Theme.of(
                                                                    context)
                                                                .primaryColor,
                                                            letterSpacing: 0.3,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                  ),
                                                  onPressed: () {
                                                    showModalBottomSheet(
                                                        context: context,
                                                        shape:
                                                            const RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          16.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          16.0)),
                                                        ),
                                                        builder: (_) {
                                                          return SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          16.0,
                                                                      vertical:
                                                                          8.0),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Theme.of(
                                                                            context)
                                                                        .primaryColor,
                                                                    borderRadius:
                                                                        const BorderRadius
                                                                            .only(
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              16.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              16.0),
                                                                    ),
                                                                  ),
                                                                  child: Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        "Payment Charges",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .titleMedium!
                                                                            .merge(const TextStyle(color: Colors.white)),
                                                                      ),
                                                                      IconButton(
                                                                          onPressed:
                                                                              () {
                                                                            Navigator.pop(context);
                                                                          },
                                                                          icon:
                                                                              const Icon(
                                                                            Icons.close,
                                                                            color:
                                                                                Colors.white,
                                                                          ))
                                                                    ],
                                                                  ),
                                                                ),
                                                                FutureBuilder<
                                                                        List<
                                                                            PaymentChargesValues>>(
                                                                    future: PaymentChargesApi.instance.loadPaymentCharges(
                                                                        miId: widget
                                                                            .loginSuccessModel
                                                                            .mIID!,
                                                                        fmotPaymentType:
                                                                            "Razorpay",
                                                                        base: baseUrlFromInsCode(
                                                                            "portal",
                                                                            widget
                                                                                .mskoolController)),
                                                                    builder: (_,
                                                                        snapshot) {
                                                                      if (snapshot
                                                                          .hasData) {
                                                                        return SingleChildScrollView(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Padding(
                                                                                padding: const EdgeInsets.all(16.0),
                                                                                child: Text(
                                                                                  "Razorpay",
                                                                                  style: Theme.of(context).textTheme.titleMedium,
                                                                                ),
                                                                              ),
                                                                              ListView.separated(
                                                                                  shrinkWrap: true,
                                                                                  physics: const NeverScrollableScrollPhysics(),
                                                                                  itemBuilder: (_, index) {
                                                                                    return ListTile(
                                                                                      title: Text(snapshot.data!.elementAt(index).fPGRCardType!),
                                                                                      subtitle: Text("${snapshot.data!.elementAt(index).fPGRCardNetworkType} - ${snapshot.data!.elementAt(index).fPGRRate}%"),
                                                                                    );
                                                                                  },
                                                                                  separatorBuilder: (_, index) {
                                                                                    return const SizedBox(
                                                                                      height: 8.0,
                                                                                    );
                                                                                  },
                                                                                  itemCount: snapshot.data!.length),
                                                                            ],
                                                                          ),
                                                                        );
                                                                      }

                                                                      if (snapshot
                                                                          .hasError) {
                                                                        return ErrWidget(
                                                                            err:
                                                                                snapshot.error as Map<String, dynamic>);
                                                                      }

                                                                      return const CustomPgrWidget(
                                                                          title:
                                                                              "Loading Payment Charges",
                                                                          desc:
                                                                              "We are loading payment charges details... Please wait");
                                                                    }),
                                                              ],
                                                            ),
                                                          );
                                                        });
                                                  },
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 16.0,
                                              ),
                                              Expanded(
                                                child: ElevatedButton(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(16.0),
                                                          shape:
                                                              RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        24.0),
                                                          )),
                                                  child: Text(
                                                    "PayNow",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelSmall!
                                                        .merge(
                                                          const TextStyle(
                                                            color: Colors.white,
                                                            letterSpacing: 0.3,
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                          ),
                                                        ),
                                                  ),
                                                  onPressed: () async {
                                                    trackSelection
                                                        .totalInstallment
                                                        .value = 0;
                                                    showModalBottomSheet(
                                                      context: context,
                                                      builder: (_) {
                                                        return FutureBuilder<
                                                            PaymentGateWayDetails>(
                                                          future: GetPayablePaymentDetailApi.instance.openPaymentGateWay(
                                                              miId: widget
                                                                  .loginSuccessModel
                                                                  .mIID!,
                                                              amstId: widget
                                                                  .loginSuccessModel
                                                                  .amsTId!,
                                                              asmayId: widget
                                                                  .loginSuccessModel
                                                                  .asmaYId!,
                                                              asmclId:
                                                                  payOnlineDataController
                                                                      .fillStudent
                                                                      .first
                                                                      .asmcLID!,
                                                              base: baseUrlFromInsCode(
                                                                  "fee",
                                                                  widget
                                                                      .mskoolController),
                                                              paymentSelectionTracking:
                                                                  trackSelection),
                                                          builder:
                                                              (_, snapshot) {
                                                            if (snapshot
                                                                .hasData) {
                                                              return Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        16.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      "Net Payment Detail's",
                                                                      style: Theme.of(
                                                                              context)
                                                                          .textTheme
                                                                          .titleMedium!
                                                                          .merge(
                                                                              const TextStyle(
                                                                            fontSize:
                                                                                20.0,
                                                                          )),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          16.0,
                                                                    ),
                                                                    ListTile(
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      title: const Text(
                                                                          "Total Amount"),
                                                                      subtitle:
                                                                          const Text(
                                                                              "All selected installment included"),
                                                                      trailing:
                                                                          Text(
                                                                        "₹${snapshot.data!.fmAAmount}",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .titleSmall,
                                                                      ),
                                                                    ),
                                                                    ListTile(
                                                                        contentPadding:
                                                                            EdgeInsets
                                                                                .zero,
                                                                        title: const Text(
                                                                            "Total Fine"),
                                                                        subtitle:
                                                                            const Text(
                                                                                "All selected installment included"),
                                                                        trailing:
                                                                            Text(
                                                                          "₹${snapshot.data!.fsSFineAmount}",
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .titleSmall,
                                                                        )),
                                                                    ListTile(
                                                                      contentPadding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      title: const Text(
                                                                          "Total Rebate"),
                                                                      subtitle:
                                                                          const Text(
                                                                              "Rebate offered to you"),
                                                                      trailing:
                                                                          Text(
                                                                        "₹${snapshot.data!.fsSRebateAmount}",
                                                                        style: Theme.of(context)
                                                                            .textTheme
                                                                            .titleSmall,
                                                                      ),
                                                                    ),
                                                                    const SizedBox(
                                                                      height:
                                                                          16.0,
                                                                    ),
                                                                    Center(
                                                                      child:
                                                                          ElevatedButton(
                                                                        style: ElevatedButton.styleFrom(
                                                                            minimumSize:
                                                                                Size(Get.width * 0.5, 50),
                                                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24.0))),
                                                                        onPressed:
                                                                            () {
                                                                          Navigator.pop(
                                                                              context);
                                                                          Map<String, dynamic>
                                                                              paymentDetails =
                                                                              {
                                                                            "key":
                                                                                snapshot.data!.merchantkey!,
                                                                            'amount':
                                                                                snapshot.data!.fmAAmount! * 100,
                                                                            // 'name':
                                                                            //     'Test Payment',
                                                                            // 'description':
                                                                            //     'Smart phone',
                                                                            'retry':
                                                                                {
                                                                              'enabled': true,
                                                                              'max_count': 1
                                                                            },
                                                                            'send_sms_hash':
                                                                                true,
                                                                            'orderId':
                                                                                snapshot.data!.transId!,
                                                                            'prefill':
                                                                                {
                                                                              'contact': payOnlineDataController.fillStudent.first.amstMobile,
                                                                              'email': payOnlineDataController.fillStudent.first.amstEmailId,
                                                                            },
                                                                            // 'external': {
                                                                            //   'wallets': ['paytm']
                                                                            // }
                                                                          };

                                                                          logger
                                                                              .d(paymentDetails);
                                                                          if (paymentType ==
                                                                              "razorpay") {
                                                                            Razorpay
                                                                                razorpay =
                                                                                Razorpay();
                                                                            razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                                                                onPaymentSuccess);
                                                                            razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                                                                onPaymentFail);
                                                                            razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                                                                                onExternalWallet);
                                                                            razorpay.open(paymentDetails);
                                                                          }
                                                                        },
                                                                        child:
                                                                            Text(
                                                                          "Continue",
                                                                          style: Theme.of(context)
                                                                              .textTheme
                                                                              .labelMedium!
                                                                              .merge(const TextStyle(
                                                                                color: Colors.white,
                                                                              )),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            }

                                                            if (snapshot
                                                                .hasError) {
                                                              return ErrWidget(
                                                                  err: snapshot
                                                                          .error
                                                                      as Map<
                                                                          String,
                                                                          dynamic>);
                                                            }

                                                            return const ProgressWidget();
                                                          },
                                                        );
                                                      },
                                                    );
                                                  },
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      );
                              }),
                            ],
                          );
                  }),
                ],
              );
      }),
    );
  }

  void onPaymentSuccess(
    PaymentSuccessResponse e,
  ) async {
    logger.d(e.orderId);
    logger.d(e.paymentId);
    logger.d(e.signature);

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) {
          return Dialog(
            child: FutureBuilder<bool>(
                future: PaymentSuccessfullApi.instance.doAfterPaymentMade(
                  miId: widget.loginSuccessModel.mIID!,
                  paymentId: e.paymentId!,
                  base: baseUrlFromInsCode("fee", widget.mskoolController),
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!) {
                    return SuccessWidget(
                      title: "Payment Successfull",
                      message:
                          "We have successfully received the credit from you.",
                      onPressed: () async {
                        GetInstallmentDetails.instance.getInstallmentDetails(
                          miId: widget.loginSuccessModel.mIID!,
                          asmayId: widget.loginSuccessModel.asmaYId!,
                          amstId: widget.loginSuccessModel.amsTId!,
                          configSet: "T",
                          base: baseUrlFromInsCode(
                              "fee", widget.mskoolController),
                          payOnlineDataController: payOnlineDataController,
                          tracking: trackSelection,
                        );
                        trackSelection.selectedInstallment.clear();
                        trackSelection.totalInstallment.value = -1;
                        Navigator.pop(context);
                      },
                    );
                  }

                  if (snapshot.hasError) {
                    return ErrWidget(
                        err: snapshot.error as Map<String, dynamic>);
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      CustomPgrWidget(
                          title: "Processing Payment",
                          desc:
                              "Please wait sending payment detail to school, Don't press back button or navigate to different pages"),
                    ],
                  );
                }),
          );
        });
  }

  void onPaymentFail(PaymentFailureResponse e) {
    logger.d(e.code);
    logger.d(e.error);
    logger.d(e.message);
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: ErrWidget(err: {
              "errorTitle": "Payment Failed",
              "errorMsg": e.message,
            }),
          );
        });
  }

  void onExternalWallet(ExternalWalletResponse e) {
    logger.d(e.walletName);
  }
}

class InstallmentInfoWidget extends StatefulWidget {
  const InstallmentInfoWidget({
    Key? key,
    required this.model,
    required this.selected,
    required this.disabled,
    required this.onChecked,
  }) : super(key: key);

  final DisableTermsModelValues model;
  final bool selected;
  final bool disabled;
  final VoidCallback onChecked;

  @override
  State<InstallmentInfoWidget> createState() => _InstallmentInfoWidgetState();
}

class _InstallmentInfoWidgetState extends State<InstallmentInfoWidget> {
  bool isSelected = false;

  @override
  void initState() {
    isSelected = widget.selected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      minLeadingWidth: 10,
      visualDensity: const VisualDensity(
          horizontal: VisualDensity.minimumDensity,
          vertical: VisualDensity.minimumDensity),
      // leading: Checkbox(
      //   value: widget.disabled ? true : isSelected,
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3.0)),
      //   activeColor: Theme.of(context).primaryColor,
      //   visualDensity: const VisualDensity(
      //       horizontal: VisualDensity.minimumDensity,
      //       vertical: VisualDensity.minimumDensity),
      //   onChanged: widget.disabled
      //       ? null
      //       : (v) {
      //           isSelected = v!;
      //           setState(() {});
      //           widget.onChecked();
      //         },
      // ),
      leading: GestureDetector(
        onTap: () {
          if (widget.disabled) {
            return;
          }
          isSelected = !isSelected;
          setState(() {});
          widget.onChecked();
        },
        child: AnimatedContainer(
            height: 22,
            width: 22,
            duration: const Duration(milliseconds: 500),
            curve: Curves.fastLinearToSlowEaseIn,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6.0),
                border: widget.disabled
                    ? null
                    : isSelected
                        ? null
                        : Border.all(color: Colors.grey, width: 2.0)),
            child: widget.disabled
                ? Image.asset(
                    "assets/images/checkbox.png",
                    color: Colors.grey,
                  )
                : isSelected
                    ? Image.asset("assets/images/checkbox.png")
                    : null),
      ),
      title: Text(
        widget.model.fMTName!,
        style: Theme.of(context)
            .textTheme
            .titleSmall!
            .merge(const TextStyle(fontSize: 18.0)),
      ),
      trailing: Text(
        "₹${widget.model.payable!.toString()}",
        style: const TextStyle(fontSize: 18.0),
      ),
    );
  }
}

class PrevTransactionDetails extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const PrevTransactionDetails({
    Key? key,
    required this.loginSuccessModel,
    required this.mskoolController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      // width: double.infinity,
      // padding: const EdgeInsets.all(10),
      // decoration: BoxDecoration(
      //   color: Theme.of(context).scaffoldBackgroundColor,
      //   borderRadius: BorderRadius.circular(16.0),
      //   boxShadow: const [
      //     BoxShadow(
      //       offset: Offset(0, 1),
      //       blurRadius: 4,
      //       color: Colors.black12,
      //     ),
      //   ],
      // ),
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return TransactionHistory(
              loginSuccessModel: loginSuccessModel,
              mskoolController: mskoolController,
            );
          }));
        },
        leading: Image.asset(
          "assets/images/transaction.png",
          height: 36.0,
        ),
        minLeadingWidth: 10,
        title: const Text("Transactions"),
        trailing: const Icon(
          Icons.chevron_right_outlined,
        ),
      ),
    );
  }
}

class AcademicYearFeeDetail extends StatelessWidget {
  final PayOnlineDataController payOnlineDataController;

  const AcademicYearFeeDetail({
    Key? key,
    required this.payOnlineDataController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: 'Academic Year : ',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontWeight: FontWeight.w500, fontSize: 16.0),
                      children: [
                        TextSpan(
                            text: "2022-2023",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16.0))
                      ]),
                ),
                // Text(
                //   ,

                // ),
                // Image.asset(
                //   'assets/images/info_icon.png',
                //   color: Colors.black,
                // )
              ],
            ),
          ),
          const SizedBox(height: 15),
          CustomContainer(
            child: Container(
              width: double.infinity,
              // margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(202, 244, 244, 0.3),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomDetailWidget(
                      title: 'Total Charges',
                      amount: payOnlineDataController
                          .academicYearFeeDet.first.fSSNetAmount!),
                  CustomDetailWidget(
                      title: 'Total Paid',
                      amount: payOnlineDataController
                          .academicYearFeeDet.first.fSSPaidAmount!),
                  CustomDetailWidget(
                      title: 'Total Concession',
                      amount: payOnlineDataController
                          .academicYearFeeDet.first.fSSConcessionAmount!),
                  CustomDetailWidget(
                      title: 'Now Payable',
                      amount: payOnlineDataController
                          .academicYearFeeDet.first.fSSToBePaid!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
