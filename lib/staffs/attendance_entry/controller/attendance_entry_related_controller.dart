import 'package:get/get.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/api/attendance_entry_related_api.dart';
import 'package:m_skool_flutter/staffs/attendance_entry/model/initialdataModel.dart';

class AttendanceEntryController extends GetxController {
  RxList<AcademicYearListValue> academicYearList =
      <AcademicYearListValue>[].obs;
  RxList<ClassListValue> classList = <ClassListValue>[].obs;
  RxList<ClassListValue> sectionList = <ClassListValue>[].obs;
  RxList<SubjectListValue> subjectList = <SubjectListValue>[].obs;
  RxList<PeriodlistValue> periodList = <PeriodlistValue>[].obs;
  RxList<MonthListValue> monthList = <MonthListValue>[].obs;

  RxBool isInitialData = RxBool(false);

  void isinitialdataloading(bool loading) async {
    isInitialData.value = loading;
  }

  Future<bool> getAttendanceEntryInitialData({
    required int asmayId,
    required int userId,
    required int miId,
    required String username,
    required int roleId,
    required String base,
  }) async {
    InitialDataModel? initialDataModel = await getAttendanceEntryIntialData(
        asmayId: asmayId,
        userId: userId,
        miId: miId,
        username: username,
        roleId: roleId,
        base: base);
    try {
      if (initialDataModel!.academicYearList != null ||
          initialDataModel.academicYearList!.values != null) {
        academicYearList.clear();
        for (var i = 0;
            i < initialDataModel.academicYearList!.values!.length;
            i++) {
          academicYearList
              .add(initialDataModel.academicYearList!.values!.elementAt(i)!);
        }
      }

      if (initialDataModel.classList != null ||
          initialDataModel.classList!.values != null) {
        classList.clear();
        for (var i = 0; i < initialDataModel.classList!.values!.length; i++) {
          classList.add(initialDataModel.classList!.values!.elementAt(i)!);
        }
      }

      if (initialDataModel.sectionList != null ||
          initialDataModel.sectionList!.values != null) {
        sectionList.clear();
        for (var i = 0; i < initialDataModel.sectionList!.values!.length; i++) {
          sectionList.add(initialDataModel.sectionList!.values!.elementAt(i)!);
        }
      }
      if (initialDataModel.monthList != null ||
          initialDataModel.monthList!.values != null) {
        monthList.clear();
        for (var i = 0; i < initialDataModel.monthList!.values!.length; i++) {
          monthList.add(initialDataModel.monthList!.values!.elementAt(i)!);
        }
      }

      if (initialDataModel.subjectList != null ||
          initialDataModel.subjectList!.values != null) {
        subjectList.clear();
        for (var i = 0; i < initialDataModel.subjectList!.values!.length; i++) {
          subjectList.add(initialDataModel.subjectList!.values!.elementAt(i)!);
        }
      }
      if (initialDataModel.periodlist != null ||
          initialDataModel.periodlist!.values != null) {
        periodList.clear();
        for (var i = 0; i < initialDataModel.periodlist!.values!.length; i++) {
          periodList.add(initialDataModel.periodlist!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }
}
