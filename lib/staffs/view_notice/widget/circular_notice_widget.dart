import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/view_notice/api/view_notice_circular.dart';
import 'package:m_skool_flutter/staffs/view_notice/screens/view_notice_details.dart';
import 'package:m_skool_flutter/staffs/view_notice/widget/view_notice_item.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class CircularNoticeWidget extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const CircularNoticeWidget(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<CircularNoticeWidget> createState() => _CircularNoticeWidgetState();
}

class _CircularNoticeWidgetState extends State<CircularNoticeWidget> {
  int color = -1;
  List<int> addedColor = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ViewCircularNoticeApi.instance.getCircularNotice(
        miId: widget.loginSuccessModel.mIID!,
        userId: widget.loginSuccessModel.userId!,
        asmayId: widget.loginSuccessModel.asmaYId!,
        flag: "O",
        base: baseUrlFromInsCode(
          "portal",
          widget.mskoolController,
        ),
      ),
      builder: (_, snapshot) {
        if (snapshot.hasData && snapshot.data!.isEmpty) {
          return const AnimatedProgressWidget(
            title: "No Circular Available",
            desc:
                "Hi sir/ma'am there is not circular available for this session, you can try with other.",
            animationPath: "assets/json/nodata.json",
          );
        }

        if (snapshot.hasData) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(16.0),
            itemBuilder: (_, index) {
              color += 1;
              if (color % 6 == 0) {
                color = 0;
              }
              addedColor.add(color);
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) {
                      return ViewNoticeDetailsScreen(
                        bgColor: lighterColor.elementAt(
                          addedColor.elementAt(index),
                        ),
                        chipColor: noticeColor.elementAt(
                          addedColor.elementAt(index),
                        ),
                        values: snapshot.data!.elementAt(index),
                      );
                    }),
                  );
                },
                child: ViewNoticeItem(
                  color: color,
                  title: snapshot.data!.elementAt(index).iNTBTitle == null
                      ? "N/A"
                      : snapshot.data!.elementAt(index).iNTBTitle!,
                  date: snapshot.data!.elementAt(index).iNTBStartDate == null
                      ? "N/A"
                      : getDate(
                          DateTime.parse(
                            snapshot.data!.elementAt(index).iNTBStartDate!,
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
            itemCount: snapshot.data!.length,
          );
        }

        if (snapshot.hasError) {
          return ErrWidget(err: snapshot.error as Map<String, dynamic>);
        }

        return const AnimatedProgressWidget(
            title: "Loading Circular's",
            desc: "We are loading circular's , it will be displayed here.",
            animationPath: "assets/json/default.json");
      },
    );
  }
}
