import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/certificates/api/get_certificate_type.dart';
import 'package:m_skool_flutter/certificates/model/certificate_drop_down.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

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

  CertificateDropDownValues? selectedValue;
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
              CustomContainer(
                child: FutureBuilder<CertificateDropDown>(
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
                        selectedValue = snapshot.data!.values!.first;
                        return DropdownButtonFormField<
                            CertificateDropDownValues>(
                          value: snapshot.data!.values!.first,
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
                            snapshot.data!.values!.length,
                            (index) {
                              CertificateDropDownValues
                                  certificateDropDownValues =
                                  snapshot.data!.values!.elementAt(index);
                              return DropdownMenuItem<
                                  CertificateDropDownValues>(
                                value: certificateDropDownValues,
                                child: Text(
                                  certificateDropDownValues
                                      .amcTCertificateName!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .merge(const TextStyle(fontSize: 16.0)),
                                ),
                              );
                            },
                          ),
                          onChanged: (value) {
                            selectedValue = value!;
                            debugPrint(selectedValue.toString());
                          },
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
              ),
            ],
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
                      style: Theme.of(context).textTheme.labelMedium!.merge(
                            const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                    ),
                  ],
                ),
                hintText: 'Type your reason here.'.tr,
                floatingLabelBehavior: FloatingLabelBehavior.always,
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
                      style: Theme.of(context).textTheme.labelMedium!.merge(
                            const TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                    ),
                  ],
                ),
                hintText: 'Select Date'.tr,
                floatingLabelBehavior: FloatingLabelBehavior.always,
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
                          msg: "You didn't selected the date".tr);
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
          MSkollBtn(title: "Apply Now", onPress: () {}),
        ],
      ),
    );
  }
}
