import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/model/student_profile_details_model.dart';
import 'package:m_skool_flutter/widget/custom_elevated_button.dart';

class SubjectTeachersPopup extends StatelessWidget {
  final StudentProfileDetailsModel studentProfileDetails;
  const SubjectTeachersPopup({
    super.key,
    required this.studentProfileDetails,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      contentPadding: const EdgeInsets.all(10),
      // actionsPadding: const EdgeInsets.all(0),
      // title: const Text("data"),
      content: SizedBox(
        // height: 500,
        // width: 500,
        width: double.maxFinite,
        child: Column(
          // shrinkWrap: true,
          children: [
            ...List.generate(
                studentProfileDetails.sujectteachers!.values!.length, (index) {
              return Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // leading:
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 22,
                            backgroundImage: AssetImage(
                              "assets/images/SubjectTeacher.png",
                            ),
                            backgroundColor: Colors.white,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: Get.width * 0.3542,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${studentProfileDetails.sujectteachers!.values![index].empName}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w400,
                                        //  letterSpacing: 1,
                                      ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Subject: ${studentProfileDetails.sujectteachers!.values![index].iSMSSubjectName}",
                                  overflow: TextOverflow.fade,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .copyWith(
                                        fontSize: 12,
                                        // letterSpacing: 1,
                                        fontWeight: FontWeight.w200,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      // title:

                      // trailing:
                      CustomElevatedButton(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const BoxShadow(),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5.0, 10, 5),
                          child: Text(
                            "Contact",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onPrimary),
                          ),
                        ),
                      ),
                    ],
                  ),
                  (index !=
                          studentProfileDetails.sujectteachers!.values!.length -
                              1)
                      ? const Divider()
                      : Container()
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
