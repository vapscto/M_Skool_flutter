import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/dropdown_label.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/screen/consolidated_monthly_student_attendance_detail_screen.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/widget/selectdatefromtodate.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/widget/selectmonthscrollcontainer.dart';
import 'package:m_skool_flutter/staffs/student_attendance_staff/widget/selectstudentscrollcontainer.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

class StudentAttendanceStaffHome extends StatefulWidget {
  const StudentAttendanceStaffHome({super.key});

  @override
  State<StudentAttendanceStaffHome> createState() =>
      _StudentAttendanceStaffHomeState();
}

class _StudentAttendanceStaffHomeState
    extends State<StudentAttendanceStaffHome> {
  List<String> demoList = [
    'Demo',
    'Demo1',
    'Demo3',
    'Demo5',
    'Demo6',
    'Demo7',
    'Demo8',
  ];
  String slected = 'Demo';

  String selectedRadio = 'consolidated';
  String configuration = 'monthly';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 25,
        title: const Text('Student Attendance'),
      ),
      floatingActionButton: const HomeFab(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 40, left: 16, right: 16, bottom: 16),
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
              child: DropdownButtonFormField<String>(
                value: slected,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: CustomDropDownLabel(
                    icon: 'assets/images/hat.png',
                    containerColor: Color.fromRGBO(223, 251, 254, 1),
                    text: 'Academic Year',
                    textColor: Color.fromRGBO(40, 182, 200, 1),
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
                items: List.generate(demoList.length, (index) {
                  return DropdownMenuItem(
                    value: demoList[index],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 5),
                      child: Text(
                        demoList[index],
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                  );
                }),
                onChanged: (s) {
                  // selectedStaff = s!;
                  // logger.d(s.hrmEId.toString());
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              child: DropdownButtonFormField<String>(
                value: slected,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: CustomDropDownLabel(
                    icon: 'assets/images/classnew.png',
                    containerColor: Color.fromRGBO(255, 235, 234, 1),
                    text: 'Class',
                    textColor: Color.fromRGBO(255, 111, 103, 1),
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
                items: List.generate(demoList.length, (index) {
                  return DropdownMenuItem(
                    value: demoList[index],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 5),
                      child: Text(
                        demoList[index],
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                  );
                }),
                onChanged: (s) {
                  // selectedStaff = s!;
                  // logger.d(s.hrmEId.toString());
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              child: DropdownButtonFormField<String>(
                value: slected,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: CustomDropDownLabel(
                    icon: 'assets/images/sectionnew.png',
                    containerColor: Color.fromRGBO(219, 253, 245, 1),
                    text: 'Section',
                    textColor: Color.fromRGBO(71, 186, 158, 1),
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
                items: List.generate(demoList.length, (index) {
                  return DropdownMenuItem(
                    value: demoList[index],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 5),
                      child: Text(
                        demoList[index],
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                  );
                }),
                onChanged: (s) {
                  // selectedStaff = s!;
                  // logger.d(s.hrmEId.toString());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Radio(
                          visualDensity: const VisualDensity(horizontal: -4.0),
                          activeColor: Theme.of(context).primaryColor,
                          value: "consolidated",
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value.toString();
                              logger.d(selectedRadio);
                            });
                          },
                        ),
                      ),
                      Text(
                        "Consolidated",
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                letterSpacing: 0.3)),
                      ),
                    ],
                  ),
                  const SizedBox(width: 30),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Radio(
                          visualDensity: const VisualDensity(horizontal: -4.0),
                          activeColor: Theme.of(context).primaryColor,
                          value: "detailed",
                          groupValue: selectedRadio,
                          onChanged: (value) {
                            setState(() {
                              selectedRadio = value.toString();
                              logger.d(selectedRadio);
                            });
                          },
                        ),
                      ),
                      Text(
                        "Detailed",
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                letterSpacing: 0.3)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                'Select Configuration',
                style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        letterSpacing: 0.3)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: Row(
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Radio(
                          visualDensity: const VisualDensity(horizontal: -4.0),
                          activeColor: Theme.of(context).primaryColor,
                          value: "monthly",
                          groupValue: configuration,
                          onChanged: (value) {
                            setState(() {
                              configuration = value.toString();
                              logger.d(configuration);
                            });
                          },
                        ),
                      ),
                      Text(
                        "Monthly",
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                letterSpacing: 0.3)),
                      ),
                    ],
                  ),
                  const SizedBox(width: 65),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.1,
                        child: Radio(
                          visualDensity: const VisualDensity(horizontal: -4.0),
                          activeColor: Theme.of(context).primaryColor,
                          value: "datewise",
                          groupValue: configuration,
                          onChanged: (value) {
                            setState(() {
                              configuration = value.toString();
                              logger.d(configuration);
                            });
                          },
                        ),
                      ),
                      Text(
                        "Date Wise",
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                                letterSpacing: 0.3)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (configuration == 'monthly') const SizedBox(height: 10),
            configuration == 'monthly'
                ? const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
                    child: SelectMonthScrollContainer())
                : const SelectDateFromToDate(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: SelectStudentScrollContainer(),
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: MSkollBtn(
                  title: 'Search',
                  onPress: () {
                    if (selectedRadio == 'consolidated' &&
                        configuration == 'monthly') {
                      Get.to(() =>
                          const ConsolidatedMonthlyStudentAttendanceDetailScreen());
                    }
                  }),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
