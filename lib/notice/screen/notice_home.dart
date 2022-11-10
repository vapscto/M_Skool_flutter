import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';
import 'package:m_skool_flutter/notice/screen/notice_detail_screen.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';

class NoticeHome extends StatefulWidget {
  const NoticeHome({super.key});

  @override
  State<NoticeHome> createState() => _NoticeHomeState();
}

class _NoticeHomeState extends State<NoticeHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        leading: const CustomGoBackButton(),
        title: Text("Notice".tr),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (_, index) {
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
                              const Icon(
                                Icons.date_range_outlined,
                                color: Color(0xFF35658F),
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
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0),
                      ),
                    ),
                    child: const Icon(
                      Icons.chevron_right_rounded,
                      size: 30,
                      color: Color(0xFF35658F),
                    ),
                  ),
                ],
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
