import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/controller/attendance_entry_related_controller.dart';

class AttendanceCheckboxWidget extends StatefulWidget {
  int index;
  bool attendance;
  Function(Map<String, dynamic>)? addToStudentlist;
  Function(int)? removeFromStudentlist;
  final int rollNo;
  final String admNo;
  final int amstId;
  final String studentName;
  final String amstRegistrationNo;
  AttendanceCheckboxWidget({
    super.key,
    required this.index,
    required this.attendance,
    this.addToStudentlist,
    this.removeFromStudentlist,
    required this.rollNo,
    required this.amstId,
    required this.studentName,
    required this.admNo,
    required this.amstRegistrationNo,
  });

  @override
  State<AttendanceCheckboxWidget> createState() =>
      _AttendanceCheckboxWidgetState();
}

class _AttendanceCheckboxWidgetState extends State<AttendanceCheckboxWidget> {
  final AttendanceEntryController attendanceEntryController =
      Get.put(AttendanceEntryController());
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      activeColor: Theme.of(context).primaryColor,
      value: widget.attendance,
      onChanged: (value) {
        setState(() {
          widget.attendance = value!;
        });
        if (value!) {
          if (attendanceEntryController.attendanceEntryType.value == 'P') {
            widget.addToStudentlist!({
              "amaY_RollNo": widget.rollNo,
              "amsT_AdmNo": widget.admNo,
              "amsT_Id": widget.amstId,
              "studentname": widget.studentName,
              "selected": value,
              "ASAS_Id": null,
              "asasB_Id": 0,
              "amsT_RegistrationNo": widget.amstRegistrationNo,
            });
          }
          if (attendanceEntryController.attendanceEntryType.value == 'D') {
            widget.addToStudentlist!({
              "amaY_RollNo": widget.rollNo,
              "amsT_AdmNo": widget.admNo,
              "amsT_Id": widget.amstId,
              "studentname": widget.studentName,
              "selected": value,
              "asasB_Id": 0,
              "amsT_RegistrationNo": widget.amstRegistrationNo,
            });
          }
          if (attendanceEntryController.attendanceEntryType.value == 'H') {
            widget.addToStudentlist!({
              "amaY_RollNo": widget.rollNo,
              "amsT_AdmNo": widget.admNo,
              "amsT_Id": widget.amstId,
              "studentname": widget.studentName,
              "FirstHalfflag": value,
              "SecondHalfflag": false,
              "amsT_RegistrationNo": widget.amstRegistrationNo
            });
          }
        } else if (!value) {
          widget.removeFromStudentlist!(widget.rollNo);
        }
      },
    );
  }
}
