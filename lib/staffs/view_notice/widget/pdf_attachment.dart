import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:url_launcher/url_launcher.dart';

class PdfAttachment extends StatelessWidget {
  final String attachmentUrl;
  final String attachmentName;
  const PdfAttachment({
    Key? key,
    required this.attachmentUrl,
    required this.attachmentName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
                        width: 70,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        attachmentName,
                        maxLines: 1,
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
            if (attachmentUrl.isEmpty) {
              // logger.d(values.iNTBFLFileName);
              // logger.d(values.iNTBFLFilePath);
              Fluttertoast.showToast(msg: "No File to download");
              return;
            }

            if (await canLaunchUrl(Uri.parse(attachmentUrl))) {
              await launchUrl(Uri.parse(attachmentUrl),
                  mode: LaunchMode.externalApplication);
            } else {
              Fluttertoast.showToast(
                  msg: "No External Application to handle this request");
            }
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
    );
  }
}
