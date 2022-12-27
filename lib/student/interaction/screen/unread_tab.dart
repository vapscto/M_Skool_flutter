import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/student/interaction/widget/chat_profile_tile.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import '../controller/inbox_tab_controller.dart';

class UnReadTabScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const UnReadTabScreen(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<UnReadTabScreen> createState() => _UnReadTabScreenState();
}

class _UnReadTabScreenState extends State<UnReadTabScreen> {
  final InboxController inboxController = Get.put(InboxController());
  void loadingUnread() async {
    inboxController.isUnreadloading(true);
    await Future.delayed(const Duration(seconds: 2));
    inboxController.isUnreadloading(false);
  }

  @override
  void initState() {
    loadingUnread();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => inboxController.isUnreadLoading.value
          ? const Center(
              child: AnimatedProgressWidget(
                title: "Loading Unread",
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
              separatorBuilder: (_, index) => const Divider(thickness: 1.5),
              itemCount: inboxController.inboxList.length),
    );
  }
}
