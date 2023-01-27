import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/controller/notice_board_controller.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/widget/staff_widget.dart';
import 'package:m_skool_flutter/staffs/notice_board_staff/widget/student_widget.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

class NewNoticeTabScreen extends StatefulWidget {
  final NoticeBoardController noticeBoardController;
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const NewNoticeTabScreen(
      {super.key,
      required this.noticeBoardController,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<NewNoticeTabScreen> createState() => _NewNoticeTabScreenState();
}

class _NewNoticeTabScreenState extends State<NewNoticeTabScreen> {
  final _controller = ScrollController();
  TextEditingController description = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController displayDate = TextEditingController();

  List<String> noticeType = [
    "Others",
    'Syllabus',
    'Timetable',
  ];

  List<String> noticeTitle = [
    'Demo',
    'Demo1',
    'Demo2',
    'Demo3',
  ];
  String selectedNoticeType = 'Others';
  String selectedNoticeTitle = 'Demo1';

  RxBool wantToProvideReference = RxBool(false);
  RxString forStudent = RxString("stu");
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      forStudent.value = "stu";
                    },
                    child: Obx(() {
                      return AnimatedContainer(
                          height: 18,
                          width: 18,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              border: forStudent.value == "stu"
                                  ? null
                                  : Border.all(color: Colors.grey, width: 2.0)),
                          child: forStudent.value == "stu"
                              ? Image.asset("assets/images/checkbox.png")
                              : null);
                    }),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "Student",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
              const SizedBox(
                width: 16.0,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      forStudent.value = "stf";
                    },
                    child: Obx(() {
                      return AnimatedContainer(
                          height: 18,
                          width: 18,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.fastLinearToSlowEaseIn,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.0),
                              border: forStudent.value == "stf"
                                  ? null
                                  : Border.all(color: Colors.grey, width: 2.0)),
                          child: forStudent.value == "stf"
                              ? Image.asset(
                                  "assets/images/checkbox.png",
                                )
                              : null);
                    }),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "Staff",
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          CustomContainer(
            child: DropdownButtonFormField<String>(
                value: selectedNoticeType,
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
                        horizontal: 12.0, vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          'assets/svg/noteicon.svg',
                          color: const Color.fromRGBO(40, 182, 200, 1),
                          height: 24,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          " Notice Type ",
                          style: Theme.of(context).textTheme.labelMedium!.merge(
                                const TextStyle(
                                  fontSize: 20.0,
                                  color: Color.fromRGBO(40, 182, 200, 1),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                  border: const OutlineInputBorder(),
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
                items: List.generate(
                  noticeType.length,
                  (index) => DropdownMenuItem(
                    value: noticeType[index],
                    child: Text(
                      noticeType[index],
                      style: Theme.of(context).textTheme.labelSmall!.merge(
                          const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              letterSpacing: 0.3)),
                    ),
                  ),
                ),
                onChanged: (e) {
                  selectedNoticeType = e!;
                }),
          ),
          const SizedBox(
            height: 32,
          ),
          // CustomContainer(
          //   child: DropdownButtonFormField<String>(
          //       value: selectedNoticeTitle,
          //       style: Theme.of(context).textTheme.titleSmall!.merge(
          //             const TextStyle(fontSize: 16.0),
          //           ),
          //       decoration: InputDecoration(
          //         focusedBorder: const OutlineInputBorder(
          //           borderSide: BorderSide(
          //             color: Colors.transparent,
          //           ),
          //         ),
          //         enabledBorder: const OutlineInputBorder(
          //           borderSide: BorderSide(
          //             color: Colors.transparent,
          //           ),
          //         ),
          //         label: Container(
          //           decoration: BoxDecoration(
          //             color: const Color(0xFFFFEBEA),
          //             borderRadius: BorderRadius.circular(24.0),
          //           ),
          //           padding: const EdgeInsets.symmetric(
          //               horizontal: 12.0, vertical: 8.0),
          //           child: Row(
          //             mainAxisSize: MainAxisSize.min,
          //             children: [
          //               SvgPicture.asset(
          //                 'assets/svg/noteicon.svg',
          //                 color: const Color.fromRGBO(255, 111, 103, 1),
          //                 height: 24,
          //               ),
          //               const SizedBox(
          //                 width: 6.0,
          //               ),
          //               Text(
          //                 " Notice Type ",
          //                 style: Theme.of(context).textTheme.labelMedium!.merge(
          //                       const TextStyle(
          //                         fontSize: 20.0,
          //                         color: Color.fromRGBO(255, 111, 103, 1),
          //                       ),
          //                     ),
          //               ),
          //             ],
          //           ),
          //         ),
          //         border: const OutlineInputBorder(),
          //       ),
          //       icon: const Icon(
          //         Icons.keyboard_arrow_down_outlined,
          //         size: 30,
          //       ),
          //       items: List.generate(
          //         noticeType.length,
          //         (index) => DropdownMenuItem(
          //           value: noticeTitle[index],
          //           child: Text(
          //             noticeTitle[index],
          //             style: Theme.of(context).textTheme.labelSmall!.merge(
          //                 const TextStyle(
          //                     fontWeight: FontWeight.w400,
          //                     fontSize: 16.0,
          //                     letterSpacing: 0.3)),
          //           ),
          //         ),
          //       ),
          //       onChanged: (e) {
          //         selectedNoticeTitle = e!;
          //       }),
          // ),
          CustomContainer(
            child: TextField(
              style: Theme.of(context).textTheme.titleSmall,

              controller: description,
              // maxLines: 5,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 46, right: 16, left: 12),
                border: const OutlineInputBorder(),
                label: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFEBEA),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        'assets/svg/noteicon.svg',
                        color: const Color.fromRGBO(255, 111, 103, 1),
                        height: 24,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        " Notice Type ",
                        style: Theme.of(context).textTheme.labelMedium!.merge(
                              const TextStyle(
                                fontSize: 20.0,
                                color: Color.fromRGBO(255, 111, 103, 1),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
                hintText: 'Enter here.',
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
            height: 32,
          ),
          CustomContainer(
            child: TextField(
              style: Theme.of(context).textTheme.titleSmall,
              controller: description,
              maxLines: 5,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFDBFDF5),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/file-text.svg",
                        color: const Color.fromRGBO(71, 186, 158, 1),
                        height: 24,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        " Description ",
                        style: Theme.of(context).textTheme.labelMedium!.merge(
                              const TextStyle(
                                fontSize: 20.0,
                                color: Color.fromRGBO(71, 186, 158, 1),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
                hintText: 'Enter here.',
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
            height: 32,
          ),
          CustomContainer(
            child: TextField(
              controller: startDate,
              style: Theme.of(context).textTheme.titleSmall,
              readOnly: true,
              //maxLines: 4,
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2025),
                );
                if (date != null) {
                  setState(() {
                    startDate.text =
                        "${numberList[date.day]}-${numberList[date.month]}-${date.year}";
                  });
                }
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.grey,
                ),
                contentPadding: const EdgeInsets.only(top: 48.0, left: 12),
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
                        style: Theme.of(context).textTheme.labelMedium!.merge(
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
          const SizedBox(
            height: 32,
          ),
          CustomContainer(
            child: TextField(
              controller: startDate,
              style: Theme.of(context).textTheme.titleSmall,
              readOnly: true,
              //maxLines: 4,
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2025),
                );
                if (date != null) {
                  setState(() {
                    endDate.text =
                        "${numberList[date.day]}-${numberList[date.month]}-${date.year}";
                  });
                }
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.grey,
                ),
                contentPadding: const EdgeInsets.only(top: 48.0, left: 12),
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
                        " Start Date ",
                        style: Theme.of(context).textTheme.labelMedium!.merge(
                              const TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFF6F58B4),
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
          const SizedBox(
            height: 32,
          ),
          CustomContainer(
            child: TextField(
              controller: startDate,
              style: Theme.of(context).textTheme.titleSmall,
              readOnly: true,
              //maxLines: 4,
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2025),
                );
                if (date != null) {
                  setState(() {
                    endDate.text =
                        "${numberList[date.day]}-${numberList[date.month]}-${date.year}";
                  });
                }
              },
              decoration: InputDecoration(
                suffixIcon: const Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.grey,
                ),
                contentPadding: const EdgeInsets.only(top: 48.0, left: 12),
                border: const OutlineInputBorder(),
                label: Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.0),
                      color: const Color(0xFFFFFCE1)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SvgPicture.asset(
                        "assets/svg/calendar_icon.svg",
                        color: const Color(0xFFBBAC2C),
                        height: 24.0,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        " Display Date ",
                        style: Theme.of(context).textTheme.labelMedium!.merge(
                              const TextStyle(
                                fontSize: 20.0,
                                color: Color(0xFFBBAC2C),
                              ),
                            ),
                      ),
                    ],
                  ),
                ),
                hintText: '(Optional)',
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
          Obx(() {
            return forStudent.value == "stu"
                ? StudentWidget(
                    controller: widget.noticeBoardController,
                    loginSuccessModel: widget.loginSuccessModel,
                    mskoolController: widget.mskoolController,
                  )
                : StaffWidget(
                    controller: widget.noticeBoardController,
                    loginSuccessModel: widget.loginSuccessModel,
                    mskoolController: widget.mskoolController);
          }),
          // const SizedBox(
          //   height: 14.0,
          // ),
          // // ReferencesWidget(wantToProvideReference: wantToProvideReference),
          // const SizedBox(
          //   height: 16.0,
          // ),
          // // const AttachedFiles(),
          // const SizedBox(
          //   height: 32.0,
          // ),
          // Stack(
          //   clipBehavior: Clip.none,
          //   children: [
          //     Container(
          //       height: 140,
          //       padding: const EdgeInsets.only(top: 10, bottom: 10),
          //       decoration: BoxDecoration(
          //         color: Theme.of(context).scaffoldBackgroundColor,
          //         borderRadius: BorderRadius.circular(16.0),
          //         boxShadow: const [
          //           BoxShadow(
          //             offset: Offset(0, 1),
          //             blurRadius: 4,
          //             color: Colors.black12,
          //           ),
          //         ],
          //       ),
          //       child: RawScrollbar(
          //         thumbColor: const Color(0xFF1E38FC),
          //         trackColor: const Color.fromRGBO(223, 239, 253, 1),
          //         trackRadius: const Radius.circular(10),
          //         trackVisibility: true,
          //         radius: const Radius.circular(10),
          //         thickness: 14,
          //         //thumbVisibility: true,
          //         //controller: _controller,
          //         child: ListView.builder(
          //           // padding: const EdgeInsets.only(top: 1),
          //           //controller: _controller,
          //           itemCount: noticeTitle.length,
          //           itemBuilder: (context, index) {
          //             return SizedBox(
          //               height: 30,
          //               child: CheckboxListTile(
          //                 controlAffinity: ListTileControlAffinity.leading,
          //                 checkboxShape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(6)),
          //                 dense: true,
          //                 activeColor: Theme.of(context).primaryColor,
          //                 contentPadding:
          //                     const EdgeInsets.symmetric(horizontal: 8),
          //                 visualDensity: const VisualDensity(horizontal: -4.0),
          //                 title: Text(
          //                   noticeTitle[index],
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .labelSmall!
          //                       .merge(const TextStyle(
          //                           fontWeight: FontWeight.w400,
          //                           fontSize: 14.0,
          //                           letterSpacing: 0.3)),
          //                 ),
          //                 value: true,
          //                 onChanged: (value) {
          //                   // setState(() {
          //                   //   ee = value!;
          //                   // });
          //                 },
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       top: -20,
          //       left: 14,
          //       child: Container(
          //         height: 30,
          //         padding:
          //             const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
          //         decoration: const BoxDecoration(
          //           color: Color.fromRGBO(255, 235, 234, 1),
          //           borderRadius: BorderRadius.all(
          //             Radius.circular(12),
          //           ),
          //         ),
          //         child: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Image.asset(
          //               'assets/images/subjectfielicon.png',
          //               fit: BoxFit.contain,
          //               height: 24,
          //             ),
          //             const SizedBox(width: 5),
          //             Text(
          //               ' Select Department ',
          //               style: Theme.of(context).textTheme.titleSmall!.merge(
          //                     const TextStyle(
          //                       fontWeight: FontWeight.w600,
          //                       fontSize: 14.0,
          //                       color: Color.fromRGBO(255, 111, 103, 1),
          //                     ),
          //                   ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 34,
          // ),
          // Stack(
          //   clipBehavior: Clip.none,
          //   children: [
          //     Container(
          //       // height: 140,
          //       padding: const EdgeInsets.only(top: 10, bottom: 10),
          //       decoration: BoxDecoration(
          //         color: Theme.of(context).scaffoldBackgroundColor,
          //         borderRadius: BorderRadius.circular(16.0),
          //         boxShadow: const [
          //           BoxShadow(
          //             offset: Offset(0, 1),
          //             blurRadius: 4,
          //             color: Colors.black12,
          //           ),
          //         ],
          //       ),
          //       child: RawScrollbar(
          //         thumbColor: const Color(0xFF1E38FC),
          //         trackColor: const Color.fromRGBO(223, 239, 253, 1),
          //         trackRadius: const Radius.circular(10),
          //         trackVisibility: true,
          //         radius: const Radius.circular(10),
          //         thickness: 14,
          //         //thumbVisibility: true,
          //         //controller: _controller,
          //         child: ListView.builder(
          //           // padding: const EdgeInsets.only(top: 1),
          //           //controller: _controller,
          //           shrinkWrap: true,
          //           itemCount: 1,
          //           itemBuilder: (context, index) {
          //             return SizedBox(
          //               height: 30,
          //               child: CheckboxListTile(
          //                 controlAffinity: ListTileControlAffinity.leading,
          //                 checkboxShape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(6)),
          //                 dense: true,
          //                 activeColor: Theme.of(context).primaryColor,
          //                 contentPadding:
          //                     const EdgeInsets.symmetric(horizontal: 8),
          //                 visualDensity: const VisualDensity(horizontal: -4.0),
          //                 title: Text(
          //                   noticeTitle[index],
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .labelSmall!
          //                       .merge(const TextStyle(
          //                           fontWeight: FontWeight.w400,
          //                           fontSize: 14.0,
          //                           letterSpacing: 0.3)),
          //                 ),
          //                 value: true,
          //                 onChanged: (value) {
          //                   // setState(() {
          //                   //   ee = value!;
          //                   // });
          //                 },
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       top: -20,
          //       left: 14,
          //       child: Container(
          //         height: 30,
          //         padding:
          //             const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
          //         decoration: const BoxDecoration(
          //           color: Color(0xFFDBFDF5),
          //           borderRadius: BorderRadius.all(
          //             Radius.circular(12),
          //           ),
          //         ),
          //         child: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Image.asset(
          //               'assets/images/abouticon.png',
          //               fit: BoxFit.cover,
          //               height: 24,
          //             ),
          //             const SizedBox(width: 5),
          //             Text(
          //               ' Select Designation ',
          //               style: Theme.of(context).textTheme.titleSmall!.merge(
          //                     const TextStyle(
          //                       fontWeight: FontWeight.w600,
          //                       fontSize: 14.0,
          //                       color: Color.fromRGBO(71, 186, 158, 1),
          //                     ),
          //                   ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          // const SizedBox(
          //   height: 34,
          // ),
          // Stack(
          //   clipBehavior: Clip.none,
          //   children: [
          //     Container(
          //       // height: 140,
          //       padding: const EdgeInsets.only(top: 10, bottom: 10),
          //       decoration: BoxDecoration(
          //         color: Theme.of(context).scaffoldBackgroundColor,
          //         borderRadius: BorderRadius.circular(16.0),
          //         boxShadow: const [
          //           BoxShadow(
          //             offset: Offset(0, 1),
          //             blurRadius: 4,
          //             color: Colors.black12,
          //           ),
          //         ],
          //       ),
          //       child: RawScrollbar(
          //         thumbColor: const Color(0xFF1E38FC),
          //         trackColor: const Color.fromRGBO(223, 239, 253, 1),
          //         trackRadius: const Radius.circular(10),
          //         trackVisibility: true,
          //         radius: const Radius.circular(10),
          //         thickness: 14,
          //         //thumbVisibility: true,
          //         //controller: _controller,
          //         child: ListView.builder(
          //           // padding: const EdgeInsets.only(top: 1),
          //           //controller: _controller,
          //           itemCount: 1,
          //           shrinkWrap: true, // till lenght is 5 is will true
          //           itemBuilder: (context, index) {
          //             return SizedBox(
          //               height: 30,
          //               child: CheckboxListTile(
          //                 controlAffinity: ListTileControlAffinity.leading,
          //                 checkboxShape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(6)),
          //                 dense: true,
          //                 activeColor: Theme.of(context).primaryColor,
          //                 contentPadding:
          //                     const EdgeInsets.symmetric(horizontal: 8),
          //                 visualDensity: const VisualDensity(horizontal: -4.0),
          //                 title: Text(
          //                   noticeTitle[index],
          //                   style: Theme.of(context)
          //                       .textTheme
          //                       .labelSmall!
          //                       .merge(const TextStyle(
          //                           fontWeight: FontWeight.w400,
          //                           fontSize: 14.0,
          //                           letterSpacing: 0.3)),
          //                 ),
          //                 value: true,
          //                 onChanged: (value) {
          //                   // setState(() {
          //                   //   ee = value!;
          //                   // });
          //                 },
          //               ),
          //             );
          //           },
          //         ),
          //       ),
          //     ),
          //     Positioned(
          //       top: -20,
          //       left: 14,
          //       child: Container(
          //         height: 30,
          //         padding:
          //             const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
          //         decoration: const BoxDecoration(
          //           color: Color.fromRGBO(229, 243, 255, 1),
          //           borderRadius: BorderRadius.all(
          //             Radius.circular(12),
          //           ),
          //         ),
          //         child: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             Image.asset(
          //               'assets/images/selectteachericon.png',
          //               fit: BoxFit.cover,
          //               height: 24,
          //             ),
          //             const SizedBox(width: 5),
          //             Text(
          //               ' Select Department ',
          //               style: Theme.of(context).textTheme.titleSmall!.merge(
          //                     const TextStyle(
          //                       fontWeight: FontWeight.w600,
          //                       fontSize: 14.0,
          //                       color: Color.fromRGBO(62, 120, 170, 1),
          //                     ),
          //                   ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          const SizedBox(
            height: 32,
          ),
          MSkollBtn(
            title: "Save Details",
            onPress: () {},
            size: Size(Get.width * 0.4, 50),
          ),
          const SizedBox(
            height: 32,
          ),
        ],
      ),
    );
  }
}
