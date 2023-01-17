import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/api/get_cw_api.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/api/get_hw_api.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/controller/pick_image_controller.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/model/verify_cw_model.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/model/verify_hw_model.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/widget/verify_item.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class VerifyHwCwViewDetails extends StatefulWidget {
  final String title;
  final bool forHw;
  final MskoolController mskoolController;
  final LoginSuccessModel loginSuccessModel;
  final int asmayId;
  final int asmclId;
  final int asmsId;
  final int ismsId;
  final String fromDate;
  final String toDate;
  const VerifyHwCwViewDetails(
      {super.key,
      required this.title,
      required this.forHw,
      required this.mskoolController,
      required this.loginSuccessModel,
      required this.asmayId,
      required this.asmclId,
      required this.asmsId,
      required this.ismsId,
      required this.fromDate,
      required this.toDate});

  @override
  State<VerifyHwCwViewDetails> createState() => _VerifyHwCwViewDetailsState();
}

class _VerifyHwCwViewDetailsState extends State<VerifyHwCwViewDetails> {
  final PickImageController imageController = Get.put(PickImageController());

  @override
  void dispose() {
    Get.delete<PickImageController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int color = -1;
    return Scaffold(
      appBar: CustomAppBar(title: widget.title, action: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: ElevatedButton(
            onPressed: () {
              logger.d(imageController.textEditingControllers.length);
              for (var element in imageController.textEditingControllers) {
                logger.d(element.text);
              }
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(36.0),
              ),
              backgroundColor: Colors.white,
            ),
            child: Text(
              "Save",
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
            ),
          ),
        ),
      ]).getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.forHw
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: const Color(0xFFFBCFCF)),
                    child: Text(
                      "Maximum Marks : 20",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .merge(const TextStyle(color: Color(0xFFA83232))),
                    ),
                  ),
            widget.forHw
                ? const SizedBox()
                : const SizedBox(
                    height: 16.0,
                  ),
            widget.forHw
                ? FutureBuilder<List<VerifyHwListModelValues>>(
                    future: GetHwApi.instance.getHwForVerification(
                      miId: widget.loginSuccessModel.mIID!,
                      hrmeId: widget.loginSuccessModel.empcode!,
                      loginId: widget.loginSuccessModel.userId!,
                      userId: widget.loginSuccessModel.userId!,
                      ivrmrtId: widget.loginSuccessModel.roleId!,
                      roleFlag: "Staff",
                      asmayId: widget.asmayId,
                      ismsId: widget.ismsId,
                      asmclId: widget.asmclId,
                      asmsId: widget.asmsId,
                      fromDate: widget.fromDate,
                      toDate: widget.toDate,
                      base: baseUrlFromInsCode(
                        "portal",
                        widget.mskoolController,
                      ),
                    ),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return const Center(
                            child: AnimatedProgressWidget(
                                title: "No HomeWork uploaded",
                                desc:
                                    "There are no assignment uploaded by the student's",
                                animationPath: "assets/json/default.json"),
                          );
                        }
                        imageController.updateHwList(snapshot.data!);
                        return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              color += 1;
                              if (color % 6 == 0) {
                                color = 0;
                              }

                              imageController.updateTextEditingControllers(
                                  TextEditingController());
                              return VerifyHwCwItem(
                                forHw: widget.forHw,
                                imageController: imageController,
                                marks: imageController.textEditingControllers
                                    .elementAt(index),
                                model: snapshot.data!.elementAt(index),
                                color: lighterColor.elementAt(color),
                                base: baseUrlFromInsCode(
                                    "portal", widget.mskoolController),
                                miId: widget.loginSuccessModel.mIID!,
                                loginSuccessModel: widget.loginSuccessModel,
                                asmayId: widget.asmayId,
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(
                                height: 16.0,
                              );
                            },
                            itemCount: snapshot.data!.length);
                      }

                      if (snapshot.hasError) {
                        return ErrWidget(
                            err: snapshot.error as Map<String, dynamic>);
                      }
                      return const AnimatedProgressWidget(
                          title: "Loading uploaded Homework",
                          desc:
                              "Please wait while we load uploaded assignments for you.",
                          animationPath: "assets/json/default.json");
                    },
                  )
                : FutureBuilder<List<VerifyClassworkListValues>>(
                    future: GetCwApi.instance.getCwList(
                        miId: widget.loginSuccessModel.mIID!,
                        hrmeId: widget.loginSuccessModel.empcode!,
                        loginId: widget.loginSuccessModel.userId!,
                        userId: widget.loginSuccessModel.userId!,
                        ivrmrtId: widget.loginSuccessModel.roleId!,
                        roleFlag: "Staff",
                        asmayId: widget.asmayId,
                        ismsId: widget.ismsId,
                        asmclId: widget.asmclId,
                        asmsId: widget.asmsId,
                        fromDate: widget.fromDate,
                        toDate: widget.toDate,
                        base: baseUrlFromInsCode(
                            "portal", widget.mskoolController)),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data!.isEmpty) {
                          return const Center(
                            child: AnimatedProgressWidget(
                                title: "No HomeWork uploaded",
                                desc:
                                    "There are no assignment uploaded by the student's",
                                animationPath: "assets/json/default.json"),
                          );
                        }

                        imageController.updateCwList(snapshot.data!);

                        return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, index) {
                              color += 1;
                              if (color % 6 == 0) {
                                color = 0;
                              }
                              imageController.updateTextEditingControllers(
                                  TextEditingController());
                              return VerifyHwCwItem(
                                asmayId: widget.asmayId,
                                imageController: imageController,
                                marks: imageController.textEditingControllers
                                    .elementAt(index),
                                base: baseUrlFromInsCode(
                                    "portal", widget.mskoolController),
                                color: lighterColor.elementAt(color),
                                forHw: widget.forHw,
                                loginSuccessModel: widget.loginSuccessModel,
                                miId: widget.loginSuccessModel.mIID!,
                                cwList: snapshot.data!.elementAt(index),
                              );
                            },
                            separatorBuilder: (_, index) {
                              return const SizedBox(
                                height: 16.0,
                              );
                            },
                            itemCount: snapshot.data!.length);
                      }
                      if (snapshot.hasError) {
                        return ErrWidget(
                            err: snapshot.error as Map<String, dynamic>);
                      }
                      return const AnimatedProgressWidget(
                          title: "Loading uploaded Classwork",
                          desc:
                              "Please wait while we load uploaded assignments for you.",
                          animationPath: "assets/json/default.json");
                    }),
          ],
        ),
      ),
    );
  }
}
