import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/verify_homework_classwork/screen/hw_cw_view_details.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

class VerifyHwCwHome extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final String title;
  final bool forHw;
  const VerifyHwCwHome(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.title,
      required this.forHw});

  @override
  State<VerifyHwCwHome> createState() => _VerifyHwCwHomeState();
}

class _VerifyHwCwHomeState extends State<VerifyHwCwHome> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.title).getAppBar(),
      body: SingleChildScrollView(
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
                            style:
                                Theme.of(context).textTheme.labelMedium!.merge(
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
                            style:
                                Theme.of(context).textTheme.labelMedium!.merge(
                                      const TextStyle(
                                          fontSize: 20.0,
                                          color: Color(0xFFFF6F67)),
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
                            style:
                                Theme.of(context).textTheme.labelMedium!.merge(
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
                            style:
                                Theme.of(context).textTheme.labelMedium!.merge(
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
            Row(
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
            MSkollBtn(
              title: "View Details",
              onPress: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return VerifyHwCwViewDetails(
                      title: widget.title, forHw: widget.forHw);
                }));
              },
              size: Size(
                Get.width * 0.5,
                50,
              ),
            ),
            const AnimatedProgressWidget(
              title: "",
              desc: "",
              animationPath: "assets/json/nodata.json",
              animatorHeight: 250,
            ),
          ],
        ),
      ),
    );
  }
}
