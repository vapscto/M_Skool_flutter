import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/staffs/marks_entry/screen/marks_entry_detail_screen.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/dropdown_label.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';
import 'package:video_player/video_player.dart';

import '../../../widget/custom_back_btn.dart';

class MarksEntryHome extends StatefulWidget {
  const MarksEntryHome({super.key});

  @override
  State<MarksEntryHome> createState() => _MarksEntryHomeState();
}

class _MarksEntryHomeState extends State<MarksEntryHome> {
  List<String> demoList = [
    'Demo',
    'Demo1',
    'Demo3',
    'Demo5',
  ];
  String slected = 'Demo';

  final VideoPlayerController controller =
      VideoPlayerController.asset("assets/video/marksentry_illustration.mp4");

  // @override
  // void initState() {
  //   controller.initialize().then((value) {
  //     controller.play();
  //     controller.setLooping(true);
  //     setState(() {});
  //   });
  //   super.initState();
  // }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 25,
        title: const Text('Marks Entry'),
      ),
      floatingActionButton: const HomeFab(),
      body: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                itemHeight: 60,
                menuMaxHeight: 60,
                value: slected,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: CustomDropDownLabel(
                    icon: 'assets/images/hat.png',
                    containerColor: Color.fromRGBO(223, 251, 254, 1),
                    text: 'Academic Year',
                    textColor: Color.fromRGBO(40, 182, 200, 1),
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                ),
                iconSize: 30,
                items: List.generate(demoList.length, (index) {
                  return DropdownMenuItem(
                    value: demoList[index],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 5),
                      child: Text(
                        demoList[index],
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                  );
                }),
                onChanged: (s) {
                  // selectedStaff = s!;
                  // logger.d(s.hrmEId.toString());
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                value: slected,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: CustomDropDownLabel(
                    icon: 'assets/images/classnew.png',
                    containerColor: Color.fromRGBO(255, 235, 234, 1),
                    text: 'Class',
                    textColor: Color.fromRGBO(255, 111, 103, 1),
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                ),
                iconSize: 30,
                items: List.generate(demoList.length, (index) {
                  return DropdownMenuItem(
                    value: demoList[index],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 5),
                      child: Text(
                        demoList[index],
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                  );
                }),
                onChanged: (s) {
                  // selectedStaff = s!;
                  // logger.d(s.hrmEId.toString());
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                value: slected,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: CustomDropDownLabel(
                    icon: 'assets/images/sectionnew.png',
                    containerColor: Color.fromRGBO(219, 253, 245, 1),
                    text: 'Section',
                    textColor: Color.fromRGBO(71, 186, 158, 1),
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                ),
                iconSize: 30,
                items: List.generate(demoList.length, (index) {
                  return DropdownMenuItem(
                    value: demoList[index],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 5),
                      child: Text(
                        demoList[index],
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                  );
                }),
                onChanged: (s) {
                  // selectedStaff = s!;
                  // logger.d(s.hrmEId.toString());
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                value: slected,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: CustomDropDownLabel(
                    icon: 'assets/images/examnew.png',
                    containerColor: Color.fromRGBO(229, 243, 255, 1),
                    text: 'Exam',
                    textColor: Color.fromRGBO(62, 120, 170, 1),
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                ),
                iconSize: 30,
                items: List.generate(demoList.length, (index) {
                  return DropdownMenuItem(
                    value: demoList[index],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 5),
                      child: Text(
                        demoList[index],
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                  );
                }),
                onChanged: (s) {
                  // selectedStaff = s!;
                  // logger.d(s.hrmEId.toString());
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                value: slected,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: CustomDropDownLabel(
                    icon: 'assets/images/subname.png',
                    containerColor: Color.fromRGBO(238, 232, 255, 1),
                    text: 'Subject Name',
                    textColor: Color.fromRGBO(111, 88, 180, 1),
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                ),
                iconSize: 30,
                items: List.generate(demoList.length, (index) {
                  return DropdownMenuItem(
                    value: demoList[index],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 5),
                      child: Text(
                        demoList[index],
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                  );
                }),
                onChanged: (s) {
                  // selectedStaff = s!;
                  // logger.d(s.hrmEId.toString());
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                value: slected,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: CustomDropDownLabel(
                    icon: 'assets/images/subsubject.png',
                    containerColor: Color.fromRGBO(252, 244, 222, 1),
                    text: 'Sub Subject',
                    textColor: Color.fromRGBO(206, 167, 61, 1),
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                ),
                iconSize: 30,
                items: List.generate(demoList.length, (index) {
                  return DropdownMenuItem(
                    value: demoList[index],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 5),
                      child: Text(
                        demoList[index],
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                  );
                }),
                onChanged: (s) {
                  // selectedStaff = s!;
                  // logger.d(s.hrmEId.toString());
                },
              ),
            ),
            const SizedBox(height: 20),
            MSkollBtn(
                title: 'View Details',
                onPress: () {
                  Get.to(() => const MarksEntryDetailScreen());
                  // Get.to(() => const SalarySlipHome());
                }),
            const SizedBox(height: 20),
            // Center(
            //   child: SizedBox(
            //     height: 200,
            //     child: AspectRatio(
            //       aspectRatio: controller.value.aspectRatio,
            //       child: VideoPlayer(controller),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
