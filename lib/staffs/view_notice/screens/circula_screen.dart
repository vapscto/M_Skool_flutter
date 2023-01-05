import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/view_notice/widget/circular_notice_widget.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class CirculaNotice extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const CirculaNotice(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<CirculaNotice> createState() => _CirculaNoticeState();
}

class _CirculaNoticeState extends State<CirculaNotice> {
  final List<String> sessions = [
    "2023",
    "2022",
    "2021",
  ];

  String selectedValue = "2023";
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomContainer(
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
      ),
      CircularNoticeWidget(
          loginSuccessModel: widget.loginSuccessModel,
          mskoolController: widget.mskoolController),
    ]);
  }
}
