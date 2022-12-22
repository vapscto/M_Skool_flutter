import "package:flutter/material.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:m_skool_flutter/interaction/controller/compose_tab_controller.dart';
import 'package:m_skool_flutter/interaction/model/staff_detail_model.dart';
import 'package:m_skool_flutter/main.dart';

import '../../controller/global_utilities.dart';
import '../../controller/mskoll_controller.dart';
import '../../model/login_success_model.dart';
import '../../widget/custom_container.dart';

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
        selectedStaff = composeController.staffList.first;
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 6.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Color(0xFFFFEBEA)),
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
          const SizedBox(height: 20),
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 6.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: Color(0xFFDBFDF5)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: 20.0,
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
          // const SizedBox(height: 30),
          RadioListTile(
            dense: true,
            activeColor: Colors.blue,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(horizontal: -4.0),
            title: const Text(
              "Teachers",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
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
          RadioListTile(
            dense: true,
            activeColor: Colors.blue,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(horizontal: -4.0),
            title: const Text(
              "HOD",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
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
          RadioListTile(
            dense: true,
            activeColor: Colors.blue,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(horizontal: -4.0),
            title: const Text(
              "Principal",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            value: "",
            groupValue: selectedradio,
            onChanged: (value) {
              setState(() {
                selectedradio = value.toString();
                getStafflistData();
              });
            },
          ),
          RadioListTile(
            dense: true,
            activeColor: Colors.blue,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(horizontal: -4.0),
            title: const Text(
              "Academic Supervisor",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
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
          RadioListTile(
            dense: true,
            activeColor: Colors.blue,
            contentPadding: const EdgeInsets.symmetric(horizontal: 8),
            visualDensity: const VisualDensity(horizontal: -4.0),
            title: const Text(
              "Exam Co-ordinator",
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
            ),
            value: "EC",
            groupValue: selectedradio,
            onChanged: (value) {
              setState(() {
                selectedradio = value.toString();
                getStafflistData();
              });
            },
          ),

          // const SizedBox(height: 30),
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
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {},
              child: Text(
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
        ],
      ),
    );
  }
}
