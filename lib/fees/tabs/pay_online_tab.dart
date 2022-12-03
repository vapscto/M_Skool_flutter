import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/fees/apis/get_academic_bal_fee_detail.dart';
import 'package:m_skool_flutter/fees/apis/get_installment_details.dart';
import 'package:m_skool_flutter/fees/controller/pay_online_data_controller.dart';
import 'package:m_skool_flutter/fees/controller/payment_selection_tracking.dart';
import 'package:m_skool_flutter/fees/model/disable_terms_model.dart';
import 'package:m_skool_flutter/fees/model/installment_model.dart';
import 'package:m_skool_flutter/fees/widgets/custom_detail_widget.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int totalInstallment = -1;
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
                  PrevTransactionDetails(),
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

                                    return CustomContainer(
                                      child: Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  model.grplistValues
                                                      .fmgGGroupName!,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium,
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
                                                  totalInstallment += 1;
                                                  return ListTile(
                                                    contentPadding:
                                                        EdgeInsets.zero,
                                                    minLeadingWidth: 10,
                                                    visualDensity: const VisualDensity(
                                                        horizontal:
                                                            VisualDensity
                                                                .minimumDensity,
                                                        vertical: VisualDensity
                                                            .minimumDensity),
                                                    leading: Obx(() {
                                                      return Checkbox(
                                                        value: trackSelection
                                                            .selectedCheckBox
                                                            .elementAt(
                                                                totalInstallment)
                                                            .isChecked
                                                            .value,
                                                        visualDensity: const VisualDensity(
                                                            horizontal:
                                                                VisualDensity
                                                                    .minimumDensity,
                                                            vertical: VisualDensity
                                                                .minimumDensity),
                                                        onChanged: trackSelection
                                                                .selectedCheckBox
                                                                .elementAt(
                                                                    totalInstallment)
                                                                .isDisabled
                                                                .value
                                                            ? null
                                                            : (v) {
                                                                // logger.d(
                                                                //     (installmentIndex +
                                                                //             1) *
                                                                //         (index +
                                                                //             1));
                                                                trackSelection
                                                                    .selectedCheckBox
                                                                    .elementAt(
                                                                        totalInstallment)
                                                                    .isChecked
                                                                    .value = v!;
                                                              },
                                                      );
                                                    }),
                                                    title: Text(
                                                      model
                                                          .disableTermsModelValues
                                                          .elementAt(
                                                              installmentIndex)
                                                          .fMTName!,
                                                    ),
                                                    trailing: Text(
                                                        "₹${model.disableTermsModelValues.elementAt(installmentIndex).payable!.toString()}"),
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
                              DottedBorder(
                                strokeWidth: 2,
                                color: const Color(0xFF2979BF),
                                dashPattern: const [10, 10],
                                radius: const Radius.circular(16.0),
                                borderType: BorderType.RRect,
                                child: CustomContainer(
                                  child: Container(
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 55,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFF2979BF),
                                              borderRadius:
                                                  BorderRadius.circular(16.0)),
                                        ),
                                      ],
                                    ),
                                    //decoration: BoxDecoration(border:),
                                  ),
                                ),
                              ),
                            ],
                          );
                  }),
                  Row(
                    children: [
                      Radio(
                        value: "razorpay",
                        groupValue: paymentType,
                        onChanged: ((value) {
                          paymentType = value!;
                          setState(() {});
                        }),
                      ),
                      Image.asset(
                        "assets/images/razorpay-icon.png",
                        width: 100,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: "easybuzz",
                        groupValue: paymentType,
                        onChanged: ((value) {
                          paymentType = value!;
                          setState(() {});
                        }),
                      ),
                      Image.asset(
                        "assets/images/easebuzz_logo.jpg",
                        width: 100,
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              padding: const EdgeInsets.all(16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              )),
                          child: Text(
                            "Payment Charges",
                            style:
                                Theme.of(context).textTheme.labelSmall!.merge(
                                      TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        letterSpacing: 0.3,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                      const SizedBox(
                        width: 16.0,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(24.0),
                              )),
                          child: Text(
                            "PayNow",
                            style:
                                Theme.of(context).textTheme.labelSmall!.merge(
                                      const TextStyle(
                                        color: Colors.white,
                                        letterSpacing: 0.3,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                          ),
                          onPressed: () {
                            Map<String, dynamic> paymentDetails = {
                              "key": "rzp_test_K8eRz072cKAm0I",
                              'amount': 100 * 100,
                              'name': 'Test Payment',
                              'description': 'Smart phone',
                              'retry': {'enabled': true, 'max_count': 1},
                              'send_sms_hash': true,
                              // 'orderId': "adf32ddsf4",
                              'prefill': {
                                'contact': '8888888888',
                                'email': 'test@razorpay.com'
                              },
                              'external': {
                                'wallets': ['paytm']
                              }
                            };
                            if (paymentType == "razorpay") {
                              Razorpay razorpay = Razorpay();
                              razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                  onPaymentSuccess);
                              razorpay.on(
                                  Razorpay.EVENT_PAYMENT_ERROR, onPaymentFail);
                              razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                                  onExternalWallet);
                              razorpay.open(paymentDetails);
                            }
                          },
                        ),
                      )
                    ],
                  ),
                ],
              );
      }),
    );
  }

  void onPaymentSuccess(PaymentSuccessResponse e) {
    logger.d(e.orderId);
    logger.d(e.paymentId);
    logger.d(e.signature);
    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            child: SuccessWidget(
              title: "Payment Successfull",
              message: "We have successfully received the credit from you.",
              onPressed: () {
                Navigator.pop(context);
              },
            ),
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

class PrevTransactionDetails extends StatelessWidget {
  const PrevTransactionDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomContainer(
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
      child: ExpansionTile(title: Text("Transactions")),
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
                Text(
                  'Academic Year : 2022-2023',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Image.asset(
                  'assets/images/info_icon.png',
                  color: Colors.black,
                )
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
                children: [
                  CustomDetailWidget(
                      title: 'Net Amount',
                      amount: payOnlineDataController
                          .academicYearFeeDet.first.fSSNetAmount!),
                  CustomDetailWidget(
                      title: 'Paid Amount',
                      amount: payOnlineDataController
                          .academicYearFeeDet.first.fSSPaidAmount!),
                  CustomDetailWidget(
                      title: 'Concession',
                      amount: payOnlineDataController
                          .academicYearFeeDet.first.fSSConcessionAmount!),
                  CustomDetailWidget(
                      title: 'Balance',
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
