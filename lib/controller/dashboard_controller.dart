import 'package:get/get.dart';
import 'package:m_skool_flutter/apis/dashboard_apis.dart';
import 'package:m_skool_flutter/model/student_dashboard_model.dart';

class DashboardController extends GetxController {
  RxList<AttendanceList> attendance = <AttendanceList>[].obs;
  RxList<FeesList> feeList = <FeesList>[].obs;
  RxList<TimeTableList> timeTableList = <TimeTableList>[].obs;
  RxList<ExamList> examList = <ExamList>[].obs;
  Future studentDashBoardDetails({
    required int miId,
    required int asmayId,
    required int amstId,
    required String base,
    required int asmcLId,
    required int asmSId,
  }) async {
    StudentDashboardModel studentDashboardModel = await getStudentDashboardData(
      miId: miId,
      asmayId: asmayId,
      amstId: amstId,
      base: base,
      asmSId: asmSId,
      asmcLId: asmcLId,
    );
    if (studentDashboardModel.attendanceList != null) {
      attendance.add(studentDashboardModel.attendanceList!);
    }
    if (studentDashboardModel.feesList != null) {
      feeList.add(studentDashboardModel.feesList!);
    }
    if (studentDashboardModel.feesList != null) {
      feeList.add(studentDashboardModel.feesList!);
    }
    if (studentDashboardModel.timeTableList != null) {
      timeTableList.add(studentDashboardModel.timeTableList!);
    }
    if (studentDashboardModel.examList != null) {
      examList.add(studentDashboardModel.examList!);
    }
  }
}
