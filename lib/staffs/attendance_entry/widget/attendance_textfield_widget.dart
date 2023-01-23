import 'package:flutter/material.dart';

class AttendanceTextfieldWidget extends StatefulWidget {
  const AttendanceTextfieldWidget({super.key});

  @override
  State<AttendanceTextfieldWidget> createState() =>
      _AttendanceTextfieldWidgetState();
}

class _AttendanceTextfieldWidgetState extends State<AttendanceTextfieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(
            fontSize: 13,
            color: Color.fromRGBO(0, 0, 0, 0.95),
            fontWeight: FontWeight.w400),
      ),
    );
  }
}
