import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/manager/staff_leave_approval/model/leave_approval_model.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

import '../../../constants/constants.dart';

class AppliedLeaveAprovalItem extends StatelessWidget {
  final LeaveApprovalModelValues value;
  const AppliedLeaveAprovalItem({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              value.hRELAPLeaveReason!,
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16.0),
                  ),
            ),
            const SizedBox(
              height: 3.0,
            ),
            Text(value.hRMLLeaveName!),
            const SizedBox(
              height: 6.0,
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: noticeBackgroundColor.last),
                  child: SvgPicture.asset(
                    'assets/svg/medication.svg',
                    color: noticeColor.last,
                  ),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Row(
                  children: [
                    Text(
                      "Leave From : ",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                            TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .color,
                            ),
                          ),
                    ),
                    Text(
                      "${getFormatedDate(DateTime.parse(value.hRELAPFromDate!)).substring(0, getFormatedDate(DateTime.parse(value.hRELAPFromDate!)).length - 2)} - ${getFormatedDate(DateTime.parse(value.hRELAPToDate!)).substring(0, getFormatedDate(DateTime.parse(value.hRELAPToDate!)).length - 2)}",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 6.0,
            ),
            Row(
              children: [
                // Container(
                //   padding: const EdgeInsets.all(8.0),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(8.0),
                //       color: noticeBackgroundColor.last),
                //   child: SvgPicture.asset(
                //     'assets/svg/medication.svg',
                //     color: noticeColor.last,
                //   ),
                // ),

                const CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                      "https://images.unsplash.com/photo-1500048993953-d23a436266cf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=869&q=80"),
                ),
                const SizedBox(
                  width: 12.0,
                ),
                Row(
                  children: [
                    Text(
                      "Name : ",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                            TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .color,
                            ),
                          ),
                    ),
                    Text(
                      "${value.hRMEEmployeeFirstName} | {value.empcode} | {value.designation}",
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                            const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                    )
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width * 0.1),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        backgroundColor: Colors.green,
                        minimumSize: const Size.fromHeight(40),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                insetPadding: const EdgeInsets.all(16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Leave Approval for ${value.hRMEEmployeeFirstName}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleSmall!
                                                  .merge(
                                                    const TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                            ),
                                            InkWell(
                                              onTap: () {
                                                Navigator.pop(context);
                                              },
                                              child: const Icon(Icons.close),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text("From Date"),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12.0,
                                                        vertical: 12.0),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey.shade500,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: const Text(
                                                        "22-11-2022"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const Text(
                                              "  \u2212  ",
                                              style: TextStyle(fontSize: 20.0),
                                            ),
                                            Expanded(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  const Text("End Date"),
                                                  const SizedBox(
                                                    height: 8.0,
                                                  ),
                                                  Container(
                                                    width: double.infinity,
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 12.0,
                                                        vertical: 12.0),
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Colors
                                                            .grey.shade500,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: const Text(
                                                        "22-11-2058"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 16.0,
                                        ),
                                        Center(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              backgroundColor: Colors.green,
                                              minimumSize:
                                                  Size(Get.width * 0.5, 40),
                                            ),
                                            onPressed: () {},
                                            child: const Text("Approval"),
                                          ),
                                        ),
                                      ]),
                                ),
                              );
                            });
                      },
                      child: const Text("Approval"),
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        backgroundColor: Colors.red,
                        minimumSize: const Size.fromHeight(40),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                insetPadding: const EdgeInsets.all(16.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Reason for Rejection",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .merge(
                                                  const TextStyle(
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: const Icon(Icons.close),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 32.0,
                                      ),
                                      CustomContainer(
                                        child: TextField(
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                          // controller: ,
                                          maxLines: 2,
                                          decoration: InputDecoration(
                                            contentPadding:
                                                const EdgeInsets.only(
                                                    top: 48.0, left: 12),
                                            border: const OutlineInputBorder(),
                                            label: Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 5),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 12.0,
                                                      vertical: 8.0),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                  color:
                                                      const Color(0xFFFFEBEA)),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    "assets/images/reason.png",
                                                    height: 24.0,
                                                  ),
                                                  const SizedBox(
                                                    width: 6.0,
                                                  ),
                                                  Text(
                                                    " Reason ".tr,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .labelMedium!
                                                        .merge(
                                                          const TextStyle(
                                                              fontSize: 20.0,
                                                              color: Color(
                                                                  0xFFFF6F67)),
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            hintText:
                                                'Type your reason here.'.tr,
                                            floatingLabelBehavior:
                                                FloatingLabelBehavior.always,
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16.0,
                                      ),
                                      Center(
                                        child: MSkollBtn(
                                            title: "Done", onPress: () {}),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                      },
                      child: const Text("Reject"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
