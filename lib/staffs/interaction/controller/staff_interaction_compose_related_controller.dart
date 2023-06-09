import 'package:get/get.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/interaction/api/staff_interaction_compose_related_api.dart';
import 'package:m_skool_flutter/staffs/interaction/model/initialDropdownDetailModel.dart';
import 'package:m_skool_flutter/staffs/interaction/model/interactionSectionModel.dart';
import 'package:m_skool_flutter/staffs/interaction/model/interactionStudentListModel.dart';

class StaffInteractionComposeController extends GetxController {
  RxList<GetdetailsValues> getDetailList = <GetdetailsValues>[].obs;

  RxList<InteractionSectionListValue> interactionSectionList =
      <InteractionSectionListValue>[].obs;

  RxList<GetStudentValue> studentList = <GetStudentValue>[].obs;

  RxString selectedradio = ''.obs;
  RxString grpOrInd = 'Group'.obs;

  RxBool isInteraction = RxBool(false);
  RxBool isGetDetail = RxBool(false);
  RxBool isSection = RxBool(false);
  RxBool isStudent = RxBool(false);
  RxBool isSubmit = RxBool(false);
  RxBool isButton = RxBool(true);

  void isbutton(bool loading) {
    isButton.value = loading;
  }

  void isInteractionloading(bool loading) {
    isInteraction.value = loading;
  }

  void isgetdetailloading(bool loading) {
    isGetDetail.value = loading;
  }

  void issectionloading(bool loading) {
    isSection.value = loading;
  }

  void isstudentloading(bool loading) {
    isStudent.value = loading;
  }

  void issubmitloading(bool loading) {
    isSubmit.value = loading;
  }

  void selectedValue(String value) {
    selectedradio.value = value;
  }

  void groupOrIndividual(String value) {
    grpOrInd.value = value;
  }

  Future<bool> getFirstDropdownData({
    required int asmayId,
    required int roleId,
    required int miId,
    required String roleFlag,
    required String selectedRadioButton,
    required String userId,
    required String base,
  }) async {
    InitialDropdownDetailModel? initialDropdownDetailModel =
        await getIntialDropdownDetails(
            asmayId: asmayId,
            roleId: roleId,
            miId: miId,
            roleFlag: roleFlag,
            selectedRadioButton: selectedRadioButton,
            userId: userId,
            base: base);

    try {
      if (initialDropdownDetailModel!.getdetails != null ||
          initialDropdownDetailModel.getdetails!.values != null) {
        getDetailList.clear();
        for (var i = 0;
            i < initialDropdownDetailModel.getdetails!.values!.length;
            i++) {
          getDetailList.add(
              initialDropdownDetailModel.getdetails!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getSectionListData({
    required int asmayId,
    required int roleId,
    required int miId,
    required String roleFlag,
    required int userId,
    required int asmclId,
    required String base,
  }) async {
    InteractionSectionModel? interactionSectionModel =
        await getInteractionSectionListData(
            asmayId: asmayId,
            roleId: roleId,
            miId: miId,
            roleFlag: roleFlag,
            userId: userId,
            asmclId: asmclId,
            base: base);
    try {
      if (interactionSectionModel!.sectionList != null ||
          interactionSectionModel.sectionList!.values != null) {
        interactionSectionList.clear();
        for (var i = 0;
            i < interactionSectionModel.sectionList!.values!.length;
            i++) {
          interactionSectionList
              .add(interactionSectionModel.sectionList!.values!.elementAt(i)!);
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.d(e.toString());
      return false;
    }
  }

  Future<bool> getStudentListData({
    required int asmayId,
    required int roleId,
    required int miId,
    required String roleFlag,
    required String userId,
    required int asmclId,
    required int asmsId,
    required String base,
  }) async {
    InteractionStudentListModel? interactionStudentListModel =
        await getInteractionStudentListData(
            asmayId: asmayId,
            roleId: roleId,
            miId: miId,
            roleFlag: roleFlag,
            userId: userId,
            asmclId: asmclId,
            asmsId: asmsId,
            base: base);
    try {
      if (interactionStudentListModel!.getStudent != null ||
          interactionStudentListModel.getStudent!.values != null) {
        studentList.clear();
        for (var i = 0;
            i < interactionStudentListModel.getStudent!.values!.length;
            i++) {
          studentList.add(
              interactionStudentListModel.getStudent!.values!.elementAt(i)!);
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
