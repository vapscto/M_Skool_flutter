import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/interaction/controller/staff_interaction_related_controller.dart';
import 'package:m_skool_flutter/staffs/interaction/model/initialDropdownDetailModel.dart';
import 'package:m_skool_flutter/staffs/interaction/model/interactionSectionModel.dart';
import 'package:m_skool_flutter/staffs/interaction/model/interactionStudentListModel.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class ComposeTabStaff extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ComposeTabStaff({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<ComposeTabStaff> createState() => _ComposeTabStaffState();
}

class _ComposeTabStaffState extends State<ComposeTabStaff> {
  final StaffInteractionController staffInteractionController =
      Get.put(StaffInteractionController());
  final TextEditingController about = TextEditingController();
  final TextEditingController subject = TextEditingController();

  GetdetailsValues? selectedInitialDropdown;
  InteractionSectionListValue? selectedsection;
  GetStudentValue? selectedstudent;

  void getInitialData(String selectedStaff) async {
    staffInteractionController.isgetdetailloading(true);
    await staffInteractionController
        .getFirstDropdownData(
      asmayId: widget.loginSuccessModel.asmaYId!,
      roleId: widget.loginSuccessModel.roleId!,
      miId: widget.loginSuccessModel.mIID!,
      roleFlag: widget.loginSuccessModel.roleforlogin!,
      selectedRadioButton: selectedStaff,
      userId: widget.loginSuccessModel.userId.toString(),
      base: baseUrlFromInsCode(
        'portal',
        widget.mskoolController,
      ),
    )
        .then((value) {
      if (!value) {
        staffInteractionController.isgetdetailloading(false);
      }
    });
    staffInteractionController.isgetdetailloading(false);
  }

  void getSectionData(int asmclId) async {
    staffInteractionController.issectionloading(true);
    await staffInteractionController
        .getSectionListData(
      asmayId: widget.loginSuccessModel.asmaYId!,
      roleId: widget.loginSuccessModel.roleId!,
      miId: widget.loginSuccessModel.mIID!,
      roleFlag: widget.loginSuccessModel.roleforlogin!,
      userId: widget.loginSuccessModel.userId!,
      asmclId: asmclId,
      base: baseUrlFromInsCode(
        'portal',
        widget.mskoolController,
      ),
    )
        .then((value) {
      if (!value) {
        staffInteractionController.issectionloading(false);
      }
    });
    staffInteractionController.issectionloading(false);
  }

  void getStudentData(int asmsId) async {
    staffInteractionController.isstudentloading(true);
    await staffInteractionController
        .getStudentListData(
      asmayId: widget.loginSuccessModel.asmaYId!,
      roleId: widget.loginSuccessModel.roleId!,
      miId: widget.loginSuccessModel.mIID!,
      roleFlag: widget.loginSuccessModel.roleforlogin!,
      userId: widget.loginSuccessModel.userId.toString(),
      asmclId: selectedInitialDropdown!.asmclId!,
      asmsId: asmsId,
      base: baseUrlFromInsCode(
        'portal',
        widget.mskoolController,
      ),
    )
        .then((value) {
      if (!value) {
        staffInteractionController.isstudentloading(false);
      }
    });
    staffInteractionController.isstudentloading(false);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
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
                            " Subject ",
                            style:
                                Theme.of(context).textTheme.labelMedium!.merge(
                                      const TextStyle(
                                          fontSize: 20.0,
                                          color: Color(0xFFFF6F67)),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter here.',
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
                            " About ",
                            style:
                                Theme.of(context).textTheme.labelMedium!.merge(
                                      const TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFF47BA9E),
                                      ),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Enter here.',
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
                  "Student",
                  style: Theme.of(context).textTheme.labelSmall!.merge(
                      const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          letterSpacing: 0.3)),
                ),
                value: "Student",
                groupValue: staffInteractionController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionController.selectedValue(value!);
                  getInitialData(value);
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
                  "Teachers",
                  style: Theme.of(context).textTheme.labelSmall!.merge(
                      const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          letterSpacing: 0.3)),
                ),
                value: "Teachers",
                groupValue: staffInteractionController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionController.selectedValue(value!);
                  getInitialData(value);
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
                groupValue: staffInteractionController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionController.selectedValue(value!);
                  getInitialData(value);
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
                groupValue: staffInteractionController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionController.selectedValue(value!);
                  getInitialData(value);
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
                groupValue: staffInteractionController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionController.selectedValue(value!);
                  getInitialData(value);
                },
              ),
            ),
            SizedBox(
              height: 30,
              child: RadioListTile(
                dense: true,
                activeColor: Theme.of(context).primaryColor,
                contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                visualDensity: const VisualDensity(horizontal: -4.0),
                title: Text(
                  "Exam Co-ordinator",
                  style: Theme.of(context).textTheme.labelSmall!.merge(
                      const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16.0,
                          letterSpacing: 0.3)),
                ),
                value: "EC",
                groupValue: staffInteractionController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionController.selectedValue(value!);
                  getInitialData(value);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            staffInteractionController.selectedradio.value.isNotEmpty
                ? staffInteractionController.isGetDetail.value
                    ? const Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: AnimatedProgressWidget(
                            title: "",
                            desc: "",
                            animationPath: "assets/json/interaction.json",
                          ),
                        ),
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
                        child: DropdownButtonFormField<GetdetailsValues>(
                          value: selectedInitialDropdown,
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
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .merge(const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      letterSpacing: 0.3)),
                              hintText: staffInteractionController
                                          .selectedradio.value ==
                                      'Student'
                                  ? 'Select class'
                                  : 'Select Staff',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: Text(
                                staffInteractionController
                                            .selectedradio.value ==
                                        'Student'
                                    ? 'Class'
                                    : 'Staff',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.0,
                                        color: Color.fromRGBO(137, 137, 137, 1),
                                      ),
                                    ),
                              )
                              // label: Container(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(229, 243, 255, 1),
                              //     borderRadius: BorderRadius.all(
                              //       Radius.circular(24),
                              //     ),
                              //   ),
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       SizedBox(
                              //         height: 33,
                              //         child: Image.asset(
                              //           'assets/images/selectteachericon.png',
                              //         ),
                              //       ),
                              //       const SizedBox(width: 10),
                              //       Text(
                              //         'Class',
                              //         style: Theme.of(context).textTheme.titleSmall!.merge(
                              //               const TextStyle(
                              //                 fontWeight: FontWeight.w600,
                              //                 fontSize: 20.0,
                              //                 color: Color.fromRGBO(60, 120, 170, 1),
                              //               ),
                              //             ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
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
                              staffInteractionController.getDetailList.length,
                              (index) {
                            return DropdownMenuItem(
                              value: staffInteractionController.getDetailList
                                  .elementAt(index),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6, left: 5),
                                child: Text(
                                  staffInteractionController
                                              .selectedradio.value ==
                                          'Student'
                                      ? staffInteractionController.getDetailList
                                          .elementAt(index)
                                          .asmclClassName!
                                      : staffInteractionController
                                                  .selectedradio.value ==
                                              'EC'
                                          ? staffInteractionController
                                              .getDetailList
                                              .elementAt(index)
                                              .examCoordinatorName!
                                          : staffInteractionController
                                              .getDetailList
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
                            selectedInitialDropdown = s!;
                            if (staffInteractionController
                                    .selectedradio.value ==
                                'Student') {
                              getSectionData(s.asmclId!);
                              setState(() {});
                            }
                          },
                        ),
                      )
                : const SizedBox(),
            staffInteractionController.selectedradio.value == 'Student' &&
                    selectedInitialDropdown != null
                ? staffInteractionController.isSection.value
                    ? const Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: AnimatedProgressWidget(
                            title: "",
                            desc: "",
                            animationPath: "assets/json/interaction.json",
                          ),
                        ),
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
                        child: DropdownButtonFormField<
                            InteractionSectionListValue>(
                          value: selectedsection,
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
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .merge(const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      letterSpacing: 0.3)),
                              hintText: 'select section',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: Text(
                                'Section',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.0,
                                        color: Color.fromRGBO(137, 137, 137, 1),
                                      ),
                                    ),
                              )
                              // label: Container(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(229, 243, 255, 1),
                              //     borderRadius: BorderRadius.all(
                              //       Radius.circular(24),
                              //     ),
                              //   ),
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       SizedBox(
                              //         height: 33,
                              //         child: Image.asset(
                              //           'assets/images/selectteachericon.png',
                              //         ),
                              //       ),
                              //       const SizedBox(width: 10),
                              //       Text(
                              //         'Section',
                              //         style: Theme.of(context).textTheme.titleSmall!.merge(
                              //               const TextStyle(
                              //                 fontWeight: FontWeight.w600,
                              //                 fontSize: 20.0,
                              //                 color: Color.fromRGBO(60, 120, 170, 1),
                              //               ),
                              //             ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
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
                              staffInteractionController
                                  .interactionSectionList.length, (index) {
                            return DropdownMenuItem(
                              value: staffInteractionController
                                  .interactionSectionList
                                  .elementAt(index),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6, left: 5),
                                child: Text(
                                  staffInteractionController
                                      .interactionSectionList
                                      .elementAt(index)
                                      .asmCSectionName!,
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
                            selectedsection = s!;
                            getStudentData(s.asmSId!);
                            setState(() {});
                          },
                        ),
                      )
                : const SizedBox(),
            staffInteractionController.selectedradio.value == 'Student' &&
                    selectedInitialDropdown != null &&
                    selectedsection != null
                ? staffInteractionController.isStudent.value
                    ? const Center(
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: AnimatedProgressWidget(
                            title: "",
                            desc: "",
                            animationPath: "assets/json/interaction.json",
                          ),
                        ),
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
                        child: DropdownButtonFormField<GetStudentValue>(
                          value: selectedstudent,
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
                              hintStyle: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .merge(const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      letterSpacing: 0.3)),
                              hintText: 'select student',
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              label: Text(
                                'Select Students',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 20.0,
                                        color: Color.fromRGBO(137, 137, 137, 1),
                                      ),
                                    ),
                              )
                              // label: Container(
                              //   padding:
                              //       const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                              //   decoration: const BoxDecoration(
                              //     color: Color.fromRGBO(229, 243, 255, 1),
                              //     borderRadius: BorderRadius.all(
                              //       Radius.circular(24),
                              //     ),
                              //   ),
                              //   child: Row(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       SizedBox(
                              //         height: 33,
                              //         child: Image.asset(
                              //           'assets/images/selectteachericon.png',
                              //         ),
                              //       ),
                              //       const SizedBox(width: 10),
                              //       Text(
                              //         'Select Students',
                              //         style: Theme.of(context).textTheme.titleSmall!.merge(
                              //               const TextStyle(
                              //                 fontWeight: FontWeight.w600,
                              //                 fontSize: 20.0,
                              //                 color: Color.fromRGBO(60, 120, 170, 1),
                              //               ),
                              //             ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
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
                              staffInteractionController.studentList.length,
                              (index) {
                            return DropdownMenuItem(
                              value: staffInteractionController.studentList
                                  .elementAt(index),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6, left: 5),
                                child: Text(
                                  staffInteractionController.studentList
                                      .elementAt(index)
                                      .studentName!,
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
                            selectedstudent = s!;
                          },
                        ),
                      )
                : const SizedBox(),
            const SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {},
                child: staffInteractionController.isSubmit.value
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      )
                    : Text(
                        'Submit',
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
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
