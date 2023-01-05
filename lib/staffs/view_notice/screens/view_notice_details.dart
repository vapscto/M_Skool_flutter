import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/staffs/view_notice/model/view_notice_model.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:readmore/readmore.dart';

class ViewNoticeDetailsScreen extends StatelessWidget {
  final Color bgColor;
  final Color chipColor;
  final ViewNoticeModelValues values;
  const ViewNoticeDetailsScreen(
      {super.key,
      required this.bgColor,
      required this.chipColor,
      required this.values});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "View Notice").getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset("assets/images/hwnewbanner.png"),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Chip(
              backgroundColor: bgColor,
              label: Text(
                "${getFormatedDate(DateTime.parse(values.iNTBStartDate!))} to ${getFormatedDate(DateTime.parse(values.iNTBEndDate!))}",
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      TextStyle(color: chipColor),
                    ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              "${values.iNTBTitle}",
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16.0),
                  ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            ReadMoreText(
              "${values.iNTBDescription}",
              style: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.3,
                      height: 1.2,
                      //color: Color(0xFF1A1A1A),
                    ),
                  ),
              trimExpandedText: " Read Less",
              trimCollapsedText: "Read More",
              moreStyle: const TextStyle(color: Color(0xFFF97A33)),
              lessStyle: const TextStyle(color: Color(0xFFF97A33)),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: CustomContainer(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                "assets/svg/pdf.svg",
                                width: 80,
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Text(
                                "Circular.pdf",
                                style: Theme.of(context).textTheme.titleSmall,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width * 0.1,
                ),
                InkWell(
                  onTap: () async {
                    // if (values.iNTBFLFileName == null ||
                    //     values.iNTBFLFilePath == null) {
                    //   // logger.d(values.iNTBFLFileName);
                    //   // logger.d(values.iNTBFLFilePath);
                    //   Fluttertoast.showToast(msg: "No File to download");
                    //   return;
                    // }

                    // if (await canLaunchUrl(Uri.parse(values.iNTBFLFilePath!))) {
                    //   await launchUrl(Uri.parse(values.iNTBFLFilePath!),
                    //       mode: LaunchMode.externalApplication);
                    // } else {
                    //   Fluttertoast.showToast(
                    //       msg:
                    //           "No External Application to handle this request");
                    // }
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 16.0),
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: const Color(0xFFD9EDFF)),
                    child: SvgPicture.asset(
                      "assets/svg/download.svg",
                      height: 24.0,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
