import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/interaction/model/inbox_model.dart';
import 'package:m_skool_flutter/interaction/screen/messaging_section.dart';

class ChatProfileTile extends StatelessWidget {
  // final bool isGroup;
  final bool isSeen;
  final Color color;
  final GetinboxmsgValue data;
  const ChatProfileTile(
      {

      // required this.isGroup,
      required this.isSeen,
      required this.color,
      required this.data,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Get.to(
        () => const MessagingScreen(),
        
      ),
      contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      leading: data.senderSenderFilePath!.isNotEmpty
          ? CircleAvatar(
              radius: 30,
              backgroundColor: color,
              backgroundImage:
                  NetworkImage(data.senderSenderFilePath.toString()),
            )
          : const CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage("assets/images/profile2.png"),
            ),
      title: Text.rich(TextSpan(
          text: "${data.sender}  |",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
          children: [
            TextSpan(
              text:
                  "  ${data.ismintComposedByFlg![0].toUpperCase()}${data.ismintComposedByFlg!.substring(1).toLowerCase()}",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 18),
            )
          ])),
      subtitle: Row(
        children: [
          Flexible(
            child: Text(
              data.ismintInteraction.toString(),
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 16),
            ),
          ),
          SvgPicture.asset(
            "assets/svg/${isSeen ? "blue_double_check.svg" : "double_check.svg"}",
            color: isSeen ? Colors.blue : Colors.grey,
          )
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text(
              convertToAgo(data.ismintDateTime!),
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 14),
            ),
          ),
          const SizedBox(height: 15),
          //double_check.svg
          //blue_double_check.svg
          //single_check.svg
          // SvgPicture.asset(
          //     "assets/svg/${isSeen ? "blue_double_check.svg" : "double_check.svg"}")
        ],
      ),
    );
  }
}
