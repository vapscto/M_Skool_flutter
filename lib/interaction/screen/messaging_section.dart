import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_skool_flutter/interaction/widget/custom_text_file.dart';

import '../../widget/custom_back_btn.dart';
import '../widget/chat_box.dart';

class MessagingScreen extends StatefulWidget {
  const MessagingScreen({super.key});

  @override
  State<MessagingScreen> createState() => _MessagingScreenState();
}

class _MessagingScreenState extends State<MessagingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 30,
        toolbarHeight: 65,
        title: Text("Message",
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Colors.white.withOpacity(0.8))),
        leading: const CustomGoBackButton(),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 43,
              height: 48,
              margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              decoration: BoxDecoration(
                  color: const Color(0xffD9EDFF),
                  borderRadius: BorderRadius.circular(10)),
              child: Center(
                child: SvgPicture.asset("assets/svg/download.svg"),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                child: ListView(
              children: const [
                ChatBox(
                  name: "Amar",
                  isFromMe: false,
                  messages: [
                    "Hii",
                    "Good Morning",
                    "How are you? asdasd asd asdsaasdasda ",
                    "Where are u going"
                  ],
                ),
                ChatBox(
                    name: "Udhay",
                    isFromMe: true,
                    messages: ["Hii", "Good Morning", "I’m Good"])
              ],
            )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                    child: CustomTextField(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 17),
                        controller: TextEditingController(),
                        hintText: " Text Message",
                        radius: 25,
                        suffix: Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  "assets/svg/clip.svg",
                                  width: 21,
                                  height: 21,
                                )),
                            const SizedBox(width: 17),
                            InkWell(
                                onTap: () {},
                                child: SvgPicture.asset(
                                  "assets/svg/camera.svg",
                                  width: 21,
                                  height: 21,
                                )),
                          ],
                        ))),
                const SizedBox(width: 12),
                FloatingActionButton(
                    backgroundColor: Theme.of(context).primaryColor,
                    child: SvgPicture.asset("assets/svg/send_arrow.svg"),
                    onPressed: () {})
              ],
            ),
            const SizedBox(height: 7)
          ],
        ),
      ),
    );
  }
}
