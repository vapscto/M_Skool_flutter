import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/marks_entry/api/marks_entry_related_api.dart';
import 'package:m_skool_flutter/staffs/marks_entry/model/academicyearmodel.dart';
import 'package:m_skool_flutter/staffs/marks_entry/model/classdropdownmodel.dart';
import 'package:m_skool_flutter/staffs/marks_entry/model/examdropdownmodel.dart';
import 'package:m_skool_flutter/staffs/marks_entry/model/sectiondropdownmodel.dart';
import 'package:m_skool_flutter/staffs/marks_entry/model/subjectdropdownmodel.dart';

class MarksEntryController extends GetxController {
  List<AcdlistClassValue> academicYearList = <AcdlistClassValue>[].obs;
  List<CtlistValue> classList = <CtlistValue>[].obs;
  List<SeclistValue> sectionList = <SeclistValue>[].obs;
  List<ExamlistValue> examList = <ExamlistValue>[].obs;
  List<SubjectlistValue> subjectNameList = <SubjectlistValue>[].obs;

  RxBool isAcamedicYear = RxBool(false);
  RxBool isClass = RxBool(false);
  RxBool isSection = RxBool(false);
  RxBool isExam = RxBool(false);
  RxBool isSubject = RxBool(false);

  void isacademicyearloading(bool loading) {
    isAcamedicYear.value = loading;
  }

  void isclassloading(bool loading) {
    isClass.value = loading;
  }

  void issectionloading(bool loading) {
    isSection.value = loading;
  }

  void isexamloading(bool loading) {
    isExam.value = loading;
  }

  void issubjectloading(bool loading) {
    isSubject.value = loading;
  }

  Future<bool> getacademicyear({
    required int miId,
    required int userId,
    required int roleId,
    required String base,
  }) async {
    AcademicYearModel? academicYearModel = await getAcademicYearData(
        miId: miId, userId: userId, roleId: roleId, base: base);
    try {
      if (academicYearModel!.acdlist != null ||
          academicYearModel.acdlist!.values != null) {
        academicYearList.clear();
        for (var i = 0; i < academicYearModel.acdlist!.values!.length; i++) {
          academicYearList
              .add(academicYearModel.acdlist!.values!.elementAt(i)!);
        }
        return true;
      }
      Fluttertoast.showToast(msg: 'Something went wrong');
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getclass({
    required int miId,
    required int asmayId,
    required int userId,
    required String base,
  }) async {
    ClassDropdownModel? classDropdownModel = await getClassData(
        miId: miId, asmayId: asmayId, userId: userId, base: base);
    try {
      if (classDropdownModel!.ctlist != null ||
          classDropdownModel.ctlist!.values != null) {
        classList.clear();
        for (var i = 0; i < classDropdownModel.ctlist!.values!.length; i++) {
          classList.add(classDropdownModel.ctlist!.values!.elementAt(i)!);
        }
        return true;
      }
      Fluttertoast.showToast(msg: 'Something went wrong');
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getsection(
      {required int miId,
      required int asmayId,
      required int userId,
      required int asmclId,
      required String base}) async {
    SectionDropdownModel? sectionDropdownModel = await getSectionData(
        miId: miId,
        userId: userId,
        asmayId: asmayId,
        asmclId: asmclId,
        base: base);
    try {
      if (sectionDropdownModel!.seclist != null ||
          sectionDropdownModel.seclist!.values != null) {
        sectionList.clear();
        for (var i = 0; i < sectionDropdownModel.seclist!.values!.length; i++) {
          sectionList.add(sectionDropdownModel.seclist!.values!.elementAt(i)!);
        }
        return true;
      }
      Fluttertoast.showToast(msg: 'Something went wrong');
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getexam({
    required int miId,
    required int asmayId,
    required int asmclId,
    required int asmsId,
    required String base,
  }) async {
    ExamDropdownModel? examDropdownModel = await getExamData(
        miId: miId,
        asmayId: asmayId,
        asmclId: asmclId,
        asmsId: asmsId,
        base: base);
    try {
      if (examDropdownModel!.examlist != null ||
          examDropdownModel.examlist!.values != null) {
        examList.clear();
        for (var i = 0; i < examDropdownModel.examlist!.values!.length; i++) {
          examList.add(examDropdownModel.examlist!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getsubjectname({
    required int miId,
    required int userId,
    required int asmayId,
    required int asmclId,
    required int asmsId,
    required int amstId,
    required int emeId,
    required String base,
  }) async {
    SubjectDropdownModel? subjectDropdownModel = await getsubjectNameData(
        miId: miId,
        userId: userId,
        asmayId: asmayId,
        asmclId: asmclId,
        asmsId: asmsId,
        amstId: amstId,
        emeId: emeId,
        base: base);

    try {
      if (subjectDropdownModel!.subjectlist != null ||
          subjectDropdownModel.subjectlist!.values != null) {
        subjectNameList.clear();
        for (var i = 0;
            i < subjectDropdownModel.subjectlist!.values!.length;
            i++) {
          subjectNameList
              .add(subjectDropdownModel.subjectlist!.values!.elementAt(i)!);
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
