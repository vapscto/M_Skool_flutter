import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/student/interaction/screen/messaging_section.dart';

class ChatProfileTile extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final String profileimage;
  final String title;
  final String designation;
  final String ismintSubject;
  final DateTime ismintDateTime;
  final int ismintId;
  final int istintId;
  final int ismintComposeById;
  final String role;
  final int userHrmeId;
  final String sender;
  final String receiver;
  // final bool isGroup;
  bool? isSeen;
  // final Color color;
  // final GetinboxmsgValue data;
  ChatProfileTile(
      {required this.loginSuccessModel,
      required this.mskoolController,
      required this.profileimage,
      required this.title,
      required this.designation,
      required this.ismintSubject,
      required this.ismintDateTime,
      required this.ismintId,
      required this.istintId,
      required this.ismintComposeById,
      required this.role,
      required this.userHrmeId,
      required this.sender,
      required this.receiver,
      // required this.isGroup,
      this.isSeen,
      // required this.color,
      // required this.data,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListTile(
        dense: true,
        onTap: () => Get.to(
          () => MessagingScreen(
            ismintId: ismintId,
            istintId: istintId,
            ismintComposedById: ismintComposeById,
            loginSuccessModel: loginSuccessModel,
            mskoolController: mskoolController,
            hrmeId: userHrmeId,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
        leading:
            // data.profileimage!.isNotEmpty
            //     ?
            CircleAvatar(
          radius: 30,
          // backgroundColor: color,
          backgroundImage: profileimage.isNotEmpty
              ? NetworkImage(profileimage.toString())
              : const NetworkImage(
                  "https://img.icons8.com/fluency/48/null/user-male-circle.png"),
        ),
        title: Text.rich(
            overflow: TextOverflow.ellipsis,
            TextSpan(
                text: "$title  |",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 18),
                children: [
                  TextSpan(
                    text:
                        "  ${designation[0].toUpperCase()}${designation.substring(1).toLowerCase()}",
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall
                        ?.copyWith(fontSize: 18),
                  )
                ])),
        subtitle: Row(
          children: [
            Flexible(
              child: SizedBox(
                width: 50,
                child: Text(
                  ismintSubject.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            if (isSeen!)
              const Icon(
                Icons.circle,
                size: 8,
                color: Colors.blue,
              ),
            // SvgPicture.asset(
            //   "assets/svg/double_check.svg",
            //   color: isSeen ? Colors.blue : Colors.grey,
            // )
          ],
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Text(
                convertToAgo(ismintDateTime),
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 14),
              ),
            ),
            const SizedBox(height: 10),
            ismintComposeById == userHrmeId
                ? Text(
                    'To : $receiver',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 12),
                  )
                : Text(
                    'From : $sender',
                    style: Theme.of(context)
                        .textTheme
                        .displaySmall!
                        .copyWith(fontSize: 12),
                  ),

            //double_check.svg
            //blue_double_check.svg
            //single_check.svg
            // SvgPicture.asset(
            //     "assets/svg/${isSeen ? "blue_double_check.svg" : "double_check.svg"}")
          ],
        ),
      ),
    );
  }
}
