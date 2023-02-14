import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/controller/attendance_entry_related_controller.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

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
    attendanceEntryController.isviewrecordloading(true);
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
    attendanceEntryController.isviewrecordloading(false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 50,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '      View Records',
              style: Theme.of(context).textTheme.labelSmall!.merge(
                  const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.0,
                      color: Colors.white,
                      letterSpacing: 0.3)),
            ),
          ),
        ),
        Obx(
          () => attendanceEntryController.isViewRecord.value
              ? const Center(
                  child: AnimatedProgressWidget(
                      title: "Loading View Records",
                      desc: "Please wait",
                      animationPath: "assets/json/default.json",
                      animatorHeight: 65),
                )
              : attendanceEntryController.attendanceEntryRecordList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: Text(
                          'No record found for selected field, take attendance and try again',
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.titleSmall!.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height / 2,
                      child: ListView.builder(
                        
                          shrinkWrap: true,
                          itemCount: attendanceEntryController
                              .attendanceEntryRecordList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 20),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: CustomContainer(
                                      child: ListTile(
                                        minLeadingWidth: 10,
                                        leading: Icon(
                                          Icons.calendar_today_outlined,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                        title: Text(
                                          attendanceEntryController
                                              .attendanceEntryRecordList
                                              .elementAt(index)
                                              .asaEntryDateTime!
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .copyWith(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          onTap: () {},
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            padding: const EdgeInsets.all(8.0),
                                            child: SvgPicture.asset(
                                              "assets/svg/delete.svg",
                                              color: Colors.white,
                                              height: 24,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
        ),
      ],
    );
  }
}
