import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:m_skool_flutter/library/widget/library_item_widget.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class LibraryHome extends StatelessWidget {
  const LibraryHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Library".tr).getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            LibraryItemWidget(),
          ],
        ),
      ),
    );
  }
}

class LibraryStatusDate extends StatelessWidget {
  final Color color;
  final String title;
  final String date;
  const LibraryStatusDate({
    Key? key,
    required this.color,
    required this.title,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (Get.size.width * 0.5) - 48,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: color,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(date)
        ],
      ),
    );
  }
}
