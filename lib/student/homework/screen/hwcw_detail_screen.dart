import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/student/homework/api/upload_assignment.dart';
import 'package:m_skool_flutter/student/information/controller/upload_assignment_controller.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class HwCwDetailScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final String subject;
  final String topic;
  final String assignment;
  final String date;
  final String? endDate;
  final String? url;
  final String? attachmentType;
  final String? attachmentName;
  final String? attachmentUrl;
  final int ihcId;
  final String screenType;

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
      required this.ihcId,
      required this.screenType,
      this.endDate});

  @override
  State<HwCwDetailScreen> createState() => _HwCwDetailScreenState();
}

class _HwCwDetailScreenState extends State<HwCwDetailScreen> {
  RxList<XFile> images = RxList<XFile>();
  final ImagePicker picker = ImagePicker();
  final UploadAssignmentController assignmentController =
      Get.put<UploadAssignmentController>(UploadAssignmentController());
  @override
  Widget build(BuildContext context) {
    final DateTime dateTime = DateTime.parse(widget.date);
    DateTime? endDateTime;
    if (widget.endDate != null) {
      endDateTime = DateTime.parse(widget.endDate!);
    }
    return Scaffold(
      appBar: CustomAppBar(title: widget.subject).getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            widget.screenType == "homework"
                ? Image.asset(
                    "assets/images/hwnewbanner.png",
                    width: double.infinity,
                  )
                : Image.asset(
                    "assets/images/cwnewbanner.png",
                    width: double.infinity,
                  ),
            const SizedBox(
              height: 16.0,
            ),
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
                    widget.subject,
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
                    widget.topic,
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
                    widget.assignment,
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
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        widget.endDate != null ? "Start Date" : "Date",
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
                widget.endDate == null
                    ? const SizedBox()
                    : Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "End Date",
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
                              "${endDateTime!.day}-${endDateTime.month}-${endDateTime.year}",
                              style:
                                  Theme.of(context).textTheme.titleSmall!.merge(
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
            widget.attachmentType != null &&
                    widget.attachmentType!.toLowerCase() == "pdf"
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
                              if (widget.attachmentUrl == null ||
                                  widget.attachmentUrl!.isEmpty) {
                                return;
                              }

                              if (await canLaunchUrl(
                                  Uri.parse(widget.attachmentUrl!))) {
                                await launchUrl(
                                    Uri.parse(widget.attachmentUrl!),
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
            widget.attachmentType != null &&
                    widget.attachmentType!.toLowerCase() == "others"
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
                            ),
                            visualDensity: const VisualDensity(
                              horizontal: VisualDensity.minimumDensity,
                            ),
                            minLeadingWidth: 24,
                            title: Text(
                              widget.attachmentName!,
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
                            color: const Color(0xFFD9EDFF)),
                        child: IconButton(
                            onPressed: () async {
                              if (widget.attachmentUrl == null ||
                                  widget.attachmentUrl!.isEmpty) {
                                return;
                              }

                              if (await canLaunchUrl(
                                  Uri.parse(widget.attachmentUrl!))) {
                                await launchUrl(
                                    Uri.parse(widget.attachmentUrl!),
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
              size: Size(Get.width * 0.4, 50),
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
                      Navigator.pop(context);
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Obx(() {
                                      return assignmentController.status.value
                                                  .toLowerCase() ==
                                              "completed"
                                          ? const CircleAvatar(
                                              backgroundColor: Colors.green,
                                              radius: 36.0,
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 36,
                                              ),
                                            )
                                          : assignmentController.status.value ==
                                                  "failed"
                                              ? const CircleAvatar(
                                                  backgroundColor: Colors.red,
                                                  radius: 36.0,
                                                  child: Icon(
                                                    Icons.close,
                                                    color: Colors.white,
                                                    size: 36,
                                                  ),
                                                )
                                              : const CircularProgressIndicator();
                                    }),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Obx(() {
                                      return Text(
                                        assignmentController.status.value ==
                                                "failed"
                                            ? "Failed to Upload Data"
                                            : assignmentController
                                                        .status.value ==
                                                    "completed"
                                                ? "Successfully sent to teacher"
                                                : "Please Wait",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .merge(
                                              const TextStyle(fontSize: 20.0),
                                            ),
                                      );
                                    }),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Obx(() {
                                      return Text(
                                        assignmentController.desc.value,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      );
                                    }),
                                    const SizedBox(
                                      height: 16.0,
                                    ),
                                    Obx(() {
                                      return assignmentController.status.value
                                                      .toLowerCase() ==
                                                  "completed" ||
                                              assignmentController.status.value
                                                      .toLowerCase() ==
                                                  "failed"
                                          ? ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(
                                                      double.infinity, 50),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  )),
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Close",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .merge(
                                                      const TextStyle(
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                              ),
                                            )
                                          : const SizedBox();
                                    }),
                                  ],
                                ),
                              ),
                            );
                          });
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
      miId: widget.loginSuccessModel.mIID!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      amstId: widget.loginSuccessModel.amsTId!,
      roleId: widget.loginSuccessModel.roleId!,
      userId: widget.loginSuccessModel.userId!,
      ihwId: widget.ihcId,
      uploadArray: images.map((element) => element.path).toList(),
      base: baseUrlFromInsCode("portal", widget.mskoolController),
      uploadAssignmentController: assignmentController,
      type: widget.screenType,
    );
  }
}
