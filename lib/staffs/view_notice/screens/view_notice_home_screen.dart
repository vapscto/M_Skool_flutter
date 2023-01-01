import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/view_notice/screens/view_notice_details.dart';
import 'package:m_skool_flutter/staffs/view_notice/widget/filter_controller_widget.dart';
import 'package:m_skool_flutter/student/information/controller/hwcwnb_controller.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

import '../widget/filter_notice_by_type.dart';

class ViewNoticeHome extends StatefulWidget {
  final String title;
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ViewNoticeHome({
    super.key,
    required this.title,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<ViewNoticeHome> createState() => _ViewNoticeHomeState();
}

class _ViewNoticeHomeState extends State<ViewNoticeHome> {
  final ScrollController scrollController = ScrollController();
  RxBool showFilter = RxBool(false);
  RxString noticeType = RxString("circular");
  final HwCwNbController hwCwNbController = Get.put(HwCwNbController());
  int color = -1;
  final List<Color> usedBgColor = [];
  final List<Color> usedChipColor = [];

  final List<String> sessions = [
    "2023",
    "2022",
    "2021",
  ];

  String selectedValue = "2023";

  @override
  void dispose() {
    Get.delete<HwCwNbController>();
    usedBgColor.clear();
    usedChipColor.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        action: [
          IconButton(
            onPressed: () {
              if (scrollController.offset > 0 && showFilter.value) {
                scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 800),
                    curve: Curves.fastOutSlowIn);
                return;
              }

              if (showFilter.value) {
                showFilter.value = false;
              } else {
                showFilter.value = true;
              }

              // setState(() {});

              scrollController.animateTo(0,
                  duration: const Duration(milliseconds: 800),
                  curve: Curves.fastOutSlowIn);
            },
            icon: SvgPicture.asset('assets/svg/filter.svg'),
          ),
        ],
      ).getAppBar(),
      body: SingleChildScrollView(
        controller: scrollController,
        child: Column(
          children: [
            Obx(() {
              return showFilter.value == false
                  ? const SizedBox()
                  : FilterControllerWidget(
                      hwCwNbController: hwCwNbController,
                      showFilter: showFilter,
                    );
            }),
            const SizedBox(
              height: 12.0,
            ),
            Obx(() {
              return hwCwNbController.filter.value == 0
                  ? NoticeFilterByType(noticeType: noticeType)
                  : const SizedBox();
            }),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: CustomContainer(
                child: DropdownButtonFormField(
                    value: selectedValue,
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(fontSize: 16.0),
                        ),
                    decoration: InputDecoration(
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      label: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFDFFBFE),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 6.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              "assets/images/cap.png",
                              height: 24.0,
                            ),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              " Academic Year ",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .merge(
                                    const TextStyle(
                                        backgroundColor: Color(0xFFDFFBFE),
                                        fontSize: 20.0,
                                        color: Color(0xFF28B6C8)),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      border: const OutlineInputBorder(),
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.only(top: 4.5),
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        size: 30,
                      ),
                    ),
                    items: sessions
                        .map((e) => DropdownMenuItem(
                            value: e,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8, left: 5),
                              child: Text(e),
                            )))
                        .toList(),
                    onChanged: (e) {
                      selectedValue = e!;
                    }),
              ),
            ),
            ListView.separated(
                padding: const EdgeInsets.all(16.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  color += 1;
                  if (color % 6 == 0) {
                    color = 0;
                  }
                  usedBgColor.add(noticeBackgroundColor.elementAt(color));
                  usedChipColor.add(noticeColor.elementAt(color));
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return ViewNoticeDetailsScreen(
                          chipColor: usedChipColor.elementAt(index),
                          bgColor: usedBgColor.elementAt(index),
                        );
                      }));
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      width: double.infinity,
                      //height: 150,
                      decoration: BoxDecoration(
                        color: lighterColor.elementAt(color),
                        // boxShadow: CustomThemeData.getShadow(),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Chip(
                                  backgroundColor: noticeColor.elementAt(color),
                                  label: Text(
                                    "Assignment",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .merge(
                                          const TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                  ),
                                ),
                                // const SizedBox(
                                //   height: 12.0,
                                // ),
                                Text(
                                  "Date : 24-11-2022",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const SizedBox(
                                  height: 12.0,
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.chevron_right_rounded),
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
                itemCount: 10)
          ],
        ),
      ),
    );
  }

  filter() {}
}
