import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/screen/daywise_attendance_entry_detail.screen.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/dropdown_label.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

class DayWiseAttendanceEntryHome extends StatefulWidget {
  const DayWiseAttendanceEntryHome({super.key});

  @override
  State<DayWiseAttendanceEntryHome> createState() =>
      _DayWiseAttendanceEntryHomeState();
}

class _DayWiseAttendanceEntryHomeState
    extends State<DayWiseAttendanceEntryHome> {
  List<String> demoList = [
    'Demo',
    'Demo1',
    'Demo3',
    'Demo5',
  ];
  String slected = 'Demo';
  var selectedDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 25,
        title: const Text('Attendance Entry'),
      ),
      floatingActionButton: const HomeFab(),
      body: SingleChildScrollView(
        child: Column(
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
                itemHeight: 60,
                menuMaxHeight: 60,
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
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: CustomContainer(
                child: TextField(
                  style: Theme.of(context).textTheme.titleSmall,
                  controller: selectedDate,
                  onTap: () async {
                    var date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025),
                    );
                    if (date != null) {
                      setState(() {
                        selectedDate.text =
                            "${numberList[date.day]}-${numberList[date.month]}-${date.year}";
                      });
                    }
                  },
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      child: const CustomDropDownLabel(
                        icon: 'assets/images/darkbluecalendar.png',
                        containerColor: Color.fromRGBO(229, 243, 255, 1),
                        text: 'Select Month',
                        textColor: Color.fromRGBO(62, 120, 170, 1),
                      ),
                    ),
                    hintText: 'Select date.'.tr,
                    suffixIcon: Image.asset(
                      'assets/images/darkbluecalendar.png',
                      color: Colors.black,
                    ),
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
                  readOnly: true,
                ),
              ),
            ),
            const SizedBox(height: 60),
            MSkollBtn(
                title: 'View Details',
                onPress: () {
                  Get.to(() => const DayWiseAttendanceEntryDetailScreen());
                }),
            const SizedBox(height: 10),
            Center(
              child: Image.asset('assets/images/monthwiseillustration.png'),
            )
          ],
        ),
      ),
    );
  }
}
