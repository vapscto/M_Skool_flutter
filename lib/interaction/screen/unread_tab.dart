import 'dart:math';
import 'package:flutter/material.dart';
import 'package:m_skool_flutter/interaction/widget/chat_profile_tile.dart';

class UnReadTabScreen extends StatelessWidget {
  const UnReadTabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (_, index) {
          return ChatProfileTile(
            isGroup: Random().nextBool(),
            isSeen: Random().nextBool(),
            color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
                Random().nextInt(255), 1),
          );
        },
        separatorBuilder: (_, index) => const Divider(thickness: 1.5),
        itemCount: 10);
  }
}
