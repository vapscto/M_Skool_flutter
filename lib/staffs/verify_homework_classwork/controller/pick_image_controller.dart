import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/model/verify_cw_model.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/model/verify_hw_model.dart';
import 'package:m_skool_flutter/student/homework/model/upload_hw_cw_model.dart';

class PickImageController extends GetxController {
  // PickImageController.init();
  // static PickImageController instance = PickImageController.init();

  RxList<XFile?> images = RxList();

  void addToImages(List<XFile?> file) {
    images.addAll(file);
  }

  RxList<PlatformFile> platformFile = RxList();

  void addPlatformFile(List<PlatformFile> files) {
    platformFile.addAll(files);
  }

  RxString uploadStatus = RxString("Connecting to Server");
  void updateUploadStatus(String status) {
    uploadStatus.value = status;
  }

  RxList<UploadHwCwModel> hwCwModel = RxList();

  void addToUpload(UploadHwCwModel model) {
    hwCwModel.add(model);
  }

  RxBool isErrorOccured = RxBool(false);

  void updateIsErrorOccured(bool f) {
    isErrorOccured.value = f;
  }

  RxBool isUploading = RxBool(false);

  void updateIsUploading(bool b) {
    isUploading.value = b;
  }

  RxList<TextEditingController> textEditingControllers = RxList();

  void updateTextEditingControllers(TextEditingController controller) {
    textEditingControllers.add(controller);
  }

  RxList<VerifyHwListModelValues> hwList = RxList();

  void updateHwList(List<VerifyHwListModelValues> hw) {
    if (hwList.isNotEmpty) {
      hwList.clear();
    }
    hwList.addAll(hw);
  }

  RxList<VerifyClassworkListValues> cwList = RxList();

  void updateCwList(List<VerifyClassworkListValues> lst) {
    if (cwList.isNotEmpty) {
      cwList.clear();
    }
    cwList.addAll(lst);
  }
}
