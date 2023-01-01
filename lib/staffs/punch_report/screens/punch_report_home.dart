import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/punch_report/widget/punch_report_item.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class PunchReport extends StatefulWidget {
  final String title;
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const PunchReport(
      {super.key,
      required this.title,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<PunchReport> createState() => _PunchReportState();
}

class _PunchReportState extends State<PunchReport> {
  int color = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.title,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(
              60,
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                      child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: 50,
                      child: const Text("From Date"),
                    ),
                  )),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                      child: InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      alignment: Alignment.centerLeft,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        color: Colors.white,
                      ),
                      width: double.infinity,
                      height: 50,
                      child: const Text("To Date"),
                    ),
                  )),
                ],
              ),
            )),
      ).getAppBar(),
      body: ListView.separated(
          padding: const EdgeInsets.all(16.0),
          itemBuilder: (_, index) {
            color += 1;
            if (color % 6 == 0) {
              color = 0;
            }

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: lighterColor.elementAt(color)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "22 Oct 2022",
                        style: Theme.of(context).textTheme.titleSmall!.merge(
                              const TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      ),
                      Chip(
                        label: Text(
                          "7 hours",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                        ),
                        backgroundColor: noticeColor.elementAt(color),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  const PunchReportItem(
                    title: "In Time",
                    time: "09:05 AM",
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const PunchReportItem(
                    title: "Out Time",
                    time: "11:05 PM",
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const PunchReportItem(
                    title: "Late In Time",
                    time: "5 Min",
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const PunchReportItem(
                    title: "Early Out",
                    time: "55 min",
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (_, index) {
            return const SizedBox(
              height: 16.0,
            );
          },
          itemCount: 20),
    );
  }
}
