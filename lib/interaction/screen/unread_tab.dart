import 'dart:math';
import 'package:flutter/material.dart';
import 'package:m_skool_flutter/interaction/widget/chat_profile_tile.dart';

import '../../main.dart';

class UnReadTabScreen extends StatefulWidget {
  const UnReadTabScreen({super.key});

  @override
  State<UnReadTabScreen> createState() => _UnReadTabScreenState();
}

class _UnReadTabScreenState extends State<UnReadTabScreen> {
  @override
  void initState() {
    super.initState();
  }

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
