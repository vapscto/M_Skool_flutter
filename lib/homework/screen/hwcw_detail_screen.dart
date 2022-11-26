import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/homework/api/upload_assignment.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class HwCwDetailScreen extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final String subject;
  final String topic;
  final String assignment;
  final String date;
  final String? url;
  final String? attachmentType;
  final String? attachmentName;
  final String? attachmentUrl;
  final int ihcId;

  const HwCwDetailScreen(
      {super.key,
      required this.subject,
      required this.topic,
      required this.assignment,
      required this.date,
      this.url,
      this.attachmentType,
      this.attachmentName,
      this.attachmentUrl,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.ihcId});

  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.parse(date);
    RxList<XFile> images = RxList<XFile>();
    final ImagePicker picker = ImagePicker();
    return Scaffold(
      appBar: CustomAppBar(title: subject).getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Subject",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Text(":"),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    subject,
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Topic",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Text(":"),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    topic,
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Assignment",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Text(":"),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    assignment,
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    "Date",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
                const Text(":"),
                const SizedBox(
                  width: 24.0,
                ),
                Expanded(
                  flex: 7,
                  child: Text(
                    "${dateTime.day}-${dateTime.month}-${dateTime.year}",
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8.0,
            ),
            // Row(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     Expanded(
            //       flex: 3,
            //       child: Text(
            //         "URL",
            //         style: Theme.of(context).textTheme.labelMedium,
            //       ),
            //     ),
            //     const Text(":"),
            //     const SizedBox(
            //       width: 24.0,
            //     ),
            //     Expanded(
            //       flex: 7,
            //       child: Text(
            //         "https://www.google.com/search?q=elon+musk&rlz=1C1RXQR_enIN1024IN1024&oq=Elon",
            //         maxLines: 2,
            //         style: TextStyle(color: Theme.of(context).primaryColor),
            //       ),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 24.0,
            ),
            attachmentType != null && attachmentType!.toLowerCase() == "pdf"
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset('assets/svg/pdf.svg'),
                      const SizedBox(
                        width: 36.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xFFD9EDFF)),
                        child: IconButton(
                            onPressed: () async {
                              if (attachmentUrl == null ||
                                  attachmentUrl!.isEmpty) {
                                return;
                              }

                              if (await canLaunchUrl(
                                  Uri.parse(attachmentUrl!))) {
                                await launchUrl(Uri.parse(attachmentUrl!),
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
            attachmentType != null && attachmentType!.toLowerCase() == "others"
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey.shade300,
                            ),
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ListTile(
                            leading: Icon(
                              Icons.image_outlined,
                              color: Theme.of(context).primaryColor,
                            ),
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                            ),
                            minLeadingWidth: 24,
                            title: Text(attachmentName!),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 36.0,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: const Color(0xFFD9EDFF)),
                        child: IconButton(
                            onPressed: () async {
                              if (attachmentUrl == null ||
                                  attachmentUrl!.isEmpty) {
                                return;
                              }

                              if (await canLaunchUrl(
                                  Uri.parse(attachmentUrl!))) {
                                await launchUrl(Uri.parse(attachmentUrl!),
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
            SizedBox(
              height: Get.height * 0.2,
            ),
            MSkollBtn(
              title: "Upload",
              onPress: () {
                images.clear();
                showModalBottomSheet(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0),
                      ),
                    ),
                    context: context,
                    builder: (_) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    padding: const EdgeInsets.all(16.0)),
                                onPressed: () async {
                                  final XFile? file = await picker.pickImage(
                                      source: ImageSource.camera);
                                  if (file == null) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "You didn't selected or captured any assignment");
                                    return;
                                  }
                                  images.add(file);
                                  Navigator.pop(context);
                                  showAssignments(context, images);
                                },
                                icon: const Icon(
                                  Icons.camera_alt_outlined,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Camera",
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
                            ),
                            const SizedBox(
                              width: 16.0,
                            ),
                            Expanded(
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    padding: const EdgeInsets.all(16.0)),
                                onPressed: () async {
                                  final List<XFile> file =
                                      await picker.pickMultiImage();
                                  if (file == null) {
                                    Fluttertoast.showToast(
                                        msg:
                                            "You didn't selected or captured any assignment");
                                    return;
                                  }

                                  images.addAll(file);
                                  Navigator.pop(context);
                                  showAssignments(context, images);
                                },
                                icon: const Icon(
                                  Icons.image_outlined,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Gallery",
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
                            )
                          ],
                        ),
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }

  void showAssignments(BuildContext context, RxList<XFile> images) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Selected Assignments",
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      const TextStyle(fontSize: 20.0),
                    ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Obx(() {
                return SizedBox(
                  height: 100,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        return Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16.0),
                            color: Colors.grey.shade100,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: FileImage(
                                File(images.elementAt(index).path),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) => const SizedBox(
                            width: 16.0,
                          ),
                      itemCount: images.length),
                );
              }),
              const SizedBox(
                height: 24.0,
              ),
              Center(
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(Get.width * 0.4, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    onPressed: () {
                      uploadAssignment(images);
                    },
                    child: Text(
                      "Upload Assignment",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                            const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                    )),
              ),
            ],
          ),
        );
      },
    );
  }

  void uploadAssignment(RxList<XFile> images) async {
    await UploadAssignmentApi.instance.uploadNow(
        miId: loginSuccessModel.mIID!,
        asmayId: loginSuccessModel.asmaYId!,
        amstId: loginSuccessModel.amsTId!,
        roleId: loginSuccessModel.roleId!,
        userId: loginSuccessModel.userId!,
        ihwId: ihcId,
        uploadArray: images.map((element) => element.path).toList(),
        base: baseUrlFromInsCode("portal", mskoolController));
  }
}
