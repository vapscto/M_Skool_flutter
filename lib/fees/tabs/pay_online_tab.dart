import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_skool_flutter/fees/widgets/custom_detail_widget.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';
import 'package:m_skool_flutter/widget/success_widget.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PayOnlineTab extends StatefulWidget {
  const PayOnlineTab({super.key});

  @override
  State<PayOnlineTab> createState() => _PayOnlineTabState();
}

class _PayOnlineTabState extends State<PayOnlineTab> {
  String paymentType = "razorpay";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Container(
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
                Container(
                  width: double.infinity,
                  // margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(202, 244, 244, 0.3),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomDetailWidget(title: 'Net Amount', amount: 60000),
                      CustomDetailWidget(title: 'Paid Amount', amount: 0),
                      CustomDetailWidget(title: 'Concession', amount: 0),
                      CustomDetailWidget(title: 'Balance', amount: 0),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
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
            child: Text('VAPS International School'),
          ),
          const SizedBox(
            height: 16.0,
          ),
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
                    style: Theme.of(context).textTheme.labelSmall!.merge(
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
                    style: Theme.of(context).textTheme.labelSmall!.merge(
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
                      razorpay.on(
                          Razorpay.EVENT_PAYMENT_SUCCESS, onPaymentSuccess);
                      razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, onPaymentFail);
                      razorpay.on(
                          Razorpay.EVENT_EXTERNAL_WALLET, onExternalWallet);
                      razorpay.open(paymentDetails);
                    }
                  },
                ),
              )
            ],
          ),
        ],
      ),
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
