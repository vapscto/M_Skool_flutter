import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:m_skool_flutter/coe/apis/get_academic_year_api.dart';
import 'package:m_skool_flutter/coe/apis/get_event_api.dart';
import 'package:m_skool_flutter/coe/controller/coe_data_handler.dart';
import 'package:m_skool_flutter/coe/models/academic_year_model.dart';
import 'package:m_skool_flutter/coe/models/coe_data_model.dart';
import 'package:m_skool_flutter/coe/screen/video_screen.dart';
import 'package:m_skool_flutter/coe/screen/view_image.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class CoeHome extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const CoeHome(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<CoeHome> createState() => _CoeHomeState();
}

class _CoeHomeState extends State<CoeHome> {
  // List<String> dummySession = [
  //   "2017-2018",
  //   "2018-2019",
  //   "2019-2020",
  //   "2020-2021",
  //   "2021-2022",
  // ];

  // Rx<AttyearlistValues?>? selectedValue =
  //     Rx<AttyearlistValues>(AttyearlistValues());

  Map<String, dynamic> selectedMonth = fullMonthsWithIndex.first;
  RxInt month = RxInt(1);
  RxInt asmayId = RxInt(0);

  AttyearlistValues? selectedValue;
  //final DateTime selected = DateTime.now();
  final CoeDataHandler handler = Get.put(CoeDataHandler());

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    await GetAcademicYearApi.instance.getAcademicYear(
        miId: widget.loginSuccessModel.mIID!,
        amstId: widget.loginSuccessModel.amsTId!,
        base: baseUrlFromInsCode("portal", widget.mskoolController),
        handler: handler);
    await GetEventsApi.instance.getCoeData(
        miId: widget.loginSuccessModel.mIID!,
        amstId: widget.loginSuccessModel.amsTId!,
        base: baseUrlFromInsCode("portal", widget.mskoolController),
        month: month.value,
        asmayId: handler.asmayId.value,
        asmclID: int.parse(widget.loginSuccessModel.clsnme!),
        coeDataHandler: handler);
  }

  Future<void> reloadEvent() async {
    handler.showEventLoading(true);
    await GetEventsApi.instance.getCoeData(
        miId: widget.loginSuccessModel.mIID!,
        amstId: widget.loginSuccessModel.amsTId!,
        base: baseUrlFromInsCode("portal", widget.mskoolController),
        month: month.value,
        asmayId: handler.asmayId.value,
        asmclID: int.parse(widget.loginSuccessModel.clsnme!),
        coeDataHandler: handler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "COE".tr).getAppBar(),
      body: SafeArea(
        child: Obx(() {
          return handler.showAllLoadingProgress.value
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(),
                      const SizedBox(
                        height: 16.0,
                      ),
                      Text(
                        "Getting Academic Year and events",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                )
              : SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 24.0,
                      ),
                      Obx(() {
                        return handler.academicYearList.isEmpty
                            ? const SizedBox()
                            : CustomContainer(
                                child:
                                    DropdownButtonFormField<AttyearlistValues>(
                                  value: handler.selectedInDorpDown.value,
                                  decoration: InputDecoration(
                                    // border: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(12.0),
                                    // ),
                                    contentPadding: const EdgeInsets.all(16.0),

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

                                    label: Text(
                                      "Academic Year".tr,
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelLarge!
                                          .merge(TextStyle(
                                              color: Colors.grey.shade600)),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    size: 30,
                                  ),
                                  iconSize: 30,
                                  items: List.generate(
                                    handler.academicYearList.length,
                                    (index) =>
                                        DropdownMenuItem<AttyearlistValues>(
                                      value: handler.academicYearList
                                          .elementAt(index),
                                      child: Text(
                                        handler.academicYearList
                                            .elementAt(index)
                                            .asmaYYear!,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .merge(const TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16.0,
                                                letterSpacing: 0.3)),
                                      ),
                                    ),
                                  ),
                                  onChanged: (s) {
                                    // selectedValue = s;
                                    // asmayId.value = s!.asmaYId!;
                                    // setState(() {});
                                    handler.updateSelectedInDropDown(s!);
                                    handler.asmayId.value = s.asmaYId!;
                                    logger.d(s.asmaYId);
                                    reloadEvent();
                                  },
                                ),
                              );
                      }),
                      const SizedBox(
                        height: 24.0,
                      ),
                      CustomContainer(
                        child: DropdownButtonFormField<Map<String, dynamic>>(
                          value: selectedMonth,
                          decoration: InputDecoration(
                            // border: OutlineInputBorder(
                            //   borderRadius: BorderRadius.circular(12.0),
                            // ),

                            contentPadding: const EdgeInsets.all(16.0),

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

                            label: Text(
                              "Select Month".tr,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .merge(
                                      TextStyle(color: Colors.grey.shade600)),
                            ),
                          ),
                          icon: const Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30,
                          ),
                          iconSize: 30,
                          items: List.generate(
                            fullMonthsWithIndex.length,
                            (index) => DropdownMenuItem<Map<String, dynamic>>(
                              value: fullMonthsWithIndex.elementAt(index),
                              child: Text(
                                fullMonthsWithIndex.elementAt(index)['month'],
                                style: Theme.of(context)
                                    .textTheme
                                    .labelSmall!
                                    .merge(const TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16.0,
                                        letterSpacing: 0.3)),
                              ),
                            ),
                          ),
                          onChanged: (s) {
                            selectedMonth = s!;
                            month.value = s['day'];
                            reloadEvent();
                            //setState(() {});
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 24.0,
                      ),
                      Obx(() {
                        return handler.showEventLoading.value
                            ? const CustomPgrWidget(
                                title: "Your events are comming.",
                                desc:
                                    "All your event will appear here for a particular academic year. you can use dropdown to see different events.")
                            : handler.coeReport.isEmpty
                                ? Center(
                                    child: Text(
                                      "No Event found",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                  )
                                : ListView.separated(
                                    shrinkWrap: true,
                                    itemBuilder: (context, index) {
                                      return CoeItem(
                                          values: handler.coeReport
                                              .elementAt(index));
                                    },
                                    separatorBuilder: (_, index) {
                                      return const SizedBox(height: 16.0);
                                    },
                                    itemCount: handler.coeReport.length,
                                  );
                      })
                    ],
                  ),
                );
        }),
      ),
    );
  }
}

class CoeItem extends StatelessWidget {
  final CoereportlistValues values;
  const CoeItem({Key? key, required this.values}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        color: Color.fromARGB(103, 238, 232, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      values.coemEEventName!,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                PopupMenuButton(
                  splashRadius: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0)),
                  itemBuilder: (_) {
                    // List<PopupMenuEntry<dynamic>> popupItem =
                    //     (values.coeeVVideos == null ||
                    //                 values.coeeVVideos!.isEmpty) &&
                    //             (values.coeeIImages == null ||
                    //                 values.coeeIImages!.isEmpty)
                    //         ? []
                    //         : (values.coeeVVideos == null ||
                    //                     values.coeeVVideos!.isEmpty) &&
                    //                 (values.coeeIImages != null &&
                    //                     values.coeeIImages!.isNotEmpty)
                    //             ? [
                    //                 PopupMenuItem(
                    //                   value: "file",
                    //                   // onTap: () {

                    //                   //   // Get.to(() =>
                    //                   //   //     VideoScreen(videoUrl: values.coeeVVideos!));

                    //                   // },
                    //                   child: ListTile(
                    //                     onTap: () {
                    //                       logger.d(values.coeeVVideos);
                    //                       Navigator.push(
                    //                           context,
                    //                           MaterialPageRoute(
                    //                               builder: (_) => VideoScreen(
                    //                                   videoUrl: values
                    //                                       .coeeVVideos!)));
                    //                     },
                    //                     title: Text(
                    //                       "View File".tr,
                    //                       style: Theme.of(context)
                    //                           .textTheme
                    //                           .titleSmall,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ]
                    //             :  [
                    //                 PopupMenuItem(
                    //                   value: "Video",
                    //                   // onTap: () {

                    //                   //   // Get.to(() =>
                    //                   //   //     VideoScreen(videoUrl: values.coeeVVideos!));

                    //                   // },
                    //                   child: ListTile(
                    //                     onTap: () {
                    //                       logger.d(values.coeeVVideos);
                    //                       Navigator.push(
                    //                           context,
                    //                           MaterialPageRoute(
                    //                               builder: (_) => VideoScreen(
                    //                                   videoUrl: values
                    //                                       .coeeVVideos!)));
                    //                     },
                    //                     title: Text(
                    //                       "View Video".tr,
                    //                       style: Theme.of(context)
                    //                           .textTheme
                    //                           .titleSmall,
                    //                     ),
                    //                   ),
                    //                 ),
                    //               ];

                    List<PopupMenuEntry<dynamic>> popupItem = [];
                    PopupMenuItem video = PopupMenuItem(
                      value: "Video",
                      // onTap: () {

                      //   // Get.to(() =>
                      //   //     VideoScreen(videoUrl: values.coeeVVideos!));

                      // },
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          logger.d(values.coeeVVideos);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => VideoScreen(
                                      videoUrl: values.coeeVVideos!)));
                        },
                        title: Text(
                          "View Video".tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    );
                    PopupMenuItem image = PopupMenuItem(
                      value: "Video",
                      // onTap: () {

                      //   // Get.to(() =>
                      //   //     VideoScreen(videoUrl: values.coeeVVideos!));

                      // },
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          logger.d(values.coeeVVideos);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) =>
                                      ViewImage(image: values.coeeIImages!)));
                        },
                        title: Text(
                          "View File".tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    );
                    if (values.coeeVVideos == null &&
                        values.coeeIImages == null) {
                      popupItem = [];
                    }
                    if (values.coeeVVideos!.isNotEmpty) {
                      popupItem.add(video);
                    }
                    if (values.coeeIImages!.isNotEmpty) {
                      popupItem.add(image);
                    }

                    return popupItem;
                    // return [
                    //   PopupMenuItem(
                    //     onTap: () {},
                    //     child: Text(
                    //       "View File".tr,
                    //       style: Theme.of(context).textTheme.titleSmall,
                    //     ),
                    //   ),
                    //   PopupMenuItem(
                    //     onTap: () {},
                    //     child: Text(
                    //       "View Video".tr,
                    //       style: Theme.of(context).textTheme.titleSmall,
                    //     ),
                    //   ),
                    // ];
                  },
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    getFormatedDate(DateTime.parse(values.coeEEStartDate!)),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "${values.coeEEStartTime} - ${values.coeEEEndTime}",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            values.coeeIImages == null || values.coeeIImages!.isEmpty
                ? const SizedBox(
                    height: 16.0,
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(values.coeeIImages!)),
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ),
                      color: Colors.blueAccent.shade100.withOpacity(0.2),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
