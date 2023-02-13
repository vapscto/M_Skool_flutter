import 'package:flutter/material.dart';

import 'package:m_skool_flutter/constants/constants.dart';

import 'package:m_skool_flutter/notice/model/notice_data_model.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/api/get_attachment_api.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/model/nb_attachment_model.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/widget/hw_cw_content_item.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class NoticeDetailScreen extends StatefulWidget {
  final Color color;
  final NoticeDataModelValues value;
  final bool isFiltring;
  final bool forSyllabus;
  final String base;
  const NoticeDetailScreen(
      {super.key,
      required this.color,
      required this.value,
      required this.isFiltring,
      required this.forSyllabus,
      required this.base});

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
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset('assets/images/noticenewbanner.png'))),
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
                  widget.value.intBDescription ?? "N/A",
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

                // showPdf || showPng
                //     ? Column(
                //         children: [
                //           const SizedBox(
                //             height: 16.0,
                //           ),
                //           Text(
                //             "Attached Files",
                //             style: Theme.of(context).textTheme.titleMedium,
                //           ),
                //           const SizedBox(
                //             height: 0.0,
                //           ),
                //         ],
                //       )
                //     : const Text(""),
                // showPdf
                //     ? Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           SvgPicture.asset(
                //             'assets/svg/pdf.svg',
                //           ),
                //           Container(
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(12.0),
                //                 color: const Color(0xFFD9EDFF)),
                //             child: IconButton(
                //                 onPressed: () async {
                //                   if (widget.isFiltring) {
                //                     if (widget.value.iNTBFLFilePath == null ||
                //                         widget.value.iNTBFLFilePath!.isEmpty) {
                //                       return;
                //                     }
                //                   } else if (widget.forSyllabus) {
                //                     if (widget.value.iNTBFLFilePath == null ||
                //                         widget.value.iNTBFLFilePath!.isEmpty) {
                //                       return;
                //                     }
                //                   } else {
                //                     if (widget.value.iNTBFLFilePath == null ||
                //                         widget.value.iNTBFLFilePath!.isEmpty) {
                //                       return;
                //                     }
                //                   }

                //                   // if (widget.value.intBFilePath == null ||
                //                   //     widget.value.intBFilePath!.isEmpty) {
                //                   //   return;
                //                   // }

                //                   if (await canLaunchUrl(Uri.parse(
                //                       widget.isFiltring || widget.forSyllabus
                //                           ? widget.value.iNTBFLFilePath!
                //                           : widget.value.iNTBFLFilePath!))) {
                //                     await launchUrl(
                //                         Uri.parse(widget.isFiltring ||
                //                                 widget.forSyllabus
                //                             ? widget.value.iNTBFLFilePath!
                //                             : widget.value.iNTBFLFilePath!),
                //                         mode: LaunchMode.externalApplication);
                //                   }
                //                 },
                //                 icon: SvgPicture.asset(
                //                   'assets/svg/download.svg',
                //                   color: Theme.of(context).primaryColor,
                //                   height: 20.0,
                //                 )),
                //           )
                //           // ElevatedButton(
                //           //   style: ElevatedButton.styleFrom(
                //           //     backgroundColor:
                //           //         Theme.of(context).colorScheme.secondary,
                //           //     padding: const EdgeInsets.symmetric(
                //           //         horizontal: 24, vertical: 12.0),
                //           //     shape: RoundedRectangleBorder(
                //           //       borderRadius: BorderRadius.circular(30.0),
                //           //     ),
                //           //   ),
                //           //   onPressed: () {},
                //           //   child: Text(
                //           //     "Download",
                //           //     style: Theme.of(context).textTheme.labelSmall!.merge(
                //           //           const TextStyle(
                //           //             color: Color(0xFF35658F),
                //           //             letterSpacing: 0.3,
                //           //             fontSize: 16,
                //           //             fontWeight: FontWeight.w700,
                //           //           ),
                //           //         ),
                //           //   ),
                //           // ),
                //         ],
                //       )
                //     : const SizedBox(),
                // const SizedBox(
                //   height: 16.0,
                // ),
                // // widget.value.intBAttachment != null &&
                // //         !widget.value.intBAttachment!.endsWith("pdf") &&
                // //         widget.value.intBAttachment!.isNotEmpty
                // showPng
                //     ? Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //         children: [
                //           Expanded(
                //             child: CustomContainer(
                //               // decoration: BoxDecoration(
                //               //   border: Border.all(
                //               //     color: Colors.grey.shade300,
                //               //   ),
                //               //   borderRadius: BorderRadius.circular(16.0),
                //               // ),
                //               child: ListTile(
                //                 leading: Icon(
                //                   Icons.image_outlined,
                //                   color: Theme.of(context).primaryColor,
                //                   size: 30.0,
                //                 ),
                //                 visualDensity: const VisualDensity(
                //                   horizontal: VisualDensity.minimumDensity,
                //                 ),
                //                 minLeadingWidth: 24,
                //                 title: Text(
                //                   widget.isFiltring
                //                       ? widget.value.iNTBFLFileName!
                //                       : widget.forSyllabus
                //                           ? widget.value.iNTBFLFileName!
                //                           : widget.value.iNTBFLFileName!,
                //                   style: Theme.of(context).textTheme.titleSmall,
                //                 ),
                //               ),
                //             ),
                //           ),
                //           const SizedBox(
                //             width: 36.0,
                //           ),
                //           Container(
                //             decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(12.0),
                //                 color: const Color(0xFFD9EDFF)),
                //             child: IconButton(
                //                 onPressed: () async {
                //                   if (widget.value.iNTBFLFilePath == null ||
                //                       widget.value.iNTBFLFilePath!.isEmpty) {
                //                     return;
                //                   }
                //                   // } else if (widget.forSyllabus) {
                //                   //   if (widget.value.iNTBFLFilePath == null ||
                //                   //       widget.value.iNTBFLFilePath!.isEmpty) {
                //                   //     return;
                //                   //   }
                //                   // } else {
                //                   //   if (widget.value.intBFilePath == null ||
                //                   //       widget.value.intBFilePath!.isEmpty) {
                //                   //     return;
                //                   //   }
                //                   // }

                //                   if (await canLaunchUrl(Uri.parse(
                //                       // widget.isFiltring || widget.forSyllabus
                //                       widget.value
                //                           .iNTBFLFilePath! /*  : widget.value.intBFilePath!*/))) {
                //                     await launchUrl(
                //                         Uri.parse(widget.value.iNTBFLFilePath!),
                //                         mode: LaunchMode.externalApplication);
                //                   }
                //                 },
                //                 icon: SvgPicture.asset(
                //                   'assets/svg/download.svg',
                //                   color: Theme.of(context).primaryColor,
                //                   height: 20.0,
                //                 )),
                //           )
                //           // ElevatedButton(
                //           //   style: ElevatedButton.styleFrom(
                //           //     backgroundColor:
                //           //         Theme.of(context).colorScheme.secondary,
                //           //     padding: const EdgeInsets.symmetric(
                //           //         horizontal: 24, vertical: 12.0),
                //           //     shape: RoundedRectangleBorder(
                //           //       borderRadius: BorderRadius.circular(30.0),
                //           //     ),
                //           //   ),
                //           //   onPressed: () {},
                //           //   child: Text(
                //           //     "Download",
                //           //     style: Theme.of(context).textTheme.labelSmall!.merge(
                //           //           const TextStyle(
                //           //             color: Color(0xFF35658F),
                //           //             letterSpacing: 0.3,
                //           //             fontSize: 16,
                //           //             fontWeight: FontWeight.w700,
                //           //           ),
                //           //         ),
                //           //   ),
                //           // ),
                //         ],
                //       )
                //     : const SizedBox(),

                Row(
                  children: [
                    Expanded(
                      flex: 7,
                      child: InkWell(
                        onTap: () {
                          showDialog(
                              context: context,
                              builder: (_) {
                                return Dialog(
                                  insetPadding: const EdgeInsets.all(16.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(12.0)),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0, vertical: 16.0),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Attachment's",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .merge(
                                                    const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 18.0),
                                                  ),
                                            ),
                                            IconButton(
                                                padding:
                                                    const EdgeInsets.all(0),
                                                visualDensity:
                                                    const VisualDensity(
                                                        horizontal:
                                                            VisualDensity
                                                                .minimumDensity,
                                                        vertical: VisualDensity
                                                            .minimumDensity),
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                icon: const Icon(
                                                  Icons.close,
                                                  color: Colors.white,
                                                ))
                                          ],
                                        ),
                                      ),
                                      FutureBuilder<
                                              List<NBAttachmentModelValues>>(
                                          future: GetNbAttachmentApi.instance
                                              .getNbAtt(
                                            intbId: widget.value.intBId!,
                                            base: widget.base,
                                          ),
                                          builder: (_, snapshot) {
                                            if (snapshot.hasData) {
                                              if (snapshot.data!.isEmpty) {
                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: const [
                                                    AnimatedProgressWidget(
                                                      title:
                                                          "No Attachment Found",
                                                      desc:
                                                          "For this particular notice there is no attachment",
                                                      animationPath:
                                                          "assets/json/nodata.json",
                                                      animatorHeight: 250,
                                                    ),
                                                  ],
                                                );
                                              }
                                              return ListView.separated(
                                                  padding: const EdgeInsets.all(
                                                      12.0),
                                                  shrinkWrap: true,
                                                  itemBuilder: (_, index) {
                                                    return HwCwUploadedContentItem(
                                                      onDownloadClicked:
                                                          () async {
                                                        if (await canLaunchUrl(
                                                            Uri.parse(snapshot
                                                                .data!
                                                                .elementAt(
                                                                    index)
                                                                .intbfLFilePath!))) {
                                                          await launchUrl(
                                                              Uri.parse(snapshot
                                                                  .data!
                                                                  .elementAt(
                                                                      index)
                                                                  .intbfLFilePath!),
                                                              mode: LaunchMode
                                                                  .externalApplication);
                                                        }
                                                      },
                                                      title: snapshot.data!
                                                          .elementAt(index)
                                                          .intbfLFileName!,
                                                      isPdf: snapshot.data!
                                                          .elementAt(index)
                                                          .intbfLFileName!
                                                          .endsWith(".pdf"),
                                                      onViewClicked: () {
                                                        Navigator.pop(context);
                                                      },
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (context, index) {
                                                    return const SizedBox(
                                                      height: 12.0,
                                                    );
                                                  },
                                                  itemCount:
                                                      snapshot.data!.length);
                                            }
                                            if (snapshot.hasError) {
                                              return ErrWidget(
                                                  err: snapshot.error
                                                      as Map<String, dynamic>);
                                            }
                                            return Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: const [
                                                AnimatedProgressWidget(
                                                  title: "Loading Attachment",
                                                  desc:
                                                      "We are loading attachment for this particular notice",
                                                  animationPath:
                                                      "assets/json/default.json",
                                                ),
                                              ],
                                            );
                                          }),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: CustomContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.attachment,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                const Expanded(
                                  child: Text("View Attachment"),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Expanded(flex: 3, child: SizedBox())
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
