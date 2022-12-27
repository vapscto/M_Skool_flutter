import "package:flutter/material.dart";
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/student/interaction/apis/compose_tab_related_api.dart';
import 'package:m_skool_flutter/student/interaction/controller/compose_tab_controller.dart';
import 'package:m_skool_flutter/student/interaction/model/staff_detail_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class ComposeTabScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ComposeTabScreen(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<ComposeTabScreen> createState() => _ComposeTabScreenState();
}

class _ComposeTabScreenState extends State<ComposeTabScreen> {
  final ComposeController composeController = Get.put(ComposeController());
  GetdetailsValue? selectedStaff;
  final TextEditingController about = TextEditingController();
  final TextEditingController subject = TextEditingController();
  String selectedradio = 'ClassTeacher';

  Future<void> getStafflistData() async {
    composeController.isloading(true);
    await composeController
        .getStafflist(
      miId: widget.loginSuccessModel.mIID!,
      amstId: widget.loginSuccessModel.amsTId!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      userId: widget.loginSuccessModel.userId!,
      key: selectedradio,
      base: baseUrlFromInsCode(
        'portal',
        widget.mskoolController,
      ),
    )
        .then((value) {
      if (value) {
        if (composeController.staffList.isNotEmpty) {
          selectedStaff = composeController.staffList.first;
        } else {
          composeController.isloading(false);
        }
      }
    });
    composeController.isloading(false);
  }

  @override
  void initState() {
    getStafflistData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: CustomContainer(
              child: TextField(
                style: Theme.of(context).textTheme.titleSmall,
                controller: subject,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 6.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: const Color(0xFFFFEBEA)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/subjectfielicon.png",
                          height: 24.0,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          " Subject ".tr,
                          style: Theme.of(context).textTheme.labelMedium!.merge(
                                const TextStyle(
                                    fontSize: 20.0, color: Color(0xFFFF6F67)),
                              ),
                        ),
                      ],
                    ),
                  ),
                  hintText: 'Enter here.'.tr,
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
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: CustomContainer(
              child: TextField(
                style: Theme.of(context).textTheme.titleSmall,
                controller: about,
                maxLines: 3,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  label: Container(
                    margin: const EdgeInsets.only(bottom: 12),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 4.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: const Color(0xFFDBFDF5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 30.0,
                          child: Image.asset(
                            "assets/images/abouticon.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          " About ".tr,
                          style: Theme.of(context).textTheme.labelMedium!.merge(
                                const TextStyle(
                                    fontSize: 20.0, color: Color(0xFF47BA9E)),
                              ),
                        ),
                      ],
                    ),
                  ),
                  hintText: 'Enter here.'.tr,
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
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 33,
            child: RadioListTile(
              dense: true,
              activeColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              visualDensity: const VisualDensity(horizontal: -4.0),
              title: Text(
                "Teachers",
                style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 0.3)),
              ),
              value: "ClassTeacher",
              groupValue: selectedradio,
              onChanged: (value) {
                setState(() {
                  selectedradio = value.toString();
                  getStafflistData();
                });
              },
            ),
          ),
          SizedBox(
            height: 33,
            child: RadioListTile(
              dense: true,
              activeColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              visualDensity: const VisualDensity(horizontal: -4.0),
              title: Text(
                "HOD",
                style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 0.3)),
              ),
              value: "HOD",
              groupValue: selectedradio,
              onChanged: (value) {
                setState(() {
                  selectedradio = value.toString();
                  getStafflistData();
                });
              },
            ),
          ),
          SizedBox(
            height: 33,
            child: RadioListTile(
              dense: true,
              activeColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              visualDensity: const VisualDensity(horizontal: -4.0),
              title: Text(
                "Principal",
                style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 0.3)),
              ),
              value: "Principal",
              groupValue: selectedradio,
              onChanged: (value) {
                setState(() {
                  selectedradio = value.toString();
                  getStafflistData();
                });
              },
            ),
          ),
          SizedBox(
            height: 33,
            child: RadioListTile(
              dense: true,
              activeColor: Theme.of(context).primaryColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 8),
              visualDensity: const VisualDensity(horizontal: -4.0),
              title: Text(
                "Academic Supervisor",
                style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16.0,
                        letterSpacing: 0.3)),
              ),
              value: "AS",
              groupValue: selectedradio,
              onChanged: (value) {
                setState(() {
                  selectedradio = value.toString();
                  getStafflistData();
                });
              },
            ),
          ),
          // SizedBox(
          //   height: 30,
          //   child: RadioListTile(
          //     dense: true,
          //     activeColor: Colors.blue,
          //     contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          //     visualDensity: const VisualDensity(horizontal: -4.0),
          //     title: Text(
          //       "Exam Co-ordinator",
          //       style: Theme.of(context).textTheme.labelSmall!.merge(
          //           const TextStyle(
          //               fontWeight: FontWeight.w400,
          //               fontSize: 16.0,
          //               letterSpacing: 0.3)),
          //     ),
          //     value: "EC",
          //     groupValue: selectedradio,
          //     onChanged: (value) {
          //       setState(() {
          //         selectedradio = value.toString();
          //         getStafflistData();
          //       });
          //     },
          //   ),
          // ),
          const SizedBox(height: 20),
          Obx(
            () => composeController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
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
                    child: DropdownButtonFormField<GetdetailsValue>(
                      value: selectedStaff,
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
                              horizontal: 20, vertical: 4),
                          decoration: const BoxDecoration(
                            color: Color.fromRGBO(229, 243, 255, 1),
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
                                  'assets/images/selectteachericon.png',
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Select Teacher',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 20.0,
                                        color: Color.fromRGBO(60, 120, 170, 1),
                                      ),
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
                      items: List.generate(composeController.staffList.length,
                          (index) {
                        return DropdownMenuItem(
                          value: composeController.staffList.elementAt(index),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 13, left: 5),
                            child: Text(
                              composeController.staffList
                                  .elementAt(index)
                                  .empName!,
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
                        selectedStaff = s!;
                        logger.d(s.hrmEId.toString());
                      },
                    ),
                  ),
          ),
          const SizedBox(height: 40),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () async {
                if (subject.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'Enter subject!!');
                } else if (about.text.isEmpty) {
                  Fluttertoast.showToast(msg: 'Enter about!!');
                } else if (composeController.isButton.value) {
                  composeController.issend(true);
                  composeController.isbutton(false);
                  await saveDetail(
                    miId: widget.loginSuccessModel.mIID!,
                    asmayId: widget.loginSuccessModel.asmaYId!,
                    amstId: widget.loginSuccessModel.amsTId!,
                    userId: widget.loginSuccessModel.userId!,
                    userFlg: selectedradio,
                    subject: subject.text,
                    message: about.text,
                    hrmeId: selectedStaff!.hrmEId!,
                    base: baseUrlFromInsCode('portal', widget.mskoolController),
                  ).then((value) {
                    if (value) {
                      FocusScope.of(context).unfocus();
                      subject.text = '';
                      about.text = '';
                    }
                  });
                  composeController.issend(false);
                  composeController.isbutton(true);
                }
              },
              child: Obx(
                () => composeController.isSend.value
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(
                        'Send',
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                              const TextStyle(
                                color: Colors.white,
                                letterSpacing: 0.3,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                      ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
