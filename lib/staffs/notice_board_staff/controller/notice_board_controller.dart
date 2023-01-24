import 'package:get/get.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/model/classes_model_data_model.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/model/notice_student_data_model.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/model/section_detail_model.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/model/view_notice_data_model.dart';

class NoticeBoardController extends GetxController {
  RxList<ViewNoticeDetailsModelValuesValues> viewNoticeList = RxList();

  RxBool isErrorOccuredWhileLoadingWork = RxBool(false);

  RxBool isErrorOccuredWhileLoadingSection = RxBool(false);

  void updateIsErrorOccuredWhileLoadingSection(bool b) {
    isErrorOccuredWhileLoadingSection.value = b;
  }

  RxBool isSectionLoading = RxBool(false);

  void updateIsSectionLoading(bool b) {
    isSectionLoading.value = b;
  }

  RxList<SectionDetailsModelValues> sections = RxList();

  void updateSection(List<SectionDetailsModelValues> c) {
    if (sections.isNotEmpty) {
      sections.clear();
    }
    sections.addAll(c);
  }

  void updateIsErrorOccuredWhileLoadingNotice(bool b) {
    isErrorOccuredWhileLoadingWork.value = b;
  }

  RxBool isErrorOccuredWhileLoadingClass = RxBool(false);

  void updateIsErrorOccuredWhileLoadingClass(bool b) {
    isErrorOccuredWhileLoadingClass.value = b;
  }

  RxString viewWorkLoadingStatus =
      RxString("Please wait while we are loading all notices");

  void updateViewWorkLoadingStatus(String status) {
    viewWorkLoadingStatus.value = status;
  }

  RxBool isWorkLoading = RxBool(false);

  void updateIsWorkLoading(bool b) {
    isWorkLoading.value = b;
  }

  RxBool isClassLoading = RxBool(false);

  void updateIsClassLoading(bool b) {
    isClassLoading.value = b;
  }

  void updateViewNoticeList(
      List<ViewNoticeDetailsModelValuesValues> val) async {
    if (viewNoticeList.isNotEmpty) {
      viewNoticeList.clear();
    }
    viewNoticeList.addAll(val);
  }

  RxList<ClassNameDetailsModelValues> classesList = RxList();

  void updateClassesList(List<ClassNameDetailsModelValues> val) async {
    if (classesList.isNotEmpty) {
      classesList.clear();
    }
    classesList.addAll(val);
  }

  RxList<ClassNameDetailsModelValues> selectedClasses = RxList();

  void addToSelectedClasses(ClassNameDetailsModelValues value) {
    selectedClasses.add(value);
  }

  void removeSelectedClass(ClassNameDetailsModelValues re) {
    selectedClasses.remove(re);
  }

  RxBool studentSelection = RxBool(false);

  void updateStudentSeclection(bool b) {
    studentSelection.value = b;
  }

  RxBool isErrorOccuredWhileLoadingStudent = RxBool(false);

  void updateIsErrorOccuredWhileLoadingStudent(bool b) {
    isErrorOccuredWhileLoadingStudent.value = b;
  }

  RxBool isStudentLoading = RxBool(false);

  void updateIsStudentLoading(bool b) {
    isStudentLoading.value = b;
  }

  RxList<NoticeStudentDetailsModelValues> students = RxList();

  void updateStudents(List<NoticeStudentDetailsModelValues> stu) {
    if (students.isNotEmpty) {
      students.clear();
    }
    students.addAll(stu);
  }

  RxList<SectionDetailsModelValues> selectedSections = RxList();

  void addToSection(SectionDetailsModelValues sec) {
    selectedSections.add(sec);
  }

  void removeFromSection(SectionDetailsModelValues v) {
    selectedSections.remove(v);
  }
}
