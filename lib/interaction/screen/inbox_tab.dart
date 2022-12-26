import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/interaction/controller/inbox_tab_controller.dart';
import 'package:m_skool_flutter/interaction/widget/chat_profile_tile.dart';

import '../../controller/global_utilities.dart';
import '../../controller/mskoll_controller.dart';
import '../../model/login_success_model.dart';
import '../../widget/animated_progress_widget.dart';

class InboxTabScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const InboxTabScreen(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<InboxTabScreen> createState() => _InboxTabScreenState();
}

class _InboxTabScreenState extends State<InboxTabScreen> {
  final InboxController inboxController = Get.put(InboxController());
  Future<void> getInboxListData() async {
    inboxController.isInboxloading(true);
    await inboxController.getInboxList(
      miId: widget.loginSuccessModel.mIID!,
      amstId: widget.loginSuccessModel.amsTId!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      userId: widget.loginSuccessModel.userId!,
      base: baseUrlFromInsCode(
        'portal',
        widget.mskoolController,
      ),
    );
    inboxController.isInboxloading(false);
  }

  @override
  void initState() {
    getInboxListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => inboxController.isInboxLoading.value
          ? const Center(
              child: AnimatedProgressWidget(
                title: "Loading Inbox",
                desc: "Please wait while we generate a view for you..",
                animationPath: "assets/json/interaction.json",
              ),
            )
          : ListView.separated(
              itemBuilder: (_, index) {
                return ChatProfileTile(
                  loginSuccessModel: widget.loginSuccessModel,
                  mskoolController: widget.mskoolController,
                  data: inboxController.inboxList[index],
                  // isGroup: Random().nextBool(),
                  isSeen: Random().nextBool(),
                  color: Color.fromRGBO(Random().nextInt(255),
                      Random().nextInt(255), Random().nextInt(255), 1),
                );
              },
              separatorBuilder: (_, index) => const Divider(),
              itemCount: inboxController.inboxList.length),
    );
  }
}
