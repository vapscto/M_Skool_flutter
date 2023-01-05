import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/view_notice/screens/circula_screen.dart';
import 'package:m_skool_flutter/staffs/view_notice/widget/filter_controller_widget.dart';
import 'package:m_skool_flutter/student/information/controller/hwcwnb_controller.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

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
            Obx(() {
              return hwCwNbController.filter.value > 0
                  ? const SizedBox(
                      child: Text("Filter Widget"),
                    )
                  : noticeType.value == "circular"
                      ? CirculaNotice(
                          loginSuccessModel: widget.loginSuccessModel,
                          mskoolController: widget.mskoolController,
                        )
                      : noticeType.value == "syllabus"
                          ? const SizedBox(child: Text("Syllabus Widget"))
                          : const SizedBox(child: Text("TT Widget"));
            }),
          ],
        ),
      ),
    );
  }

  filter() {}
}
