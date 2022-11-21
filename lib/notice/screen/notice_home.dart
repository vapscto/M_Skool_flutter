import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/notice/screen/notice_detail_screen.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';

class NoticeHome extends StatefulWidget {
  final bool showAppBar;
  const NoticeHome({super.key, required this.showAppBar});

  @override
  State<NoticeHome> createState() => _NoticeHomeState();
}

class _NoticeHomeState extends State<NoticeHome> {
  int color = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? CustomAppBar(title: "Notice".tr).getAppBar()
          : null,
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (_, index) {
          color += 1;
          if (index % 6 == 0) {
            color = 0;
          }
          return InkWell(
            onTap: () {
              Get.to(() => const NoticeDetailScreen());
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                color: Theme.of(context).scaffoldBackgroundColor,
                boxShadow: CustomThemeData.getShadow(),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: colors.elementAt(color).withOpacity(0.1),
                  //boxShadow: CustomThemeData.getShadow(),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "First term exam",
                              style: Theme.of(context).textTheme.subtitle1,
                            ),
                            const SizedBox(
                              height: 6.0,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.date_range_outlined,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  "02 Nov - 09 Nov",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall!
                                      .merge(
                                        const TextStyle(
                                            letterSpacing: 0.3, fontSize: 15.0),
                                      ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: const EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.chevron_right_rounded,
                        size: 30,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (_, index) {
          return const SizedBox(
            height: 16.0,
          );
        },
        itemCount: 10,
      ),
    );
  }
}
