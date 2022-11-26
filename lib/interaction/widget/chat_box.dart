import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChatBox extends StatelessWidget {
  final String name;
  final bool isFromMe;
  final List<String> messages;
  const ChatBox(
      {required this.name,
      required this.isFromMe,
      required this.messages,
      super.key});

  @override
  Widget build(BuildContext context) {
    Radius radius = const Radius.circular(10);
    Radius zero = const Radius.circular(0);
    Widget profile = CircleAvatar(
      backgroundColor: Theme.of(context).primaryColor,
      child: Text(name[0].toUpperCase(),
          style: const TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.w400)),
    );
    return Align(
      alignment: isFromMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Row(
        mainAxisAlignment:
            isFromMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isFromMe) ...[profile, const SizedBox(width: 7)],
          Column(
            crossAxisAlignment:
                isFromMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              for (int i = 0; i < messages.length; i++)
                Stack(
                  children: [
                    Container(
                      width: messages[i].length > 18
                          ? MediaQuery.of(context).size.width / 2
                          : null,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      padding: EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                          left: 10,
                          right: isFromMe ? 25 : 10),
                      decoration: BoxDecoration(
                          color: Color(isFromMe ? 0xffC1E2FF : 0xffEEEEEE),
                          borderRadius: i == 0
                              ? BorderRadius.only(
                                  topLeft: radius,
                                  topRight: radius,
                                  bottomLeft: isFromMe ? radius : zero,
                                  bottomRight: isFromMe ? zero : radius)
                              : i == (messages.length - 1)
                                  ? BorderRadius.only(
                                      topLeft: radius,
                                      topRight: radius,
                                      bottomLeft: isFromMe ? radius : zero,
                                      bottomRight: isFromMe ? zero : radius)
                                  : BorderRadius.circular(10)),
                      child: Center(
                        child: Text(messages[i],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w400)),
                      ),
                    ),
                    if (isFromMe)
                      Positioned(
                          right: 2,
                          bottom: 2,
                          child: SvgPicture.asset(
                              "assets/svg/blue_double_check.svg"))
                  ],
                )
            ],
          ),
          if (isFromMe) ...[const SizedBox(width: 7), profile],
        ],
      ),
    );
  }
}
