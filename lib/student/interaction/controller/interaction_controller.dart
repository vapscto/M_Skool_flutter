import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/student/interaction/apis/messaging_api.dart';

import '../model/message_model.dart';

class InteractionController extends GetxController {
  // RxBool isStudent = true.obs;
  // RxBool isGroup = true.obs;
  // onGroupTypeSelect(bool state) {
  //   isGroup.value = state;
  // }
  // onUserGroupType(bool state) {
  //   isStudent.value = state;
  // }

  // onIndividualGroupType(String user) {}
  RxBool isMessage = RxBool(false);
  RxBool isSending = RxBool(false);
  RxList<String> image = <String>[].obs;

  void isMessageloading(bool loading) async {
    isMessage.value = loading;
  }

  void isMessageSending(bool loading) async {
    isSending.value = loading;
  }

  RxList<ViewMessageValue> messageList = <ViewMessageValue>[].obs;

  Future<bool> getMessage(
      {required int ismintId,
      required int miId,
      required int asmayId,
      required int userId,
      required String base,
      required int ivrmrtId}) async {
    try {
      MessageModel? messageModel = await getMessages(
          ismintId: ismintId,
          miId: miId,
          asmayId: asmayId,
          userId: userId,
          base: base,
          ivrmrtId: ivrmrtId);

      if (messageModel!.viewmessage != null ||
          messageModel.viewmessage!.values != null) {
        messageList.clear();
        for (var i = 0; i < messageModel.viewmessage!.values!.length; i++) {
          messageList.add(messageModel.viewmessage!.values!.elementAt(i));
        }
        return true;
      }
      return false;
    } catch (e) {
      logger.i(e.toString());
      return false;
    }
  }

  Future<bool> getFromCamera({required int miId}) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      String? imageUrl =
          await jpgToNetworkImageUrl(image: pickedFile.path, miId: miId);
      image.add(imageUrl!);
      return true;
    }
    return false;
  }

  Future<bool> getFromGallery({required int miId}) async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      String? imageUrl =
          await jpgToNetworkImageUrl(image: pickedFile.path, miId: miId);
      image.add(imageUrl!);
      return true;
    }
    return false;
  }
}
