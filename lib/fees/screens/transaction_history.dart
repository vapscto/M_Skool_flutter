import 'package:flutter/material.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/fees/apis/get_transaction_history.dart';
import 'package:m_skool_flutter/fees/apis/trans_status_api.dart';
import 'package:m_skool_flutter/fees/model/trans_status_model.dart';
import 'package:m_skool_flutter/fees/model/transaction_his_model.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class TransactionHistory extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;

  const TransactionHistory(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(title: "Transaction History").getAppBar(),
        body: FutureBuilder<List<TransDetailHisModelValues>>(
          future: GetTransactionHistory.instance.getHistory(
              miId: loginSuccessModel.mIID!,
              asmayId: loginSuccessModel.asmaYId!,
              amstId: loginSuccessModel.amsTId!,
              fmotGateWayType: "Razorpay",
              base: baseUrlFromInsCode("portal", mskoolController)),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemBuilder: (_, index) {
                    return TransHisItem(
                      value: snapshot.data!.elementAt(index),
                      loginSuccessMode: loginSuccessModel,
                      mskoolController: mskoolController,
                    );
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      height: 16.0,
                    );
                  },
                  itemCount: snapshot.data!.length);
            }
            if (snapshot.hasError) {
              return ErrWidget(err: snapshot.error as Map<String, dynamic>);
            }
            return const AnimatedProgressWidget(
              title: "Loading Transaction's",
              desc:
                  "We are loading your previous transaction's.... Please wait",
              animationPath: "assets/json/fee.json",
            );
          },
        ));
  }
}

class TransHisItem extends StatefulWidget {
  final TransDetailHisModelValues value;
  final LoginSuccessModel loginSuccessMode;
  final MskoolController mskoolController;
  const TransHisItem({
    Key? key,
    required this.value,
    required this.loginSuccessMode,
    required this.mskoolController,
  }) : super(key: key);

  @override
  State<TransHisItem> createState() => _TransHisItemState();
}

class _TransHisItemState extends State<TransHisItem> {
  bool showStatus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: CustomThemeData.getShadow(),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: null,
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFFBCFCF)),
                child: Text(
                  widget.value.fmoTPayGatewayType!,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .merge(const TextStyle(color: Color(0xFFA83232))),
                ),
              ),
              TextButton(
                  onPressed: () {
                    showStatus = !showStatus;
                    setState(() {});
                  },
                  child: Text(
                    showStatus ? "Hide Status" : "Show Status",
                    style: Theme.of(context).textTheme.button!.merge(
                          TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 0.2,
                            fontSize: 14.0,
                          ),
                        ),
                  ))
            ],
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Transaction Id : ${widget.value.transId}",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .merge(const TextStyle(fontSize: 18.0)),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Text(
                      getFormatedDate(DateTime.parse(widget.value.fyPDate!)),
                      style: Theme.of(context).textTheme.labelSmall!.merge(
                          TextStyle(
                              letterSpacing: 0.2,
                              fontSize: 14.0,
                              color: Colors.grey.shade500)),
                    )
                  ],
                ),
              ),
              Column(
                children: [
                  Text(
                    "₹ ${widget.value.amount}",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .merge(const TextStyle(fontSize: 18.0)),
                  ),
                  const SizedBox(
                    height: 8.0,
                  ),
                  showStatus
                      ? FutureBuilder<List<TransLogResultValues>>(
                          future: TransApiStatus.instance.getStatus(
                              miId: widget.loginSuccessMode.mIID!,
                              asmayId: widget.loginSuccessMode.asmaYId!,
                              amstId: widget.loginSuccessMode.amsTId!,
                              transId: widget.value.transId!,
                              base: baseUrlFromInsCode(
                                  "portal", widget.mskoolController),
                              gateway: widget.value.fmoTPayGatewayType!),
                          builder: (_, snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data!.isEmpty) {
                                return Row(
                                  children: const [
                                    Icon(
                                      Icons.warning,
                                      color: Colors.amber,
                                    ),
                                    SizedBox(
                                      width: 8.0,
                                    ),
                                    Text("N/A")
                                  ],
                                );
                              }
                              return Text(
                                  snapshot.data!.first.responsestatuslogs!);
                            }
                            if (snapshot.hasError) {
                              return Row(
                                children: const [
                                  Icon(
                                    Icons.warning,
                                    color: Colors.amber,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text("N/A")
                                ],
                              );
                            }

                            return const SizedBox(
                              height: 12.0,
                              width: 12.0,
                              child: CircularProgressIndicator(
                                strokeWidth: 3.0,
                              ),
                            );
                          })
                      : const SizedBox()
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 6.0,
          ),
        ],
      ),
    );
  }
}
