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
            child: Image.asset(
          "assets/images/${isGroup ? "profile1.png" : "profile2.png"}",
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
      subtitle: Row(
        children: [
          Text(
            "Hi",
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontSize: 17),
          ),
          SvgPicture.asset(
              "assets/svg/${isSeen ? "blue_double_check.svg" : "double_check.svg"}")
        ],
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: Text("22 min ago",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(fontSize: 15)),
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
