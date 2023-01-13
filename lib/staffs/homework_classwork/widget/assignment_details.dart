import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/controller/hw_cw_controller.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/attach_files.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/references_widget.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

class AssignmentDetails extends StatefulWidget {
  final HwCwController hwCwController;
  final bool forHw;
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const AssignmentDetails({
    super.key,
    required this.hwCwController,
    required this.forHw,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<AssignmentDetails> createState() => _AssignmentDetailsState();
}

class _AssignmentDetailsState extends State<AssignmentDetails> {
  RxBool wantToProvideReference = RxBool(false);

  final TextEditingController hwDate = TextEditingController();
  final TextEditingController topic = TextEditingController();
  final TextEditingController ass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 32.0,
        ),
        widget.forHw
            ? CustomContainer(
                child: TextField(
                  readOnly: true,
                  controller: hwDate,
                  style: Theme.of(context).textTheme.titleSmall,
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.only(top: 48.0, left: 12),
                    suffixIcon: IconButton(
                      onPressed: () async {
                        final DateTime? dt = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime(DateTime.now().year, 12, 31),
                        );

                        if (dt == null) {
                          Fluttertoast.showToast(
                              msg: "No Date Selected for assigning Homework");
                          return;
                        }
                        hwDate.text = "${dt.day}-${dt.month}-${dt.year}";
                        widget.hwCwController.updateHwDate(dt);
                      },
                      icon: SvgPicture.asset(
                        'assets/svg/calendar_icon.svg',
                        color: const Color(0xFF3E78AA),
                        height: 22.0,
                      ),
                    ),
                    border: const OutlineInputBorder(),
                    label: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: const Color(0xFFEEE8FF)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/calendar_icon.svg",
                            color: const Color(0xFF6F58B4),
                            height: 24.0,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            " Homework Date ",
                            style:
                                Theme.of(context).textTheme.labelMedium!.merge(
                                      const TextStyle(
                                          fontSize: 20.0,
                                          color: Color(0xFF6F58B4)),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Select Date',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              )
            : Row(
                children: [
                  Expanded(
                    child: CustomContainer(
                      child: TextField(
                        style: Theme.of(context).textTheme.titleSmall,
                        readOnly: true,
                        //maxLines: 4,
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            onPressed: () async {
                              final DateTime? dt = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(DateTime.now().year, 12, 31),
                              );

                              if (dt == null) {
                                Fluttertoast.showToast(
                                    msg:
                                        "No Start Date Selected for assigning classwork");
                                return;
                              }
                            },
                            icon: SvgPicture.asset(
                              'assets/svg/calendar_icon.svg',
                              color: const Color(0xFF3E78AA),
                              height: 22.0,
                            ),
                          ),
                          contentPadding:
                              const EdgeInsets.only(top: 48.0, left: 12),
                          border: const OutlineInputBorder(),
                          label: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                                color: const Color(0xFFE5F3FF)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/calendar_icon.svg",
                                  color: const Color(0xFF3E78AA),
                                  height: 24.0,
                                ),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  " Start Date ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .merge(
                                        const TextStyle(
                                          fontSize: 20.0,
                                          color: Color(0xFF3E78AA),
                                        ),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          hintText: 'Select Date',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: CustomContainer(
                      child: TextField(
                        readOnly: true,
                        style: Theme.of(context).textTheme.titleSmall,

                        //maxLines: 4,
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding:
                              const EdgeInsets.only(top: 48.0, left: 12),
                          suffixIcon: IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(
                              'assets/svg/calendar_icon.svg',
                              color: const Color(0xFF3E78AA),
                              height: 22.0,
                            ),
                          ),
                          border: const OutlineInputBorder(),
                          label: Container(
                            margin: const EdgeInsets.only(bottom: 5),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 8.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24.0),
                                color: const Color(0xFFE5F3FF)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SvgPicture.asset(
                                  "assets/svg/calendar_icon.svg",
                                  color: const Color(0xFF3E78AA),
                                  height: 24.0,
                                ),
                                const SizedBox(
                                  width: 6.0,
                                ),
                                Text(
                                  " End Date ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .merge(
                                        const TextStyle(
                                            fontSize: 20.0,
                                            color: Color(0xFF3E78AA)),
                                      ),
                                ),
                              ],
                            ),
                          ),
                          hintText: 'Select Date',
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        const SizedBox(
          height: 32.0,
        ),
        CustomContainer(
          child: TextField(
            controller: topic,
            style: Theme.of(context).textTheme.titleSmall,
            readOnly: false,

            //maxLines: 4,
            decoration: InputDecoration(
              // suffixIcon: IconButton(
              //   onPressed: () {},
              //   icon: SvgPicture.asset(
              //     'assets/svg/calendar_icon.svg',
              //     color: const Color(0xFFC1B538),
              //     height: 22.0,
              //   ),
              // ),
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 48.0, left: 12),
              border: const OutlineInputBorder(),
              label: Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: const Color(0xFFFFFDE8)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      "assets/images/HINDI.png",
                      color: const Color(0xFFC1B538),
                      height: 24.0,
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      " Topic ",
                      style: Theme.of(context).textTheme.labelMedium!.merge(
                            const TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFFC1B538),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
              hintText: 'Enter Topic',

              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 32.0,
        ),
        CustomContainer(
          child: TextField(
            controller: ass,
            style: Theme.of(context).textTheme.titleSmall,
            readOnly: false,
            maxLines: widget.forHw ? 4 : null,
            decoration: InputDecoration(
              // suffixIcon: IconButton(
              //   onPressed: () {},
              //   icon: SvgPicture.asset(
              //     'assets/svg/calendar_icon.svg',
              //     color: const Color(0xFFC1B538),
              //     height: 22.0,
              //   ),
              // ),
              isDense: true,
              contentPadding: const EdgeInsets.only(top: 48.0, left: 12),
              border: const OutlineInputBorder(),
              label: Container(
                margin: const EdgeInsets.only(bottom: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: const Color(0xFFDFFBFE)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      "assets/svg/chapter.svg",
                      color: const Color(0xFF28B6C8),
                      height: 20.0,
                    ),
                    const SizedBox(
                      width: 6.0,
                    ),
                    Text(
                      widget.forHw ? " Assignment " : " Chapter ",
                      style: Theme.of(context).textTheme.labelMedium!.merge(
                            const TextStyle(
                              fontSize: 20.0,
                              color: Color(0xFF28B6C8),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
              hintText: 'Enter Chapter name',

              floatingLabelBehavior: FloatingLabelBehavior.always,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.transparent,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 32.0,
        ),
        widget.forHw
            ? const SizedBox()
            : CustomContainer(
                child: TextField(
                  // controller: ass,
                  style: Theme.of(context).textTheme.titleSmall,
                  readOnly: false,
                  maxLines: 4,
                  decoration: InputDecoration(
                    // suffixIcon: IconButton(
                    //   onPressed: () {},
                    //   icon: SvgPicture.asset(
                    //     'assets/svg/calendar_icon.svg',
                    //     color: const Color(0xFFC1B538),
                    //     height: 22.0,
                    //   ),
                    // ),
                    isDense: true,
                    contentPadding: const EdgeInsets.only(top: 48.0, left: 12),
                    border: const OutlineInputBorder(),
                    label: Container(
                      margin: const EdgeInsets.only(bottom: 5),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: const Color(0xFFFFEBEA)),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SvgPicture.asset(
                            "assets/svg/content.svg",
                            color: const Color(0xFFFF6F67),
                            height: 20.0,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          Text(
                            " Content ",
                            style:
                                Theme.of(context).textTheme.labelMedium!.merge(
                                      const TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFFFF6F67),
                                      ),
                                    ),
                          ),
                        ],
                      ),
                    ),
                    hintText: 'Provide Chapter content or insight\'s',

                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              ),
        ReferencesWidget(wantToProvideReference: wantToProvideReference),
        const SizedBox(
          height: 16.0,
        ),
        const AttachedFiles(),
        const SizedBox(
          height: 32.0,
        ),
        MSkollBtn(
          title: "Save Details",
          onPress: () {},
          size: Size(Get.width * 0.5, 50),
        )
      ],
    );
  }
}
