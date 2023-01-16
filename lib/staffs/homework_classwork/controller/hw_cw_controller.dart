import 'package:get/get.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/hw_cw_classes_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/hw_cw_section_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/model/hw_cw_subject_model.dart';
import 'package:m_skool_flutter/staffs/view_notice/model/view_notice_session_model.dart';

class HwCwController extends GetxController {
  RxBool isWholePageLoading = RxBool(true);
  void updateIsWholePageLoading(bool ok) {
    isWholePageLoading.value = ok;
  }

  RxBool isAcademicYearLoading = RxBool(false);
  void updateIsAcademicYearLoading(bool ok) {
    isAcademicYearLoading.value = ok;
  }

  RxBool isErrorOccuredLoadingAcademicYear = RxBool(false);
  void updateIsErrorOccuredLoadingAcademicYear(bool ok) {
    isErrorOccuredLoadingAcademicYear.value = ok;
  }

  RxBool isClassLoading = RxBool(false);
  void updateIsClassLoading(bool ok) {
    isClassLoading.value = ok;
  }

  RxBool isErrorOccuredLoadingClass = RxBool(false);
  void updateIsErrorOccuredLoadingClass(bool ok) {
    isErrorOccuredLoadingClass.value = ok;
  }

  RxBool isSectionLoading = RxBool(false);
  void updateIsSectionLoading(bool ok) {
    isSectionLoading.value = ok;
  }

  RxBool isErrorOccuredLoadingSection = RxBool(false);
  void updateIsErrorOccuredLoadingSection(bool ok) {
    isErrorOccuredLoadingSection.value = ok;
  }

  RxBool isSubjectLoading = RxBool(false);
  void updateIsSubjectLoading(bool o) {
    isSubjectLoading.value = o;
  }

  RxBool isErrorOccuredLoadingSubject = RxBool(false);
  void updateIsErrorOccuredLoadingSubject(bool o) {
    isErrorOccuredLoadingSubject.value = o;
  }

  RxList<ViewNoticeSessionModelValues> session = RxList();
  void updateSession(List<ViewNoticeSessionModelValues> list) {
    if (session.isNotEmpty) {
      session.clear();
    }
    session.addAll(list);
  }

  RxList<HwCwClassesListModelValues> classes = RxList();

  void updateClasses(List<HwCwClassesListModelValues> clas) {
    if (classes.isNotEmpty) {
      classes.clear();
    }
    classes.addAll(clas);
  }

  RxList<HwCwSectionListModelValue> sections = RxList();
  void updateSections(List<HwCwSectionListModelValue> li) {
    if (sections.isNotEmpty) {
      sections.clear();
    }
    sections.addAll(li);
  }

  RxList<HwCwSubjectListModelValues> subjects = RxList();

  void updateSubjects(List<HwCwSubjectListModelValues> sub) {
    if (subjects.isNotEmpty) {
      subjects.clear();
    }
    subjects.addAll(sub);
  }

  RxString loadingStatus = RxString("");
  void updateLoadingStatus(String status) {
    loadingStatus.value = status;
  }

  RxString errorStatus = RxString("");
  void updateErrorStatus(String status) {
    errorStatus.value = status;
  }

  Rx<ViewNoticeSessionModelValues> selectedSession =
      Rx(ViewNoticeSessionModelValues());

  void updateSelectedSession(ViewNoticeSessionModelValues selected) {
    selectedSession.value = selected;
  }

  Rx<HwCwClassesListModelValues> selectedClass =
      Rx(HwCwClassesListModelValues());

  void updateSelectedClass(HwCwClassesListModelValues selClass) {
    selectedClass.value = selClass;
  }

  Rx<HwCwSectionListModelValue> selectedSection =
      Rx(HwCwSectionListModelValue());

  void updateSelectedSection(HwCwSectionListModelValue val) {
    selectedSection.value = val;
  }

  Rx<HwCwSubjectListModelValues> selectedSubject =
      Rx(HwCwSubjectListModelValues());
  void updateSelectedSubject(HwCwSubjectListModelValues sub) {
    selectedSubject.value = sub;
  }

  Rx<DateTime> hwDate = Rx<DateTime>(DateTime.now());

  void updateHwDate(DateTime now) {
    hwDate.value = now;
  }
}
