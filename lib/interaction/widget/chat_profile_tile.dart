import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:m_skool_flutter/interaction/screen/messaging_section.dart';

class ChatProfileTile extends StatelessWidget {
  final bool isGroup;
  final bool isSeen;
  final Color color;
  const ChatProfileTile(
      {required this.isGroup,
      required this.isSeen,
      required this.color,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (_) => const MessagingScreen())),
      contentPadding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: color,
        child: Center(
            child: SvgPicture.asset(
          "assets/svg/${isGroup ? "group_profile.svg" : "profile_image.svg"}",
        )),
      ),
      title: Text.rich(TextSpan(
          text: "Aditi R  |",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 18),
          children: [
            TextSpan(
                text: "  Student",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 18))
          ])),
      subtitle: Text("Hi",
          style:
              Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 17)),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text("22 min ago",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall
                  ?.copyWith(fontSize: 15)),
          const SizedBox(height: 15),

          //double_check.svg
          //blue_double_check.svg
          //single_check.svg
          SvgPicture.asset(
              "assets/svg/${isSeen ? "blue_double_check.svg" : "double_check.svg"}")
        ],
      ),
    );
  }
}
