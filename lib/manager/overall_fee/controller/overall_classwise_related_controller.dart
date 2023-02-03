import 'package:get/get.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/manager/overall_fee/api/overall_classwise_related_api.dart';
import 'package:m_skool_flutter/manager/overall_fee/model/overallFeeAcademicYearModel.dart';
import 'package:m_skool_flutter/manager/overall_fee/model/overallFeeClassModel.dart';
import 'package:m_skool_flutter/manager/overall_fee/model/overallFeeClasswiseStudentDetailModel.dart';
import 'package:m_skool_flutter/manager/overall_fee/model/overallFeeSectionModel.dart';

class OverallClasswiseController extends GetxController {
  RxList<YearlistValue> academicYearList = <YearlistValue>[].obs;
  RxList<ClassarrayValue> classList = <ClassarrayValue>[].obs;
  RxList<FillsectionValue> sectionList = <FillsectionValue>[].obs;
  RxList<StudbalValue> resultsList = <StudbalValue>[].obs;

  RxBool isAcademicYear = RxBool(false);
  RxBool isClass = RxBool(false);
  RxBool isSection = RxBool(false);
  RxBool isResult = RxBool(false);

  void isacademicyearloading(bool loading) async {
    isAcademicYear.value = loading;
  }

  void isclassloading(bool loading) async {
    isClass.value = loading;
  }

  void issectionloading(bool loading) async {
    isSection.value = loading;
  }

  void isresultloading(bool loading) async {
    isResult.value = loading;
  }

  Future<bool> getAcademicList({
    required int miId,
    required String base,
  }) async {
    OverallFeeAcademicYearModel? overallFeeAcademicYearModel =
        await getClasswiseAcademicYearData(miId: miId, base: base);

    try {
      if (overallFeeAcademicYearModel!.yearlist != null ||
          overallFeeAcademicYearModel.yearlist!.values != null) {
        academicYearList.clear();
        for (var i = 0;
            i < overallFeeAcademicYearModel.yearlist!.values!.length;
            i++) {
          academicYearList
              .add(overallFeeAcademicYearModel.yearlist!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getClassListData({
    required String base,
    required int miId,
    required int asmayId,
  }) async {
    OverallFeeClassModel? overallFeeClassModel =
        await getClasswiseClassData(base: base, miId: miId, asmayId: asmayId);

    try {
      if (overallFeeClassModel!.classarray != null ||
          overallFeeClassModel.classarray!.values != null) {
        classList.clear();
        for (var i = 0;
            i < overallFeeClassModel.classarray!.values!.length;
            i++) {
          classList.add(overallFeeClassModel.classarray!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getSectionData({
    required String base,
    required int miId,
    required int asmayId,
    required int asmclId,
  }) async {
    OverallFeeSectionModel? overallFeeSectionModel =
        await getClasswiseSectionData(
            base: base, miId: miId, asmayId: asmayId, asmclId: asmclId);
    try {
      if (overallFeeSectionModel!.fillsection != null ||
          overallFeeSectionModel.fillsection!.values != null) {
        sectionList.clear();
        for (var i = 0;
            i < overallFeeSectionModel.fillsection!.values!.length;
            i++) {
          sectionList
              .add(overallFeeSectionModel.fillsection!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getResultData({
    required String base,
    required int asmayId,
    required int miId,
    required int asmclId,
    required int asmsId,
  }) async {
    OverallFeeClasswiseStudentDetailModel?
        overallFeeClasswiseStudentDetailModel = await getClasswiseResultData(
            base: base,
            asmayId: asmayId,
            miId: miId,
            asmclId: asmclId,
            asmsId: asmsId);
    try {
      if (overallFeeClasswiseStudentDetailModel!.studbal != null ||
          overallFeeClasswiseStudentDetailModel.studbal!.values != null) {
        resultsList.clear();
        for (var i = 0;
            i < overallFeeClasswiseStudentDetailModel.studbal!.values!.length;
            i++) {
          resultsList.add(overallFeeClasswiseStudentDetailModel.studbal!.values!
              .elementAt(i)!);
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
