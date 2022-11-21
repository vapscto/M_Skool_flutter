import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m_skool_flutter/homework/screen/home_work.dart';
import 'package:m_skool_flutter/homework/screen/hwcw_detail_screen.dart';

class ClassworkHome extends StatelessWidget {
  const ClassworkHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (_, index) {
          return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return HwCwDetailScreen();
                }));
              },
              child: HwCwItem());
        },
        itemCount: 5,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 12.0,
          );
        },
      ),
    );
  }
}
