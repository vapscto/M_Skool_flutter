import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/widget/view_notice_card.dart';

class ViewNoticeTabScreen extends StatefulWidget {
  const ViewNoticeTabScreen({super.key});

  @override
  State<ViewNoticeTabScreen> createState() => _ViewNoticeTabScreenState();
}

class _ViewNoticeTabScreenState extends State<ViewNoticeTabScreen> {
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

        return ViewNoticeCard(color: color);
      },
      separatorBuilder: (_, index) {
        return const SizedBox(
          height: 16.0,
        );
      },
      itemCount: 1,
    );
  }
}
