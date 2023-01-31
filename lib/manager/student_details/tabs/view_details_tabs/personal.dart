import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/manager/student_details/controller/view_student_details_controller.dart';
import 'package:m_skool_flutter/staffs/punch_report/widget/punch_report_item.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class PersonalTab extends StatelessWidget {
  final ViewStudentDetailsController controller;
  const PersonalTab({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isErrorOccured.value
          ? Center(
              child: ErrWidget(
                err: {
                  "errorTitle": "Unexpected Error Occured",
                  "errorMsg": controller.status.value,
                },
              ),
            )
          : controller.isLoading.value
              ? Center(
                  child: AnimatedProgressWidget(
                    animationPath: 'assets/json/default.json',
                    desc: controller.status.value,
                    title: "Please wait we are loading.",
                  ),
                )
              : controller.personalData.isEmpty
                  ? const Center(
                      child: AnimatedProgressWidget(
                        title: "No Student Found",
                        desc:
                            "There is no personal available currently.. Please ask your technical team to add some",
                        animationPath: "assets/json/nodata.json",
                        animatorHeight: 250,
                      ),
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 24.0,
                          ),
                          Stack(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(top: 30),
                                child: CustomContainer(
                                  color:
                                      const Color.fromARGB(255, 196, 219, 255),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: Get.height * 0.07,
                                      ),
                                      Text(
                                        "${controller.personalData.first.amstFirstName} ${controller.personalData.first.amstMiddleName} ${controller.personalData.first.amstLastName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!
                                            .merge(
                                              const TextStyle(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        "DOB: ${getFormatedDate(DateTime.parse(controller.personalData.first.amstDob!))}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!,
                                      ),
                                      const SizedBox(
                                        height: 6.0,
                                      ),
                                      Text(
                                        "${controller.personalData.first.amstSex}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall!,
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const CircleAvatar(
                                minRadius: 36.0,
                                // backgroundImage: NetworkImage(controller.personalData.first.),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            "Bio",
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          CustomContainer(
                            color: const Color.fromARGB(255, 255, 236, 238),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  PunchReportItem(
                                    title: "Class",
                                    time: controller
                                        .personalData.first.classname!,
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  PunchReportItem(
                                    title: "Section",
                                    time: controller
                                        .personalData.first.sectionname!,
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  PunchReportItem(
                                    title: "Roll Number",
                                    time:
                                        "${controller.personalData.first.amayRollNo}",
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  PunchReportItem(
                                    title: "Admission Number",
                                    time: controller
                                        .personalData.first.amstAdmNo!,
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  PunchReportItem(
                                      title: "Register Number",
                                      time: controller.personalData.first
                                          .amstRegistrationNo!)
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          Text(
                            "Contact Details",
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          CustomContainer(
                            color: const Color(0xFFFBF1FF),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                children: [
                                  PunchReportItem(
                                    title: "Father Name",
                                    time: controller
                                        .personalData.first.fathername!,
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  PunchReportItem(
                                    title: "Mother Name",
                                    time: controller
                                        .personalData.first.mothername!,
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  PunchReportItem(
                                    title: "Email Id",
                                    time:
                                        "${controller.personalData.first.amstEmailid}",
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  PunchReportItem(
                                    title: "Mobile Number",
                                    time:
                                        "${controller.personalData.first.amstMobile}",
                                  ),
                                  const SizedBox(
                                    height: 6.0,
                                  ),
                                  PunchReportItem(
                                      title: "Address",
                                      time: controller
                                          .personalData.first.address1!)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
    });
  }
}
