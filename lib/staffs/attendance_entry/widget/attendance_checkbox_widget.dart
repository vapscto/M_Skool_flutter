import 'package:flutter/material.dart';

import '../model/subjectModel.dart';

class AttendanceCheckboxWidget extends StatefulWidget {
  int index;
  bool attendance;
  StudentListValuess? value;
  Function(Map<String, dynamic>)? addToStudentlist;
  Function(int)? removeFromStudentlist;
  AttendanceCheckboxWidget({
    super.key,
    required this.index,
    required this.attendance,
    this.value,
    this.addToStudentlist,
    this.removeFromStudentlist,
  });

  @override
  State<AttendanceCheckboxWidget> createState() =>
      _AttendanceCheckboxWidgetState();
}

class _AttendanceCheckboxWidgetState extends State<AttendanceCheckboxWidget> {
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
          widget.addToStudentlist!({
            "amaY_RollNo": widget.value!.amaYRollNo,
            "amsT_AdmNo": widget.value!.amsTAdmNo,
            "amsT_Id": widget.value!.amsTId,
            "studentname": widget.value!.studentname,
            "selected": value,
            "ASAS_Id": null,
            "asasB_Id": 0,
            "amsT_RegistrationNo": widget.value!.amsTRegistrationNo,
          });
        } else if (!value) {
          widget.removeFromStudentlist!(widget.value!.amaYRollNo!);
        }
      },
    );
  }
}
