import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:readmore/readmore.dart';

class ViewNoticeDetailsScreen extends StatelessWidget {
  final Color bgColor;
  final Color chipColor;
  const ViewNoticeDetailsScreen(
      {super.key, required this.bgColor, required this.chipColor});

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
                "02 Nov to 09 Nov",
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      TextStyle(color: chipColor),
                    ),
              ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              "Independence Day",
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16.0),
                  ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            ReadMoreText(
              "India is part of the continent of Asia. Most of India forms a peninsula, which means it is surrounded by water on three sides. The world's highest mountain range, the Himalaya, rises in the north. The southeast is bordered by the Bay of Bengal, and the southwest is bordered by the Arabian Sea. India's terrain varies widely, from the Thar Desert in the west to jungles in the northeast. A fertile area called the Ganges Plain covers much of northern India. This formation was created from soil that was deposited by rivers running from the Himalaya. In some places, this layer of silt is over 25,000 feet (7,620 meters) deep.",
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
