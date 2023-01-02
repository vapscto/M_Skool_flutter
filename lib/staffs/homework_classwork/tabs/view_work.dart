import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/hw_cw_view_work_item.dart';

class HwCwViewWork extends StatefulWidget {
  const HwCwViewWork({super.key});

  @override
  State<HwCwViewWork> createState() => _HwCwViewWorkState();
}

class _HwCwViewWorkState extends State<HwCwViewWork> {
  int color = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (_, index) {
        color += 1;
        if (color % 6 == 0) {
          color = 0;
        }

        return HwCwViewWorkItem(color: color);
      },
      separatorBuilder: (_, index) {
        return const SizedBox(
          height: 16.0,
        );
      },
      itemCount: 7,
    );
  }
}
