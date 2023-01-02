import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/attach_files.dart';
import 'package:m_skool_flutter/staffs/homework_classwork/widget/references_widget.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

class HwCwAssignWork extends StatefulWidget {
  final bool forHw;
  const HwCwAssignWork({super.key, required this.forHw});

  @override
  State<HwCwAssignWork> createState() => _HwCwAssignWorkState();
}

class _HwCwAssignWorkState extends State<HwCwAssignWork> {
  TextEditingController text = TextEditingController();

  final List<String> sessions = [
    "2023",
    "2022",
    "2021",
  ];

  final List<String> section = ["A", "B", "C", "D", "E", "F"];
  final List<String> className = [
    "X",
    "IX",
    "VIII",
  ];

  final List<String> subject = [
    "Biology",
    "Physics",
    "Chemistry",
    "Mathematics",
  ];
  String selectedValue = "2023";
  String secSelectedValue = "A";
  String clsSelectedValue = "VIII";
  String subSelectedValue = "Biology";

  RxBool wantToProvideReference = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 16.0,
          ),
          CustomContainer(
            child: DropdownButtonFormField(
                value: selectedValue,
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      const TextStyle(fontSize: 16.0),
                    ),
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  label: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFDFFBFE),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/cap.png",
                          height: 24.0,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          " Academic Year ",
                          style: Theme.of(context).textTheme.labelMedium!.merge(
                                const TextStyle(
                                    backgroundColor: Color(0xFFDFFBFE),
                                    fontSize: 20.0,
                                    color: Color(0xFF28B6C8)),
                              ),
                        ),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 4.5),
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 30,
                  ),
                ),
                items: sessions
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 5),
                          child: Text(e),
                        )))
                    .toList(),
                onChanged: (e) {
                  selectedValue = e!;
                }),
          ),
          const SizedBox(
            height: 32.0,
          ),
          CustomContainer(
            child: DropdownButtonFormField(
                value: clsSelectedValue,
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      const TextStyle(fontSize: 16.0),
                    ),
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  label: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEBEA),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/class_.svg",
                          height: 24.0,
                          color: const Color(0xFFFF6F67),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          " Class ",
                          style: Theme.of(context).textTheme.labelMedium!.merge(
                                const TextStyle(
                                    fontSize: 20.0, color: Color(0xFFFF6F67)),
                              ),
                        ),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 4.5),
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 30,
                  ),
                ),
                items: className
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 5),
                          child: Text(e),
                        )))
                    .toList(),
                onChanged: (e) {
                  clsSelectedValue = e!;
                }),
          ),
          const SizedBox(
            height: 32.0,
          ),
          CustomContainer(
            child: DropdownButtonFormField(
                value: secSelectedValue,
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      const TextStyle(fontSize: 16.0),
                    ),
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  label: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFDBFDF5),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/section_.svg",
                          height: 24.0,
                          color: const Color(0xFF47BA9E),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          " Section ",
                          style: Theme.of(context).textTheme.labelMedium!.merge(
                                const TextStyle(
                                    //backgroundColor: Color(0xFFDFFBFE),
                                    fontSize: 20.0,
                                    color: Color(0xFF47BA9E)),
                              ),
                        ),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 4.5),
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 30,
                  ),
                ),
                items: section
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 5),
                          child: Text(e),
                        )))
                    .toList(),
                onChanged: (e) {
                  secSelectedValue = e!;
                }),
          ),
          const SizedBox(
            height: 32.0,
          ),
          CustomContainer(
            child: DropdownButtonFormField(
                value: subSelectedValue,
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      const TextStyle(fontSize: 16.0),
                    ),
                decoration: InputDecoration(
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  label: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0EBFF),
                      borderRadius: BorderRadius.circular(24.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 6.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          "assets/images/HINDI.png",
                          height: 24.0,
                          color: const Color(0xFF7757D9),
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          " Subject ",
                          style: Theme.of(context).textTheme.labelMedium!.merge(
                                const TextStyle(
                                  color: Color(0xFF7757D9),
                                  fontSize: 20.0,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 4.5),
                  child: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    size: 30,
                  ),
                ),
                items: subject
                    .map((e) => DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 8, left: 5),
                          child: Text(e),
                        )))
                    .toList(),
                onChanged: (e) {
                  subSelectedValue = e!;
                }),
          ),
          const SizedBox(
            height: 32.0,
          ),
          widget.forHw
              ? CustomContainer(
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
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .merge(
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
                              onPressed: () {},
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
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
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
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
                      contentPadding:
                          const EdgeInsets.only(top: 48.0, left: 12),
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
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .merge(
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
          const SizedBox(
            height: 16.0,
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
      ),
    );
  }
}
