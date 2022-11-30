import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/information/controller/hwcwnb_controller.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/notice/api/get_notice_api.dart';
import 'package:m_skool_flutter/notice/model/notice_data_model.dart';
import 'package:m_skool_flutter/notice/screen/notice_detail_screen.dart';
import 'package:m_skool_flutter/notice/widget/notice_filtered_widget.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class NoticeHome extends StatefulWidget {
  final bool showAppBar;
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final HwCwNbController hwCwNbController;
  const NoticeHome({
    super.key,
    required this.showAppBar,
    required this.loginSuccessModel,
    required this.mskoolController,
    required this.hwCwNbController,
  });

  @override
  State<NoticeHome> createState() => _NoticeHomeState();
}

class _NoticeHomeState extends State<NoticeHome> {
  int color = -1;
  List<Color> usedColor = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? CustomAppBar(title: "Notice".tr).getAppBar()
          : null,
      body: Obx(() {
        return widget.hwCwNbController.filter > 0
            ? NoticeFilteredWidget(
                loginSuccessModel: widget.loginSuccessModel,
                mskoolController: widget.mskoolController,
                hwCwNbController: widget.hwCwNbController)
            : FutureBuilder<List<NoticeDataModelValues>>(
                future: GetNoticeApi.instance.getNotice(
                  miId: widget.loginSuccessModel.mIID!,
                  asmayId: widget.loginSuccessModel.asmaYId!,
                  amstId: widget.loginSuccessModel.amsTId!,
                  baseUrl: baseUrlFromInsCode(
                    "portal",
                    widget.mskoolController,
                  ),
                ),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                      padding: const EdgeInsets.all(16.0),
                      itemBuilder: (_, index) {
                        color += 1;
                        if (index % 6 == 0) {
                          color = 0;
                        }
                        if (color > 6) {
                          color = 0;
                        }

                        usedColor.add(noticeColor.elementAt(color));

                        return InkWell(
                          onTap: () {
                            logger.d(color);

                            Get.to(() => NoticeDetailScreen(
                                  color: usedColor.elementAt(index),
                                  value: snapshot.data!.elementAt(index),
                                  isFiltring: false,
                                ));
                          },
                          child: NoticeItem(
                            color: color,
                            values: snapshot.data!.elementAt(index),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return const SizedBox(
                          height: 16.0,
                        );
                      },
                      itemCount: snapshot.data!.length,
                    );
                  }
                  if (snapshot.hasError) {
                    return ErrWidget(
                        err: snapshot.error as Map<String, dynamic>);
                  }
                  return const CustomPgrWidget(
                      title: "Loading Notice's",
                      desc:
                          "Don't Worry we are fetching notice's from noticeboard");
                });
      }),
    );
  }
}

class NoticeItem extends StatelessWidget {
  const NoticeItem({
    Key? key,
    required this.color,
    required this.values,
  }) : super(key: key);

  final int color;
  final NoticeDataModelValues values;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: CustomThemeData.getShadow(),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          //color: colors.elementAt(color).withOpacity(0.1),
          //boxShadow: CustomThemeData.getShadow(),
        ),
        child: Row(
          children: [
            Container(
              height: 90,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                color: noticeColor.elementAt(color).withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomLeft: Radius.circular(12.0),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "${DateTime.parse(values.intBStartDate!).day}",
                      style: Theme.of(context).textTheme.titleMedium!.merge(
                            TextStyle(
                              color: noticeColor.elementAt(color),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                    ),
                    const SizedBox(
                      height: 6.0,
                    ),
                    Text(
                      shortMonth.elementAt(
                          (DateTime.parse(values.intBStartDate!).month) - 1),
                      style: Theme.of(context).textTheme.labelMedium!.merge(
                          TextStyle(color: noticeColor.elementAt(color))),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      values.intBTitle!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16)),
                    ),
                    const SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svg/calendar.svg'),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          ''' ${getFormatedDate(DateTime.parse(values.intBStartDate!))} - ${getFormatedDate(DateTime.parse(values.intBEndDate!))} ''',
                          style: Theme.of(context).textTheme.labelSmall!.merge(
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
    );
  }
}
