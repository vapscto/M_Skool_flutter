import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/certificates/api/get_certificate_type.dart';
import 'package:m_skool_flutter/certificates/api/submit_cert_request_api.dart';
import 'package:m_skool_flutter/certificates/model/cert_list_model.dart';
import 'package:m_skool_flutter/certificates/model/certlist_asca_model.dart';

import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';
import 'package:m_skool_flutter/widget/pgr_widget.dart';
import 'package:m_skool_flutter/widget/success_widget.dart';

class ApplyNow extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ApplyNow(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<ApplyNow> createState() => _ApplyNowState();
}

class _ApplyNowState extends State<ApplyNow> {
  // List<String> certificates = [
  //   "SLC Certificate",
  //   "Marksheet",
  //   "Transfer Certificate",
  //   "Leave Grant Certificate",
  //   "Passing Certificate",
  // ];

  CertificateListValues? selectedValue;
  final TextEditingController reason = TextEditingController();
  final TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // GetCertificateType.instance.getCertificateType(
    //     amstId: widget.loginSuccessModel.amsTId!,
    //     asmayId: widget.loginSuccessModel.asmaYId!,
    //     baseUrl: baseUrlFromInsCode("portal", widget.mskoolController),
    //     ivrmrtId: widget.loginSuccessModel.roleId!,
    //     miId: widget.loginSuccessModel.mIID!);
    return SingleChildScrollView(
      padding: const EdgeInsets.all(
        16.0,
      ),
      child: Column(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 4.0,
              ),
              FutureBuilder<CertListAsca>(
                  future: GetCertificateType.instance.getCertificateType(
                    miId: widget.loginSuccessModel.mIID!,
                    asmayId: widget.loginSuccessModel.asmaYId!,
                    ivrmrtId: widget.loginSuccessModel.roleId!,
                    amstId: widget.loginSuccessModel.amsTId!,
                    baseUrl: baseUrlFromInsCode(
                      "portal",
                      widget.mskoolController,
                    ),
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      selectedValue =
                          snapshot.data!.certificateList.values!.first;
                      return Column(
                        children: [
                          CustomContainer(
                            child:
                                DropdownButtonFormField<CertificateListValues>(
                              value:
                                  snapshot.data!.certificateList.values!.first,
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
                                label: Text(
                                  " Certificate Type ".tr,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .merge(
                                        const TextStyle(
                                          fontSize: 20.0,
                                        ),
                                      ),
                                ),
                                border: const OutlineInputBorder(),
                              ),
                              icon: const Icon(
                                Icons.keyboard_arrow_down_outlined,
                                size: 30,
                              ),
                              items: List.generate(
                                snapshot.data!.certificateList.values!.length,
                                (index) {
                                  CertificateListValues
                                      certificateDropDownValues = snapshot
                                          .data!.certificateList.values!
                                          .elementAt(index);
                                  return DropdownMenuItem<
                                      CertificateListValues>(
                                    value: certificateDropDownValues,
                                    child: Text(
                                      certificateDropDownValues
                                          .acertapPCertificateName!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .merge(
                                              const TextStyle(fontSize: 16.0)),
                                    ),
                                  );
                                },
                              ),
                              onChanged: (value) {
                                selectedValue = value!;
                                debugPrint(selectedValue.toString());
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          CustomContainer(
                            child: TextField(
                              style: Theme.of(context).textTheme.titleSmall,
                              controller: reason,
                              maxLines: 8,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                label: Row(
                                  children: [
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Text(
                                      " Reason ".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .merge(
                                            const TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          ),
                                    ),
                                  ],
                                ),
                                hintText: 'Type your reason here.'.tr,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          CustomContainer(
                            child: TextField(
                              readOnly: true,
                              style: Theme.of(context).textTheme.titleSmall,
                              controller: date,
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                label: Row(
                                  children: [
                                    const SizedBox(
                                      width: 12.0,
                                    ),
                                    Text(
                                      " Date ".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .merge(
                                            const TextStyle(
                                              fontSize: 20.0,
                                            ),
                                          ),
                                    ),
                                  ],
                                ),
                                hintText: 'Select Date'.tr,
                                floatingLabelBehavior:
                                    FloatingLabelBehavior.always,
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                  ),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () async {
                                    DateTime? selectedDT = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1998, 10, 12),
                                      lastDate: DateTime.now(),
                                    );

                                    if (selectedDT == null) {
                                      Fluttertoast.showToast(
                                          msg: "You didn't selected the date"
                                              .tr);
                                      return;
                                    }

                                    date.text = getFormatedDate(selectedDT);
                                  },
                                  child: Icon(
                                    Icons.date_range_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 36.0,
                          ),
                          MSkollBtn(
                              title: "Apply Now",
                              onPress: () {
                                if (selectedValue == null) {
                                  Fluttertoast.showToast(
                                      msg: "Please select a certificate type");
                                  return;
                                }
                                if (reason.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Please provide reason for generating certificate");
                                  return;
                                }

                                if (date.text.isEmpty) {
                                  Fluttertoast.showToast(
                                      msg:
                                          "Please provide date for generating certificate");
                                  return;
                                }
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (_) {
                                      // logger.d(DateTime.now().toString());
                                      return Dialog(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: FutureBuilder(
                                          future: SubmitCertRequestApi.instance
                                              .submitRequest(
                                            miId:
                                                widget.loginSuccessModel.mIID!,
                                            asmayId: widget
                                                .loginSuccessModel.asmaYId!,
                                            amstId: widget
                                                .loginSuccessModel.amsTId!,
                                            acertapId:
                                                selectedValue!.acertapPId!,
                                            ascaReason: reason.text,
                                            applyDate: DateTime.now()
                                                .toLocal()
                                                .toString(),
                                            ascaId: 0,
                                            baseUrl: baseUrlFromInsCode(
                                                "portal",
                                                widget.mskoolController),
                                          ),
                                          builder: (_, snapshot) {
                                            if (snapshot.hasData) {
                                              return SuccessWidget(
                                                title:
                                                    "Request Sent Successfully",
                                                message:
                                                    "We Successfully sent a request to generate your certificate",
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                  reason.text = "";
                                                  date.text = "";
                                                },
                                              );
                                            }

                                            if (snapshot.hasError) {
                                              return ErrWidget(
                                                err: snapshot.data
                                                    as Map<String, dynamic>,
                                              );
                                            }
                                            return const ProgressWidget();
                                          },
                                        ),
                                      );
                                    });
                              }),
                        ],
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 6.0,
                          ),
                          const SizedBox(
                            height: 24.0,
                            width: 24.0,
                            child: CircularProgressIndicator(
                              strokeWidth: 2.0,
                            ),
                          ),
                          const SizedBox(
                            width: 16.0,
                          ),
                          Text(
                            "Getting Certificates",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
