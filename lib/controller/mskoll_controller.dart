import 'package:get/get.dart';
import 'package:m_skool_flutter/model/institutional_code_model.dart';

class MskoolController extends GetxController {
  Rx<InstitutionalCodeModel>? universalInsCodeModel;

  void updateUniversalInsCodeModel(InstitutionalCodeModel newValue) {
    universalInsCodeModel = Rx<InstitutionalCodeModel>(newValue);
  }
}
