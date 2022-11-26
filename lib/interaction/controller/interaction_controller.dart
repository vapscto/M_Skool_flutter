import 'package:get/get.dart';

class InteractionController extends GetxController {
  RxBool isStudent = true.obs;
  RxBool isGroup = true.obs;

  onGroupTypeSelect(bool state) {
    isGroup.value = state;
  }

  onUserGroupType(bool state) {
    isStudent.value = state;
  }

  onIndividualGroupType(String user) {}
}
