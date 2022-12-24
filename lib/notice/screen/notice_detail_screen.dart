import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_skool_flutter/constants/constants.dart';

import 'package:m_skool_flutter/notice/model/notice_data_model.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeDetailScreen extends StatefulWidget {
  final Color color;
  final NoticeDataModelValues value;
  final bool isFiltring;
  final bool forSyllabus;
  const NoticeDetailScreen(
      {super.key,
      required this.color,
      required this.value,
      required this.isFiltring,
      required this.forSyllabus});

  @override
  State<NoticeDetailScreen> createState() => _NoticeDetailScreenState();
}

class _NoticeDetailScreenState extends State<NoticeDetailScreen> {
  bool showPdf = false;
  bool showPng = false;

  @override
  void initState() {
    if (widget.isFiltring) {
      if (widget.value.iNTBFLFileName != null &&
          widget.value.iNTBFLFileName!.endsWith(".pdf") &&
          widget.value.iNTBFLFileName!.isNotEmpty) {
        showPdf = true;
      } else {
        if (widget.value.iNTBFLFileName == null ||
            widget.value.iNTBFLFilePath!.isEmpty) {
          return;
        }

        showPng = true;
      }
    } else if (widget.forSyllabus) {
      if (widget.value.iNTBFLFileName != null &&
          widget.value.iNTBFLFileName!.endsWith(".pdf") &&
          widget.value.iNTBFLFileName!.isNotEmpty) {
        showPdf = true;
      } else {
        if (widget.value.iNTBFLFileName == null ||
            widget.value.iNTBFLFilePath!.isEmpty) {
          return;
        }

        showPng = true;
      }
    } else {
      if (widget.value.iNTBFLFilePath != null &&
          widget.value.iNTBFLFilePath!.endsWith("pdf") &&
          widget.value.iNTBFLFilePath!.isNotEmpty) {
        showPdf = true;
      } else {
        if (widget.value.iNTBFLFilePath == null ||
            widget.value.iNTBFLFilePath!.isEmpty) {
          return;
        }

        showPng = true;
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 30,
        title: Text(widget.value.intBTitle!),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomContainer(
                child: Image.asset('assets/images/noticenewbanner.png')),
            const SizedBox(
              height: 16.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(
                  label: Text(
                    "${getFormatedDate(DateTime.parse(widget.value.intBStartDate!))} to ${getFormatedDate(DateTime.parse(widget.value.intBEndDate!))}",
                    style: Theme.of(context).textTheme.labelMedium!.merge(
                          TextStyle(color: widget.color),
                        ),
                  ),
                  backgroundColor: widget.color.withOpacity(0.15),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  widget.value.intBTitle!,
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                      const TextStyle(
                          fontWeight: FontWeight.w500, fontSize: 17)),
                ),
                const SizedBox(
                  height: 8.0,
                ),
                ReadMoreText(
                  widget.value.intBDescription!,
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
                  height: 8.0,
                ),
                // Row(
                //   children: [
                //     Expanded(
                //       flex: 3,
                //       child: Text(
                //         "Start Date",
                //         style: Theme.of(context).textTheme.labelMedium,
                //       ),
                //     ),
                //     Text(":"),
                //     const SizedBox(
                //       width: 6.0,
                //     ),
                //     Expanded(
                //       flex: 7,
                //       child: Text(
                //         getFormatedDate(
                //             DateTime.parse(widget.value.intBStartDate!)),
                //         style:
                //             Theme.of(context).textTheme.titleSmall!.merge(
                //                   const TextStyle(
                //                     fontSize: 15.0,
                //                     fontWeight: FontWeight.normal,
                //                     color: Colors.black,
                //                   ),
                //                 ),
                //       ),
                //     ),
                //   ],
                // ),
                // const SizedBox(
                //   height: 6.0,
                // ),
                // Row(
                //   children: [
                //     Expanded(
                //       flex: 3,
                //       child: Text(
                //         "End Date",
                //         style: Theme.of(context).textTheme.labelMedium,
                //       ),
                //     ),
                //     const Text(":"),
                //     const SizedBox(
                //       width: 6.0,
                //     ),
                //     Expanded(
                //       flex: 7,
                //       child: Text(
                //         getFormatedDate(
                //             DateTime.parse(widget.value.intBEndDate!)),
                //         style:
                //             Theme.of(context).textTheme.titleSmall!.merge(
                //                   const TextStyle(
                //                     fontSize: 15.0,
                //                     fontWeight: FontWeight.normal,
                //                     color: Colors.black,
                //                   ),
                //                 ),
                //       ),
                //     )
                //   ],
                // ),
                // const SizedBox(
                //   height: 6.0,
                // ),
                // widget.value.intBFilePath == null ||
                //         widget.value.intBFilePath!.isEmpty
                //     ? const SizedBox()
                //     : Row(
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //         children: [
                //           Expanded(
                //             flex: 3,
                //             child: Text(
                //               "URL",
                //               style:
                //                   Theme.of(context).textTheme.labelMedium,
                //             ),
                //           ),
                //           const Text(":"),
                //           const SizedBox(
                //             width: 6.0,
                //           ),
                //           Expanded(
                //             flex: 7,
                //             child: InkWell(
                //               onTap: () async {
                //                 if (await canLaunchUrl(Uri.parse(
                //                     widget.value.intBFilePath!))) {
                //                   await launchUrl(
                //                       Uri.parse(widget.value.intBFilePath!),
                //                       mode: LaunchMode.externalApplication);
                //                   return;
                //                 }
                //                 Fluttertoast.showToast(
                //                     msg:
                //                         "No App found to handle this request");
                //               },
                //               child: Text(
                //                 widget.value.intBFilePath!,
                //                 maxLines: 2,
                //                 style: const TextStyle(
                //                     color: Color(0xFF35658F)),
                //               ),
                //             ),
                //           ),
                //         ],
                //       ),
                const SizedBox(
                  height: 8.0,
                ),
                // widget.value.intBAttachment != null &&
                //         widget.value.intBAttachment!.endsWith("pdf") &&
                //         widget.value.intBAttachment!.isNotEmpty

                showPdf || showPng
                    ? Column(
                        children: [
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            "Attached Files",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(
                            height: 0.0,
                          ),
                        ],
                      )
                    : Text(""),
                showPdf
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SvgPicture.asset(
                            'assets/svg/pdf.svg',
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Color(0xFFD9EDFF)),
                            child: IconButton(
                                onPressed: () async {
                                  if (widget.isFiltring) {
                                    if (widget.value.iNTBFLFilePath == null ||
                                        widget.value.iNTBFLFilePath!.isEmpty) {
                                      return;
                                    }
                                  } else if (widget.forSyllabus) {
                                    if (widget.value.iNTBFLFilePath == null ||
                                        widget.value.iNTBFLFilePath!.isEmpty) {
                                      return;
                                    }
                                  } else {
                                    if (widget.value.iNTBFLFilePath == null ||
                                        widget.value.iNTBFLFilePath!.isEmpty) {
                                      return;
                                    }
                                  }

                                  // if (widget.value.intBFilePath == null ||
                                  //     widget.value.intBFilePath!.isEmpty) {
                                  //   return;
                                  // }

                                  if (await canLaunchUrl(Uri.parse(
                                      widget.isFiltring || widget.forSyllabus
                                          ? widget.value.iNTBFLFilePath!
                                          : widget.value.iNTBFLFilePath!))) {
                                    await launchUrl(
                                        Uri.parse(widget.isFiltring ||
                                                widget.forSyllabus
                                            ? widget.value.iNTBFLFilePath!
                                            : widget.value.iNTBFLFilePath!),
                                        mode: LaunchMode.externalApplication);
                                  }
                                },
                                icon: SvgPicture.asset(
                                  'assets/svg/download.svg',
                                  color: Theme.of(context).primaryColor,
                                  height: 20.0,
                                )),
                          )
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor:
                          //         Theme.of(context).colorScheme.secondary,
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: 24, vertical: 12.0),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(30.0),
                          //     ),
                          //   ),
                          //   onPressed: () {},
                          //   child: Text(
                          //     "Download",
                          //     style: Theme.of(context).textTheme.labelSmall!.merge(
                          //           const TextStyle(
                          //             color: Color(0xFF35658F),
                          //             letterSpacing: 0.3,
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.w700,
                          //           ),
                          //         ),
                          //   ),
                          // ),
                        ],
                      )
                    : const SizedBox(),
                const SizedBox(
                  height: 16.0,
                ),
                // widget.value.intBAttachment != null &&
                //         !widget.value.intBAttachment!.endsWith("pdf") &&
                //         widget.value.intBAttachment!.isNotEmpty
                showPng
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: CustomContainer(
                              // decoration: BoxDecoration(
                              //   border: Border.all(
                              //     color: Colors.grey.shade300,
                              //   ),
                              //   borderRadius: BorderRadius.circular(16.0),
                              // ),
                              child: ListTile(
                                leading: Icon(
                                  Icons.image_outlined,
                                  color: Theme.of(context).primaryColor,
                                  size: 30.0,
                                ),
                                visualDensity: const VisualDensity(
                                  horizontal: VisualDensity.minimumDensity,
                                ),
                                minLeadingWidth: 24,
                                title: Text(
                                  widget.isFiltring
                                      ? widget.value.iNTBFLFileName!
                                      : widget.forSyllabus
                                          ? widget.value.iNTBFLFileName!
                                          : widget.value.iNTBFLFileName!,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 36.0,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Color(0xFFD9EDFF)),
                            child: IconButton(
                                onPressed: () async {
                                  if (widget.value.iNTBFLFilePath == null ||
                                      widget.value.iNTBFLFilePath!.isEmpty) {
                                    return;
                                  }
                                  // } else if (widget.forSyllabus) {
                                  //   if (widget.value.iNTBFLFilePath == null ||
                                  //       widget.value.iNTBFLFilePath!.isEmpty) {
                                  //     return;
                                  //   }
                                  // } else {
                                  //   if (widget.value.intBFilePath == null ||
                                  //       widget.value.intBFilePath!.isEmpty) {
                                  //     return;
                                  //   }
                                  // }

                                  if (await canLaunchUrl(Uri.parse(
                                      // widget.isFiltring || widget.forSyllabus
                                      widget.value
                                          .iNTBFLFilePath! /*  : widget.value.intBFilePath!*/))) {
                                    await launchUrl(
                                        Uri.parse(widget.value.iNTBFLFilePath!),
                                        mode: LaunchMode.externalApplication);
                                  }
                                },
                                icon: SvgPicture.asset(
                                  'assets/svg/download.svg',
                                  color: Theme.of(context).primaryColor,
                                  height: 20.0,
                                )),
                          )
                          // ElevatedButton(
                          //   style: ElevatedButton.styleFrom(
                          //     backgroundColor:
                          //         Theme.of(context).colorScheme.secondary,
                          //     padding: const EdgeInsets.symmetric(
                          //         horizontal: 24, vertical: 12.0),
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(30.0),
                          //     ),
                          //   ),
                          //   onPressed: () {},
                          //   child: Text(
                          //     "Download",
                          //     style: Theme.of(context).textTheme.labelSmall!.merge(
                          //           const TextStyle(
                          //             color: Color(0xFF35658F),
                          //             letterSpacing: 0.3,
                          //             fontSize: 16,
                          //             fontWeight: FontWeight.w700,
                          //           ),
                          //         ),
                          //   ),
                          // ),
                        ],
                      )
                    : const SizedBox(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
