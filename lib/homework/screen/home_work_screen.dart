import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/homework/api/home_work_api.dart';
import 'package:m_skool_flutter/homework/screen/home_work.dart';
import 'package:m_skool_flutter/information/controller/hwcwnb_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';

class HomeWorkScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final String title;
  //final HwCwNbController hwCwNbController;
  const HomeWorkScreen({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
    required this.title,
  });

  @override
  State<HomeWorkScreen> createState() => _HomeWorkScreenState();
}

class _HomeWorkScreenState extends State<HomeWorkScreen> {
  RxBool showFilter = RxBool(false);
  final HwCwNbController hwCwNbController = Get.put(HwCwNbController());
  @override
  void dispose() {
    Get.delete<HwCwNbController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leading: const CustomGoBackButton(),
        leadingWidth: 30,
        title: Text(widget.title),
        actions: [
          IconButton(
            onPressed: () {
              if (showFilter.value) {
                showFilter.value = false;
              } else {
                showFilter.value = true;
              }
              setState(() {});
            },
            icon: SvgPicture.asset('assets/svg/filter.svg'),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              return showFilter.value == false
                  ? const SizedBox()
                  : Container(
                      color: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 16.0,
                          right: 16.0,
                          bottom: 16.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Filter",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .merge(const TextStyle(color: Colors.white)),
                            ),
                            const SizedBox(
                              height: 12.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      DateTime firstDate = DateTime(
                                        DateTime.now().month == 1
                                            ? DateTime.now().year - 1
                                            : DateTime.now().year,
                                        DateTime.now().month == 1
                                            ? 12
                                            : DateTime.now().day == 1
                                                ? DateTime.now().month - 1
                                                : DateTime.now().month,
                                      );
                                      final DateTime? startDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: hwCwNbController
                                                      .dtList.isNotEmpty
                                                  ? hwCwNbController
                                                      .dtList.first
                                                  : DateTime.now(),
                                              firstDate: firstDate,
                                              lastDate: DateTime.now());
                                      if (startDate == null) {
                                        Fluttertoast.showToast(
                                            msg: "Please select start date");
                                        return;
                                      }
                                      hwCwNbController
                                          .updateStartDateProvided(true);
                                      if (hwCwNbController.dtList.isEmpty) {
                                        hwCwNbController.updateStartBy(
                                            "${startDate.year}-${startDate.month}-${startDate.day}");
                                        hwCwNbController.dtList.add(startDate);
                                      }

                                      if (hwCwNbController.dtList.length > 1) {
                                        hwCwNbController.dtList.first =
                                            startDate;
                                        hwCwNbController.updateShowFilter(
                                            hwCwNbController.filter.value + 1);
                                        showFilter.value = false;

                                        Fluttertoast.showToast(
                                            msg:
                                                "Filter Applied.. now you will see the filtered result");
                                        await filter();
                                      }
                                      //hwCwNbController.dtList.add(startDate);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: 12.0, right: 8.0),
                                      alignment: Alignment.centerLeft,
                                      width: double.infinity,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Theme.of(context).cardColor,
                                        borderRadius:
                                            BorderRadius.circular(12.0),
                                      ),
                                      child: Builder(builder: (context) {
                                        return Obx(() {
                                          return Text(
                                            hwCwNbController.startBy.value,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall,
                                          );
                                        });
                                      }),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 16.0,
                                ),
                                Expanded(
                                    child: InkWell(
                                  onTap: () async {
                                    if (!hwCwNbController
                                        .startDateProvided.value) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Please provide start date before selecting end date");
                                      return;
                                    }
                                    DateTime firstDate = DateTime(
                                      DateTime.now().month == 1
                                          ? DateTime.now().year - 1
                                          : DateTime.now().year,
                                      DateTime.now().month == 1
                                          ? 12
                                          : DateTime.now().day == 1
                                              ? DateTime.now().month - 1
                                              : DateTime.now().month,
                                    );
                                    final DateTime? endDate =
                                        await showDatePicker(
                                            context: context,
                                            initialDate: hwCwNbController
                                                        .dtList.isNotEmpty &&
                                                    hwCwNbController
                                                            .dtList.length >
                                                        1
                                                ? hwCwNbController.dtList.last
                                                : DateTime.now(),
                                            firstDate: firstDate,
                                            lastDate: DateTime.now());

                                    if (endDate == null) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "Please select end date to start filter");
                                      return;
                                    }

                                    if (hwCwNbController.dtList.first.day >
                                            endDate.day &&
                                        hwCwNbController.dtList.first.month >
                                            endDate.month) {
                                      Fluttertoast.showToast(
                                          msg:
                                              "End Date must not be less than start date");
                                      return;
                                    }
                                    hwCwNbController.updateEndby(
                                        "${endDate.year}-${endDate.month}-${endDate.day}");
                                    hwCwNbController.dtList.add(endDate);

                                    // hwCwNbController
                                    //     .updateStartDateProvided(false);
                                    // hwCwNbController.updateStartBy("Start Date");
                                    // hwCwNbController.updateEndby("End Date");

                                    hwCwNbController.dtList.add(endDate);
                                    hwCwNbController.updateShowFilter(
                                        hwCwNbController.filter.value + 1);
                                    showFilter.value = false;

                                    Fluttertoast.showToast(
                                        msg:
                                            "Filter Applied.. now you will see the filtered result");

                                    await filter();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    alignment: Alignment.centerLeft,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12.0,
                                    ),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).cardColor,
                                      borderRadius: BorderRadius.circular(12.0),
                                    ),
                                    child: Obx(() {
                                      return Text(
                                        hwCwNbController.endBy.value,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall,
                                      );
                                    }),
                                  ),
                                ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
            }),
            HomeWork(
              loginSuccessModel: widget.loginSuccessModel,
              mskoolController: widget.mskoolController,
              hwCwNbController: hwCwNbController,
            ),
          ],
        ),
      ),
    );
  }

  Future<void> filter() async {
    await GetHomeWorkApi.instance.getHomeAssignment(
      miId: widget.loginSuccessModel.mIID!,
      asmayId: widget.loginSuccessModel.asmaYId!,
      amstId: widget.loginSuccessModel.amsTId!,
      startDate: hwCwNbController.dtList.first.toLocal().toString(),
      endDate: hwCwNbController.dtList.last.toLocal().toString(),
      baseUrl: baseUrlFromInsCode("portal", widget.mskoolController),
      hwCwNbController: hwCwNbController,
    );
  }
}
