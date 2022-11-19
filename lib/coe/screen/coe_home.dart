import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:m_skool_flutter/coe/apis/get_academic_year_api.dart';
import 'package:m_skool_flutter/coe/apis/get_event_api.dart';
import 'package:m_skool_flutter/coe/models/academic_year_model.dart';
import 'package:m_skool_flutter/coe/models/coe_data_model.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "COE".tr).getAppBar(),
      body: SingleChildScrollView(
        //padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // const SizedBox(
                  //   height: 8.0,
                  // ),
                  // FutureBuilder<List<AttyearlistValues>>(
                  //     future: GetAcademicYearApi.instance.getAcademicYear(
                  //       miId: widget.loginSuccessModel.mIID!,
                  //       amstId: widget.loginSuccessModel.amsTId!,
                  //       base:
                  //           baseUrlFromInsCode("portal", widget.mskoolController),
                  //     ),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         return CustomContainer(
                  //           child: Stack(
                  //             children: [
                  //               Container(
                  //                 width: double.infinity,
                  //                 height: 55,
                  //                 decoration: BoxDecoration(
                  //                   color: Theme.of(context).primaryColor,
                  //                   borderRadius: const BorderRadius.only(
                  //                     bottomLeft: Radius.circular(8.0),
                  //                     bottomRight: Radius.circular(8.0),
                  //                   ),
                  //                 ),
                  //               ),
                  //               CalendarDatePicker2(
                  //                 initialValue: [selected],
                  //                 onValueChanged: ((value) {}),
                  //                 onDisplayedMonthChanged: (value) {},

                  //                 config: CalendarDatePicker2Config(
                  //                   calendarViewMode: DatePickerMode.day,
                  //                   calendarType: CalendarDatePicker2Type.single,
                  //                   firstDate: DateTime(
                  //                     int.parse(
                  //                       snapshot.data!.last.asmaYYear!
                  //                           .split("-")
                  //                           .first,
                  //                     ),
                  //                   ),
                  //                   lastDate: DateTime(
                  //                     int.parse(
                  //                       snapshot.data!.first.asmaYYear!
                  //                           .split("-")
                  //                           .last,
                  //                     ),
                  //                   ),
                  //                   selectedDayTextStyle: Theme.of(context)
                  //                       .textTheme
                  //                       .titleMedium!
                  //                       .merge(
                  //                         const TextStyle(
                  //                           color: Colors.white,
                  //                         ),
                  //                       ),
                  //                   dayTextStyle:
                  //                       Theme.of(context).textTheme.labelMedium,
                  //                   lastMonthIcon: const Icon(
                  //                     Icons.chevron_left_outlined,
                  //                     color: Colors.white,
                  //                   ),
                  //                   nextMonthIcon: const Icon(
                  //                     Icons.chevron_right_outlined,
                  //                     color: Colors.white,
                  //                   ),
                  //                   controlsHeight: 55,
                  //                   controlsTextStyle: Theme.of(context)
                  //                       .textTheme
                  //                       .titleMedium!
                  //                       .merge(
                  //                         const TextStyle(
                  //                           color: Colors.white,
                  //                         ),
                  //                       ),
                  //                   weekdayLabels: [
                  //                     "Su",
                  //                     "Mo",
                  //                     "Tu",
                  //                     "We",
                  //                     "Th",
                  //                     "Fr",
                  //                     "Sa",
                  //                   ],
                  //                   weekdayLabelTextStyle: Theme.of(context)
                  //                       .textTheme
                  //                       .titleMedium!
                  //                       .merge(
                  //                         const TextStyle(fontSize: 14.0),
                  //                       ),
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         );
                  //       }

                  //       return Padding(
                  //         padding: const EdgeInsets.all(16.0),
                  //         child: Row(
                  //           children: [
                  //             CircularProgressIndicator(
                  //               strokeWidth: 2,
                  //             ),
                  //             const SizedBox(
                  //               width: 12.0,
                  //             ),
                  //             Text(
                  //               "Getting Academic Year",
                  //               style: Theme.of(context).textTheme.titleMedium,
                  //             ),
                  //           ],
                  //         ),
                  //       );
                  //     }),

                  const SizedBox(
                    height: 16.0,
                  ),
                  CustomContainer(
                    child: FutureBuilder<List<AttyearlistValues>>(
                        future: GetAcademicYearApi.instance.getAcademicYear(
                          miId: widget.loginSuccessModel.mIID!,
                          amstId: widget.loginSuccessModel.amsTId!,
                          base: baseUrlFromInsCode(
                              "portal", widget.mskoolController),
                        ),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            selectedValue = snapshot.data!.first;
                            //asmayId.value = snapshot.data!.first.asmaYId!;
                            return DropdownButtonFormField<AttyearlistValues>(
                              value: selectedValue!,
                              decoration: InputDecoration(
                                // border: OutlineInputBorder(
                                //   borderRadius: BorderRadius.circular(12.0),
                                // ),

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
                                snapshot.data!.length,
                                (index) => DropdownMenuItem<AttyearlistValues>(
                                  value: snapshot.data!.elementAt(index),
                                  child: Text(
                                    snapshot.data!.elementAt(index).asmaYYear!,
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
                                selectedValue = s;
                                asmayId.value = s!.asmaYId!;
                                setState(() {});
                              },
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                const CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                                const SizedBox(
                                  width: 12.0,
                                ),
                                Text(
                                  "Getting Academic Year",
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  CustomContainer(
                    child: DropdownButtonFormField<Map<String, dynamic>>(
                      value: selectedMonth,
                      decoration: InputDecoration(
                        // border: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(12.0),
                        // ),

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
                              .merge(TextStyle(color: Colors.grey.shade600)),
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
                        setState(() {});
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Obx(() {
            // logger.d(selectedValue!.value!.asmaYId!);
            // logger.d(month.value);
            FutureBuilder<List<CoereportlistValues>>(
                future: GetEventsApi.instance.getEvents(
                    miId: widget.loginSuccessModel.mIID!,
                    amstId: widget.loginSuccessModel.amsTId!,
                    asmayId: asmayId.value,
                    month: month.value,
                    base:
                        baseUrlFromInsCode("portal", widget.mskoolController)),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return ErrWidget(
                        err: snapshot.error as Map<String, dynamic>);
                  }
                  if (snapshot.hasData && snapshot.data!.isEmpty) {
                    return Center(
                      child: Text(
                        "No Event found",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    );
                  }
                  if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                    logger.d("message");

                    return ListView.separated(
                        //controller: ScrollController(),
                        shrinkWrap: true,
                        padding: const EdgeInsets.all(16.0),
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return CoeItem(
                            values: snapshot.data!.elementAt(index),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 16.0,
                          );
                        },
                        itemCount: snapshot.data!.length);
                  }

                  return const CustomPgrWidget(
                      title: "Your events are comming.",
                      desc:
                          "All your event will appear here for a particular academic year. you can use dropdown to see different events.");
                })
            // }),
          ],
        ),
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
                    return [
                      PopupMenuItem(
                        onTap: () {},
                        child: Text(
                          "View File".tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {},
                        child: Text(
                          "View Video".tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ];
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
                    "09:00 - 06:00 pm",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            // !showImage
            //     ? const SizedBox(
            //         height: 16.0,
            //       )
            //     : Container(
            //         margin: const EdgeInsets.symmetric(
            //           horizontal: 16.0,
            //           vertical: 12.0,
            //         ),
            //         height: 180,
            //         width: double.infinity,
            //         decoration: BoxDecoration(
            //           image: const DecorationImage(
            //               fit: BoxFit.cover,
            //               image: NetworkImage(
            //                   "https://images.unsplash.com/photo-1531686264889-56fdcabd163f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")),
            //           borderRadius: BorderRadius.circular(
            //             16.0,
            //           ),
            //           color: Colors.blueAccent.shade100.withOpacity(0.2),
            //         ),
            //       ),
          ],
        ),
      ),
    );
  }
}
