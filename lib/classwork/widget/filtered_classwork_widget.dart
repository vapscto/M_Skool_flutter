import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/classwork/api/get_class_work.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/homework/screen/home_work.dart';
import 'package:m_skool_flutter/homework/screen/hwcw_detail_screen.dart';
import 'package:m_skool_flutter/information/controller/hwcwnb_controller.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/notice/api/get_notice_api.dart';

class FilteredClassWork extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final HwCwNbController hwCwNbController;
  const FilteredClassWork(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.hwCwNbController});

  @override
  State<FilteredClassWork> createState() => _FilteredClassWorkState();
}

class _FilteredClassWorkState extends State<FilteredClassWork> {
  @override
  void initState() {
    getAssignment();
    super.initState();
  }

  Future<void> getAssignment() async {
    await GetClassWorkApi.instance.getClassWorks(
      miId: widget.loginSuccessModel.mIID!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      amstId: widget.loginSuccessModel.amsTId!,
      startDate: widget.hwCwNbController.dtList.first.toLocal().toString(),
      endDate: widget.hwCwNbController.dtList.last.toLocal().toString(),
      controller: widget.hwCwNbController,
      base: baseUrlFromInsCode(
        "portal",
        widget.mskoolController,
      ),
    );

    logger.d(widget.hwCwNbController.classWorkList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return widget.hwCwNbController.isClassWorkDataLoading.value
          ? const CustomPgrWidget(
              title: "Loading Fitered Data",
              desc: "Please wait while we load new data for you")
          : widget.hwCwNbController.classWorkList.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      Text(
                        "No Classwork present",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Text(
                          "We couldn't find any classwork for these filtration")
                    ],
                  ),
                )
              : ListView.separated(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: widget.hwCwNbController.classWorkList.length,
                  itemBuilder: (_, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return HwCwDetailScreen(
                            subject: widget.hwCwNbController.classWorkList
                                .elementAt(index)
                                .ismSSubjectName!,
                            topic: widget.hwCwNbController.classWorkList
                                .elementAt(index)
                                .icWTopic!,
                            assignment: widget.hwCwNbController.classWorkList
                                        .elementAt(index)
                                        .icWAssignment ==
                                    null
                                ? "N/A"
                                : widget.hwCwNbController.classWorkList
                                    .elementAt(index)
                                    .icWAssignment!,
                            date: widget.hwCwNbController.classWorkList
                                .elementAt(index)
                                .icWFromDate!,
                            ihcId: widget.hwCwNbController.classWorkList
                                .elementAt(index)
                                .icWId!,
                            loginSuccessModel: widget.loginSuccessModel,
                            mskoolController: widget.mskoolController,
                          );
                        }));
                      },
                      child: HwCwItem(
                          sub: widget.hwCwNbController.classWorkList
                              .elementAt(index)
                              .ismSSubjectName!,
                          topic: widget.hwCwNbController.classWorkList
                              .elementAt(index)
                              .icWContent!),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 16.0,
                    );
                  },
                );
    });
  }
}
