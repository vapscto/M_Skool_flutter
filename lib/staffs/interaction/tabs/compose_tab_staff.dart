import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/interaction/api/staff_interaction_compose_related_api.dart';
import 'package:m_skool_flutter/staffs/interaction/controller/staff_interaction_compose_related_controller.dart';
import 'package:m_skool_flutter/staffs/interaction/model/initialDropdownDetailModel.dart';
import 'package:m_skool_flutter/staffs/interaction/model/interactionSectionModel.dart';
import 'package:m_skool_flutter/staffs/interaction/model/interactionStudentListModel.dart';
import 'package:m_skool_flutter/staffs/interaction/widget/student_list_widget.dart';
import 'package:m_skool_flutter/staffs/interaction/widget/teacher_list_widget.dart';
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
  final StaffInteractionComposeController staffInteractionComposeController =
      Get.put(StaffInteractionComposeController());
  final TextEditingController about = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final List<Map<String, dynamic>> arrayStudents = [];
  final List<Map<String, dynamic>> arrayTeachers = [];
  final ScrollController _controller = ScrollController();
  GetdetailsValues? selectedInitialDropdown;
  InteractionSectionListValue? selectedsection;
  GetStudentValue? selectedstudent;

  void getInitialData(String selectedStaff) async {
    staffInteractionComposeController.isgetdetailloading(true);
    await staffInteractionComposeController
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
        staffInteractionComposeController.isgetdetailloading(false);
      }
    });
    staffInteractionComposeController.isgetdetailloading(false);
  }

  void getSectionData(int asmclId) async {
    staffInteractionComposeController.issectionloading(true);
    await staffInteractionComposeController
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
        staffInteractionComposeController.issectionloading(false);
        return;
      }
      if (staffInteractionComposeController.interactionSectionList.isEmpty) {
        Fluttertoast.showToast(msg: 'No section for selected class.');
      }
    });
    staffInteractionComposeController.issectionloading(false);
  }

  void getStudentData(int asmsId) async {
    staffInteractionComposeController.isstudentloading(true);
    await staffInteractionComposeController
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
        staffInteractionComposeController.isstudentloading(false);
      }
    });
    staffInteractionComposeController.isstudentloading(false);
  }

  void addStudentInList(int amstId) {
    arrayStudents.add({"AMST_Id": amstId});
    logger.d(arrayStudents);
  }

  void removeFromStudentInList(int amstId) {
    arrayStudents.removeWhere((v) => v['AMST_Id'] == amstId);
    logger.d(arrayStudents);
  }

  void addStaffInList(int hrmeId) {
    arrayTeachers.add({"HRME_Id": hrmeId});
    logger.d(arrayTeachers);
  }

  void removeStaffFromList(int hrmeId) {
    arrayTeachers.removeWhere((v) => v['HRME_Id'] == hrmeId);
    logger.d(arrayTeachers);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Obx(
        () => Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 33,
                  width: 130,
                  child: RadioListTile(
                    dense: true,
                    activeColor: Theme.of(context).primaryColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    visualDensity: const VisualDensity(horizontal: -4.0),
                    title: Text(
                      "Group",
                      style: Theme.of(context).textTheme.labelSmall!.merge(
                          const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              letterSpacing: 0.3)),
                    ),
                    value: "Group",
                    groupValue:
                        staffInteractionComposeController.grpOrInd.value,
                    onChanged: (value) {
                      staffInteractionComposeController
                          .groupOrIndividual(value!);
                    },
                  ),
                ),
                SizedBox(
                  height: 33,
                  width: 140,
                  child: RadioListTile(
                    dense: true,
                    activeColor: Theme.of(context).primaryColor,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                    visualDensity: const VisualDensity(horizontal: -4.0),
                    title: Text(
                      "Individual",
                      style: Theme.of(context).textTheme.labelSmall!.merge(
                          const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              letterSpacing: 0.3)),
                    ),
                    value: "Individual",
                    groupValue:
                        staffInteractionComposeController.grpOrInd.value,
                    onChanged: (value) {
                      staffInteractionComposeController
                          .groupOrIndividual(value!);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
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
                groupValue:
                    staffInteractionComposeController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionComposeController.selectedValue(value!);
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
                groupValue:
                    staffInteractionComposeController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionComposeController.selectedValue(value!);
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
                groupValue:
                    staffInteractionComposeController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionComposeController.selectedValue(value!);
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
                groupValue:
                    staffInteractionComposeController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionComposeController.selectedValue(value!);
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
                groupValue:
                    staffInteractionComposeController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionComposeController.selectedValue(value!);
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
                groupValue:
                    staffInteractionComposeController.selectedradio.value,
                onChanged: (value) {
                  selectedInitialDropdown = null;
                  selectedsection = null;
                  selectedstudent = null;
                  staffInteractionComposeController.selectedValue(value!);
                  getInitialData(value);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            staffInteractionComposeController.selectedradio.value.isNotEmpty
                ? staffInteractionComposeController.isGetDetail.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : staffInteractionComposeController.grpOrInd.value ==
                                'Group' &&
                            staffInteractionComposeController
                                    .selectedradio.value !=
                                'Student'
                        ? Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Container(
                                height: staffInteractionComposeController
                                            .getDetailList.length ==
                                        1
                                    ? 60
                                    : staffInteractionComposeController
                                                .getDetailList.length ==
                                            2
                                        ? 120
                                        : staffInteractionComposeController
                                                    .getDetailList.length ==
                                                3
                                            ? 140
                                            : 180,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 10),
                                padding:
                                    const EdgeInsets.only(top: 5, bottom: 10),
                                decoration: BoxDecoration(
                                  color:
                                      Theme.of(context).scaffoldBackgroundColor,
                                  borderRadius: BorderRadius.circular(16.0),
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      blurRadius: 4,
                                      color: Colors.black12,
                                    ),
                                  ],
                                ),
                                child: RawScrollbar(
                                  thumbColor: const Color(0xFF1E38FC),
                                  trackColor:
                                      const Color.fromRGBO(223, 239, 253, 1),
                                  trackRadius: const Radius.circular(10),
                                  trackVisibility: true,
                                  radius: const Radius.circular(10),
                                  thickness: 14,
                                  thumbVisibility: true,
                                  controller: _controller,
                                  child: ListView.builder(
                                    controller: _controller,
                                    itemCount: staffInteractionComposeController
                                        .getDetailList.length,
                                    itemBuilder: (context, index) {
                                      return TeacherListWidget(
                                        data: staffInteractionComposeController
                                            .getDetailList
                                            .elementAt(index),
                                        function: addStaffInList,
                                        function1: removeStaffFromList,
                                      );
                                    },
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -10,
                                left: 14,
                                child: Container(
                                  height: 30,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 7),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'Select staffs',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .merge(
                                              const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.0,
                                                color: Color.fromRGBO(
                                                    137, 137, 137, 1),
                                              ),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
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
                                  hintText: 'select',
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  label: Text(
                                    staffInteractionComposeController
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
                                            color: Color.fromRGBO(
                                                137, 137, 137, 1),
                                          ),
                                        ),
                                  )),
                              icon: const Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Icon(
                                  Icons.keyboard_arrow_down_rounded,
                                  size: 30,
                                ),
                              ),
                              iconSize: 30,
                              items: List.generate(
                                  staffInteractionComposeController
                                      .getDetailList.length, (index) {
                                return DropdownMenuItem(
                                  value: staffInteractionComposeController
                                      .getDetailList
                                      .elementAt(index),
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.only(top: 6, left: 5),
                                    child: Text(
                                      staffInteractionComposeController
                                                  .selectedradio.value ==
                                              'Student'
                                          ? staffInteractionComposeController
                                              .getDetailList
                                              .elementAt(index)
                                              .asmclClassName!
                                          : staffInteractionComposeController
                                                      .selectedradio.value ==
                                                  'EC'
                                              ? staffInteractionComposeController
                                                  .getDetailList
                                                  .elementAt(index)
                                                  .examCoordinatorName!
                                              : staffInteractionComposeController
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
                                if (staffInteractionComposeController
                                        .selectedradio.value ==
                                    'Student') {
                                  getSectionData(s.asmclId!);
                                  setState(() {});
                                }
                              },
                            ),
                          )
                : const SizedBox(),
            staffInteractionComposeController.selectedradio.value ==
                        'Student' &&
                    selectedInitialDropdown != null
                ? staffInteractionComposeController.isSection.value
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
                              hintText: 'select',
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
                              )),
                          icon: const Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 30,
                            ),
                          ),
                          iconSize: 30,
                          items: List.generate(
                              staffInteractionComposeController
                                  .interactionSectionList.length, (index) {
                            return DropdownMenuItem(
                              value: staffInteractionComposeController
                                  .interactionSectionList
                                  .elementAt(index),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 6, left: 5),
                                child: Text(
                                  staffInteractionComposeController
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
            staffInteractionComposeController.selectedradio.value ==
                        'Student' &&
                    selectedInitialDropdown != null &&
                    selectedsection != null &&
                    staffInteractionComposeController.grpOrInd.value ==
                        'Individual'
                ? staffInteractionComposeController.isStudent.value
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
                              hintText: 'select',
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
                              )),
                          icon: const Padding(
                            padding: EdgeInsets.only(top: 3),
                            child: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              size: 30,
                            ),
                          ),
                          iconSize: 30,
                          items: List.generate(
                            staffInteractionComposeController
                                .studentList.length,
                            (index) {
                              return DropdownMenuItem(
                                value: staffInteractionComposeController
                                    .studentList
                                    .elementAt(index),
                                child: Text(
                                  staffInteractionComposeController.studentList
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
                              );
                            },
                          ),
                          onChanged: (s) {
                            selectedstudent = s!;
                          },
                        ),
                      )
                : const SizedBox(),
            staffInteractionComposeController.selectedradio.value ==
                        'Student' &&
                    selectedInitialDropdown != null &&
                    selectedsection != null &&
                    staffInteractionComposeController.grpOrInd.value == 'Group'
                ? staffInteractionComposeController.isStudent.value
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 200,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            padding: const EdgeInsets.only(top: 5, bottom: 10),
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
                            child: RawScrollbar(
                              thumbColor: const Color(0xFF1E38FC),
                              trackColor:
                                  const Color.fromRGBO(223, 239, 253, 1),
                              trackRadius: const Radius.circular(10),
                              trackVisibility: true,
                              radius: const Radius.circular(10),
                              thickness: 14,
                              thumbVisibility: true,
                              controller: _controller,
                              child: ListView.builder(
                                controller: _controller,
                                itemCount: staffInteractionComposeController
                                    .studentList.length,
                                itemBuilder: (context, index) {
                                  return StudentListWidget(
                                    data: staffInteractionComposeController
                                        .studentList
                                        .elementAt(index),
                                    function: addStudentInList,
                                    function1: removeFromStudentInList,
                                  );
                                },
                              ),
                            ),
                          ),
                          Positioned(
                            top: -10,
                            left: 14,
                            child: Container(
                              height: 30,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 7),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Select Students',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .merge(
                                          const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16.0,
                                            color: Color.fromRGBO(
                                                137, 137, 137, 1),
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
                onPressed: () async {
                  if (staffInteractionComposeController
                      .grpOrInd.value.isEmpty) {
                    Fluttertoast.showToast(msg: 'Select Group or Individual');
                  } else if (subject.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter Subject');
                  } else if (about.text.isEmpty) {
                    Fluttertoast.showToast(msg: 'Enter About');
                  } else if (staffInteractionComposeController
                      .selectedradio.value.isEmpty) {
                    Fluttertoast.showToast(msg: 'Select Staff');
                  } else if (staffInteractionComposeController.grpOrInd.value ==
                          'Individual' ||
                      staffInteractionComposeController.grpOrInd.value ==
                          'Group') {
                    if (selectedInitialDropdown == null) {
                      if (staffInteractionComposeController
                              .selectedradio.value ==
                          'Student') {
                        Fluttertoast.showToast(msg: 'Select class');
                      } else {
                        Fluttertoast.showToast(msg: 'Select staff');
                      }
                    }
                  } else if (staffInteractionComposeController.grpOrInd.value ==
                          'Group' &&
                      staffInteractionComposeController.selectedradio.value !=
                          'Student') {
                    if (arrayTeachers.isEmpty) {
                      Fluttertoast.showToast(msg: 'Select staff.');
                      return;
                    }
                  } else if (staffInteractionComposeController
                              .selectedradio.value ==
                          'Student' &&
                      selectedsection == null) {
                    Fluttertoast.showToast(msg: 'Select section');
                  } else if (staffInteractionComposeController
                          .selectedradio.value ==
                      'Student') {
                    if (staffInteractionComposeController.grpOrInd.value ==
                            'Group' &&
                        arrayStudents.isEmpty) {
                      Fluttertoast.showToast(msg: 'Select student');
                      return;
                    }
                    if (staffInteractionComposeController.grpOrInd.value ==
                            'Individual' &&
                        selectedstudent == null) {
                      Fluttertoast.showToast(msg: 'Select student');
                      return;
                    }
                    if (staffInteractionComposeController.isButton.value) {
                      logger.d('kkkkkkkk');
                      staffInteractionComposeController.issubmitloading(true);
                      staffInteractionComposeController.isbutton(false);
                      await submitComposeStaff(
                        data: staffInteractionComposeController
                                        .grpOrInd.value ==
                                    'Group' &&
                                staffInteractionComposeController
                                        .selectedradio.value ==
                                    'Student'
                            ? {
                                "ASMAY_Id": widget.loginSuccessModel.asmaYId!,
                                "ISMINT_ComposedByFlg":
                                    widget.loginSuccessModel.roleforlogin!,
                                "ISMINT_GroupOrIndFlg":
                                    staffInteractionComposeController
                                        .grpOrInd.value,
                                "ISMINT_Interaction": about.text, 
                                "ISMINT_Subject": subject.text,
                                "mI_ID": widget.loginSuccessModel.mIID!,
                                "arrayStudent": arrayStudents,
                                "roleflg":
                                    widget.loginSuccessModel.roleforlogin!,
                                "userflag": staffInteractionComposeController
                                    .selectedradio.value,
                                "userId":
                                    widget.loginSuccessModel.userId!.toString(),
                                "images_paths": ""
                              }
                            : staffInteractionComposeController
                                            .grpOrInd.value ==
                                        'Individual' &&
                                    staffInteractionComposeController
                                            .selectedradio.value ==
                                        'Student'
                                ? {
                                    "ASMAY_Id":
                                        widget.loginSuccessModel.asmaYId!,
                                    "ISMINT_ComposedByFlg":
                                        widget.loginSuccessModel.roleforlogin!,
                                    "ISMINT_GroupOrIndFlg":
                                        staffInteractionComposeController
                                            .grpOrInd.value,
                                    "ISMINT_Interaction": about.text,
                                    "ISMINT_Subject": subject.text,
                                    "mI_ID": widget.loginSuccessModel.mIID!,
                                    "student_Id": selectedstudent!.amstId,
                                    "roleflg":
                                        widget.loginSuccessModel.roleforlogin!,
                                    "userflag":
                                        staffInteractionComposeController
                                            .selectedradio.value,
                                    "userId": widget.loginSuccessModel.userId!
                                        .toString(),
                                    "images_paths": ""
                                  }
                                : staffInteractionComposeController
                                                .grpOrInd.value ==
                                            'Group' &&
                                        staffInteractionComposeController
                                                .selectedradio.value !=
                                            'Student'
                                    ? {
                                        "ASMAY_Id":
                                            widget.loginSuccessModel.asmaYId!,
                                        "ISMINT_ComposedByFlg": widget
                                            .loginSuccessModel.roleforlogin!,
                                        "ISMINT_GroupOrIndFlg":
                                            staffInteractionComposeController
                                                .grpOrInd.value,
                                        "ISMINT_Interaction": about.text,
                                        "ISMINT_Subject": subject.text,
                                        "mI_ID": widget.loginSuccessModel.mIID!,
                                        "arrayTeachers": arrayTeachers,
                                        "roleflg": widget
                                            .loginSuccessModel.roleforlogin!,
                                        "userflag":
                                            staffInteractionComposeController
                                                .selectedradio.value,
                                        "userId": widget
                                            .loginSuccessModel.userId!
                                            .toString(),
                                        "images_paths": ""
                                      }
                                    : staffInteractionComposeController
                                                    .grpOrInd.value ==
                                                'Individual' &&
                                            staffInteractionComposeController
                                                    .selectedradio.value !=
                                                'Student'
                                        ? {
                                            "ASMAY_Id": widget
                                                .loginSuccessModel.asmaYId!,
                                            "ISMINT_ComposedByFlg": widget
                                                .loginSuccessModel
                                                .roleforlogin!,
                                            "ISMINT_GroupOrIndFlg":
                                                staffInteractionComposeController
                                                    .grpOrInd.value,
                                            "ISMINT_Interaction": about.text,
                                            "ISMINT_Subject": subject.text,
                                            "mI_ID":
                                                widget.loginSuccessModel.mIID!,
                                            "employee_Id":
                                                staffInteractionComposeController
                                                                .selectedradio
                                                                .value ==
                                                            'EC' ||
                                                        staffInteractionComposeController
                                                                .selectedradio
                                                                .value ==
                                                            'Principal'
                                                    ? selectedInitialDropdown!
                                                        .id
                                                    : selectedInitialDropdown!
                                                        .iD,
                                            "roleflg": widget.loginSuccessModel
                                                .roleforlogin!,
                                            "userflag":
                                                staffInteractionComposeController
                                                    .selectedradio.value,
                                            "userId": widget
                                                .loginSuccessModel.userId!
                                                .toString(),
                                            "images_paths": ""
                                          }
                                        : {},
                        base: baseUrlFromInsCode(
                          'portal',
                          widget.mskoolController,
                        ),
                      ).then((value) {
                        selectedstudent = null;
                      });
                      staffInteractionComposeController.issubmitloading(false);
                      staffInteractionComposeController.isbutton(true);
                    }
                  }
                },
                child: staffInteractionComposeController.isSubmit.value
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
