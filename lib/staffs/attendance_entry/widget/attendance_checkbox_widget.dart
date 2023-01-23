import 'package:flutter/material.dart';

class AttendanceCheckboxWidget extends StatefulWidget {
  bool attendance;
  AttendanceCheckboxWidget({
    super.key,
    required this.attendance,
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
      },
    );
  }
}
