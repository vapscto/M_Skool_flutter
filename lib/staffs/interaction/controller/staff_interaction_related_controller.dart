import 'package:get/get.dart';
import 'package:m_skool_flutter/staffs/interaction/model/interactionSectionModel.dart';
import 'package:m_skool_flutter/staffs/interaction/model/interactionStudentListModel.dart';
import 'package:m_skool_flutter/student/interaction/model/staff_detail_model.dart';

class StaffInteractionController extends GetxController {
  RxList<GetdetailsValue> getDetailList = <GetdetailsValue>[].obs;

  RxList<InteractionSectionListValue> interactionSectionList =
      <InteractionSectionListValue>[].obs;

  RxList<GetStudentValue> studentList = <GetStudentValue>[].obs;
}
