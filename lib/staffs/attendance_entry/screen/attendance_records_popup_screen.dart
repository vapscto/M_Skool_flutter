import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/controller/attendance_entry_related_controller.dart';

class AttendanceRecordPopupScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final int asmayId;
  final int asmclId;
  final int asmsId;
  final String attentrytype;
  const AttendanceRecordPopupScreen({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
    required this.asmayId,
    required this.asmclId,
    required this.asmsId,
    required this.attentrytype,
  });

  @override
  State<AttendanceRecordPopupScreen> createState() =>
      _AttendanceRecordPopupScreenState();
}

class _AttendanceRecordPopupScreenState
    extends State<AttendanceRecordPopupScreen> {
  final AttendanceEntryController attendanceEntryController =
      Get.put(AttendanceEntryController());

  @override
  void initState() {
    getAttendanceRecord();
    super.initState();
  }

  getAttendanceRecord() async {
    await attendanceEntryController
        .getAttendanceEntryRecord(
            base: baseUrlFromInsCode('admission', widget.mskoolController),
            miId: widget.loginSuccessModel.mIID!,
            asmayId: widget.asmayId,
            asmclId: widget.asmclId,
            asmsId: widget.asmsId,
            username: widget.loginSuccessModel.userName!,
            userId: widget.loginSuccessModel.userId!,
            attentrytype: widget.attentrytype)
        .then((value) => logger.d(value));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // contentPadding: const EdgeInsets.symmetric(horizontal: 1),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(
            height: 150,
            width: double.infinity,
            child: Text('View Records'),
          ),
          // ListView.builder(
          //     shrinkWrap: true,
          //     itemCount:
          //         attendanceEntryController.attendanceEntryRecordList.length,
          //     itemBuilder: (context, index) {
          //       return Text(attendanceEntryController
          //           .attendanceEntryRecordList
          //           .elementAt(index)
          //           .asaId!
          //           .toString());
          //     }),
        ],
      ),
    );
  }
}
