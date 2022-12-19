import 'dart:convert';
import 'dart:io';

import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/timetable/api/tt_api.dart';
import 'package:m_skool_flutter/timetable/model/tt.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';
import 'package:m_skool_flutter/widget/pgr_widget.dart';
import 'package:m_skool_flutter/widget/vaps_container.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

import 'package:syncfusion_flutter_pdf/pdf.dart';

class TimeTableHome extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const TimeTableHome(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<TimeTableHome> createState() => _TimeTableHomeState();
}

class _TimeTableHomeState extends State<TimeTableHome> {
  // List<String> dummySession = [
  //   "2017-2018",
  //   "2018-2019",
  //   "2019-2020",
  //   "2020-2021",
  //   "2021-2022",
  // ];

  // String selectedValue = "2021-2022";

  RxBool showWeekly = RxBool(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Time Table".tr).getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Choose Format",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Row(
                    children: [
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            showWeekly.value = false;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(
                                  24.0,
                                ),
                                bottomLeft: Radius.circular(24.0),
                              ),
                              color: showWeekly.value
                                  ? Colors.grey.shade200
                                  : Theme.of(context).primaryColor,
                            ),
                            child: Text(
                              "Day",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .merge(TextStyle(
                                      color: showWeekly.value
                                          ? Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .color
                                          : Colors.white)),
                            ),
                          ),
                        );
                      }),
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            showWeekly.value = true;
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12.0, vertical: 6.0),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(
                                  24.0,
                                ),
                                bottomRight: Radius.circular(24.0),
                              ),
                              color: showWeekly.value
                                  ? Theme.of(context).primaryColor
                                  : Colors.grey.shade200,
                            ),
                            child: Text(
                              "Week",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .merge(TextStyle(
                                      color: showWeekly.value
                                          ? Colors.white
                                          : Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .color)),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24.0,
            ),
            Obx(() {
              return showWeekly.value
                  ? WeeklyTT(
                      loginSuccessModel: widget.loginSuccessModel,
                      mskoolController: widget.mskoolController,
                    )
                  : Container();
            }),

            // Container(
            //   //padding: const EdgeInsets.all(12.0),
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).scaffoldBackgroundColor,
            //     borderRadius: BorderRadius.circular(16.0),
            //     boxShadow: const [
            //       BoxShadow(
            //         offset: Offset(0, 1),
            //         blurRadius: 8,
            //         color: Colors.black12,
            //       ),
            //     ],
            //   ),
            //   child: DropdownButtonFormField<String>(
            //     value: selectedValue,
            //     decoration: InputDecoration(
            //       // border: OutlineInputBorder(
            //       //   borderRadius: BorderRadius.circular(12.0),
            //       // ),

            //       focusedBorder: const OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Colors.transparent,
            //         ),
            //       ),
            //       enabledBorder: const OutlineInputBorder(
            //         borderSide: BorderSide(
            //           color: Colors.transparent,
            //         ),
            //       ),

            //       label: Text(
            //         "Academic Year".tr,
            //         style: Theme.of(context)
            //             .textTheme
            //             .labelLarge!
            //             .merge(TextStyle(color: Colors.grey.shade600)),
            //       ),
            //     ),
            //     icon: const Icon(
            //       Icons.keyboard_arrow_down_rounded,
            //       size: 30,
            //     ),
            //     iconSize: 30,
            //     items: List.generate(
            //       dummySession.length,
            //       (index) => DropdownMenuItem(
            //         value: dummySession.elementAt(index),
            //         child: Text(
            //           dummySession.elementAt(index),
            //           style: Theme.of(context).textTheme.labelSmall!.merge(
            //               const TextStyle(
            //                   fontWeight: FontWeight.w400,
            //                   fontSize: 16.0,
            //                   letterSpacing: 0.3)),
            //         ),
            //       ),
            //     ),
            //     onChanged: (s) {},
            //   ),
            // ),
            // const SizedBox(
            //   height: 16.0,
            // ),

            // CustomContainer(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(16.0),
            //     child: DataTable(
            //         columnSpacing: 12.0,
            //         headingRowColor: MaterialStateColor.resolveWith(
            //           (states) => Theme.of(context).colorScheme.secondary,
            //         ),
            //         border: TableBorder(
            //           verticalInside:
            //               BorderSide(color: Colors.grey.shade300, width: 1.0),
            //           horizontalInside: BorderSide(
            //             color: Colors.grey.shade300,
            //             width: 1.0,
            //           ),
            //         ),
            //         columns: const [
            //           DataColumn(label: Text("Periods")),
            //           DataColumn(
            //               label: Text(
            //             "Mon",
            //             textAlign: TextAlign.center,
            //           )),
            //           DataColumn(label: Text("Tue")),
            //           DataColumn(label: Text("Wed")),
            //           DataColumn(label: Text("Thu")),
            //           DataColumn(label: Text("Fri")),
            //           DataColumn(label: Text("Sat")),
            //         ],
            //         rows: const [
            //           DataRow(cells: [
            //             DataCell(
            //               Text("P1"),
            //             ),
            //             DataCell(
            //               Text("P1"),
            //             ),
            //             DataCell(
            //               Text("P1"),
            //             ),
            //             DataCell(
            //               Text("P1"),
            //             ),
            //             DataCell(
            //               Text("P1"),
            //             ),
            //             DataCell(
            //               Text("P1"),
            //             ),
            //             DataCell(
            //               Text("P1"),
            //             ),
            //           ]),
            //         ]),
            //   ),
            // ),

            // CustomContainer(
            //   child: ClipRRect(
            //     borderRadius: BorderRadius.circular(16.0),
            //     child: SingleChildScrollView(
            //       scrollDirection: Axis.horizontal,
            //       child: DataTable(
            //         headingRowColor: MaterialStateColor.resolveWith(
            //           (states) => Theme.of(context).colorScheme.secondary,
            //         ),
            //         border: TableBorder(
            //           horizontalInside: BorderSide(
            //             color: Colors.grey.shade300,
            //           ),
            //           verticalInside: BorderSide(
            //             color: Colors.grey.shade300,
            //           ),
            //         ),
            //         columns: [
            //           DataColumn(
            //               label: Center(
            //             child: Text(
            //               "Periods",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .titleSmall!
            //                   .merge(const TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                   )),
            //             ),
            //           )),
            //           DataColumn(
            //               label: Center(
            //             child: Text(
            //               "Mon",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .titleSmall!
            //                   .merge(const TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                   )),
            //             ),
            //           )),
            //           DataColumn(
            //               label: Center(
            //             child: Text(
            //               "Tue",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .titleSmall!
            //                   .merge(const TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                   )),
            //             ),
            //           )),
            //           DataColumn(
            //               label: Center(
            //             child: Text(
            //               "Wed",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .titleSmall!
            //                   .merge(const TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                   )),
            //             ),
            //           )),
            //           DataColumn(
            //               label: Center(
            //             child: Text(
            //               "Thu",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .titleSmall!
            //                   .merge(const TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                   )),
            //             ),
            //           )),
            //           DataColumn(
            //               label: Center(
            //             child: Text(
            //               "Fri",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .titleSmall!
            //                   .merge(const TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                   )),
            //             ),
            //           )),
            //           DataColumn(
            //               label: Center(
            //             child: Text(
            //               "Sat",
            //               style: Theme.of(context)
            //                   .textTheme
            //                   .titleSmall!
            //                   .merge(const TextStyle(
            //                     fontWeight: FontWeight.w600,
            //                   )),
            //             ),
            //           )),
            //         ],
            //         rows: [
            //           // DataRow(
            //           //   cells: [
            //           //     DataCell(
            //           //       Center(child: Text("P1")),
            //           //     ),
            //           //     DataCell(
            //           //       Center(child:  Icon(Icons.circle)),
            //           //     ),
            //           //     DataCell(
            //           //       Center(child:  Icon(Icons.circle)),
            //           //     ),
            //           //     DataCell(
            //           //       Center(child:  Icon(Icons.circle)),
            //           //     ),
            //           //     DataCell(
            //           //       Center(child: Text("Hindi")),
            //           //     ),
            //           //     DataCell(
            //           //       Center(child: Text("Soc Sci")),
            //           //     ),
            //           //     DataCell(
            //           //       Center(child: Text("Chem")),
            //           //     ),
            //           //   ],
            //           // ),
            //           populateTimetable(),
            //           populateTimetable(),
            //           populateTimetable(),
            //           populateTimetable()
            //         ],
            //       ),
            //     ),
            //   ),
            // ),
            // const SizedBox(
            //   height: 24.0,
            // ),
            // Wrap(
            //   runSpacing: 12.0,
            //   spacing: 12.0,
            //   children: const [
            //     SubjectIndicatorWidget(
            //       color: Colors.amber,
            //       sub: "Maths",
            //     ),
            //     SubjectIndicatorWidget(
            //       color: Colors.amber,
            //       sub: "Maths",
            //     ),
            //     SubjectIndicatorWidget(
            //       color: Colors.amber,
            //       sub: "Maths",
            //     ),
            //     SubjectIndicatorWidget(
            //       color: Colors.amber,
            //       sub: "Maths",
            //     ),
            //     SubjectIndicatorWidget(
            //       color: Colors.amber,
            //       sub: "Maths",
            //     ),
            //     SubjectIndicatorWidget(
            //       color: Colors.amber,
            //       sub: "Maths",
            //     ),
            //     SubjectIndicatorWidget(
            //       color: Colors.amber,
            //       sub: "Maths",
            //     ),
            //     SubjectIndicatorWidget(
            //       color: Colors.amber,
            //       sub: "Maths",
            //     ),

            //     // SubjectIndicatorWidget(),
            //     // SubjectIndicatorWidget(),
            //     // SubjectIndicatorWidget(),
            //     // SubjectIndicatorWidget(),
            //     // SubjectIndicatorWidget(),
            //     // SubjectIndicatorWidget(),
            //     // SubjectIndicatorWidget(),
            //     // SubjectIndicatorWidget(),
            //   ],
            // ),
            // const SizedBox(
            //   height: 36.0,
            // ),
            // MSkollBtn(
            //   title: "Generate PDF",
            //   onPress: () {},
            // ),
          ],
        ),
      ),
    );
  }

  // DataRow populateTimetable() {
  //   return const DataRow(
  //     cells: [
  //       DataCell(
  //         Center(child: Text("P1")),
  //       ),
  //       DataCell(
  //         Center(
  //             child: Icon(
  //           Icons.circle,
  //           size: 14.0,
  //         )),
  //       ),
  //       DataCell(
  //         Center(
  //             child: Icon(
  //           Icons.circle,
  //           size: 14.0,
  //         )),
  //       ),
  //       DataCell(
  //         Center(
  //             child: Icon(
  //           Icons.circle,
  //           size: 14.0,
  //         )),
  //       ),
  //       DataCell(
  //         Center(
  //             child: Icon(
  //           Icons.circle,
  //           size: 14.0,
  //         )),
  //       ),
  //       DataCell(
  //         Center(
  //             child: Icon(
  //           Icons.circle,
  //           size: 14.0,
  //         )),
  //       ),
  //       DataCell(
  //         Center(
  //             child: Icon(
  //           Icons.circle,
  //           size: 14.0,
  //         )),
  //       ),
  //     ],
  //   );
  // }
}

// class SubjectIndicatorWidget extends StatelessWidget {
//   final Color color;
//   final String sub;
//   const SubjectIndicatorWidget({
//     Key? key,
//     required this.color,
//     required this.sub,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       width: Get.size.width * 0.25,
//       child: Row(
//         children: [
//           Icon(
//             Icons.circle,
//             size: 18,
//             color: color,
//           ),
//           const SizedBox(
//             width: 8.0,
//           ),
//           Expanded(
//               child: Text(
//             sub,
//             style: Theme.of(context).textTheme.titleSmall,
//           )),
//         ],
//       ),
//     );
//   }
// }

class WeeklyTT extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const WeeklyTT(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<WeeklyTT> createState() => _WeeklyTTState();
}

final GlobalKey _globalKey = GlobalKey();

class _WeeklyTTState extends State<WeeklyTT> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TT>(
        future: TTApi.instance.getTimeTable(
            miId: widget.loginSuccessModel.mIID!,
            asmayId: widget.loginSuccessModel.asmaYId!,
            asmtId: widget.loginSuccessModel.amsTId!,
            base: baseUrlFromInsCode("portal", widget.mskoolController)),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                CustomContainer(
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16.0)),
                        child: DataTable(
                            headingRowColor: MaterialStateColor.resolveWith(
                              (states) => Theme.of(context).primaryColor,
                            ),
                            border: TableBorder(
                              right: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                              horizontalInside: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                              verticalInside: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            columns: [
                              DataColumn(
                                  label: Text(
                                "Periods",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .merge(const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                              ))
                            ],
                            rows: List.generate(
                                snapshot.data!.periodsList.values!.length,
                                (index) => DataRow(
                                        color: MaterialStateColor.resolveWith(
                                          (states) => timetablePeriodColor
                                              .elementAt(index),
                                        ),
                                        cells: [
                                          DataCell(Text(
                                            "Period ${snapshot.data!.periodsList.values!.elementAt(index).ttmPPeriodName!}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleSmall!
                                                .merge(
                                                  const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                          )),
                                        ]))),
                      ),

                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: RepaintBoundary(
                            key: _globalKey,
                            child: Row(
                              children: List.generate(
                                snapshot.data!.dayWise.length,
                                (index) => DataTable(
                                  headingRowColor:
                                      MaterialStateColor.resolveWith(
                                    (states) => Theme.of(context).primaryColor,
                                  ),
                                  border: TableBorder(
                                    right: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    horizontalInside: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                    verticalInside: BorderSide(
                                      color: Colors.grey.shade300,
                                    ),
                                  ),
                                  columns: [
                                    DataColumn(
                                        label: Text(
                                      snapshot.data!.dayWise
                                          .elementAt(index)
                                          .dayName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall!
                                          .merge(const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white,
                                          )),
                                    ))
                                  ],
                                  rows: List.generate(
                                    snapshot.data!.dayWise
                                        .elementAt(index)
                                        .value
                                        .length,
                                    (index2) => DataRow(
                                      cells: [
                                        DataCell(Text(
                                            '''${snapshot.data!.dayWise.elementAt(index).value.elementAt(index2).subjectName}\n${snapshot.data!.dayWise.elementAt(index).value.elementAt(index2).teacher}'''))
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      // DataTable(columns: columns, rows: rows);
                      // SingleChildScrollView(
                      //   scrollDirection: Axis.horizontal,
                      //   child: DataTable(
                      //     columns: List.generate(
                      //       snapshot.data!.gridWeeks.values!.length,
                      //       (index) => DataColumn(
                      //         label: Text(snapshot.data!.gridWeeks.values!
                      //             .elementAt(index)
                      //             .ttmDDayCode!),
                      //       ),
                      //     ),
                      //     rows: List.generate(
                      //         1,
                      //         (index) =>
                      //             DataRow(cells: [DataCell(Text("KAN\nAPP"))])),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 36.0,
                ),
                MSkollBtn(
                  title: "Generate PDF",
                  onPress: () async {
                    try {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (_) {
                            return Dialog(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(24.0)),
                                child: const ProgressWidget());
                          });

                      RenderRepaintBoundary boundary =
                          _globalKey.currentContext!.findRenderObject()
                              as RenderRepaintBoundary;
                      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
                      ByteData? byteData = await image.toByteData(
                          format: ui.ImageByteFormat.png);
                      var pngBytes = byteData!.buffer.asUint8List();
                      //var bs64 = base64Encode(pngBytes);

                      PdfDocument document = PdfDocument();
                      PdfPage page = document.pages.add();
                      final PdfImage img = PdfBitmap(pngBytes);
                      page.graphics.drawImage(
                          img,
                          Rect.fromLTWH(
                              0, 0, page.size.width, page.size.height));

                      List<int> bytes = await document.save();

                      document.dispose();
                      List<Directory>? directory =
                          await getExternalStorageDirectories(
                              type: StorageDirectory.downloads);

                      String path = directory!.first.path;

                      String fileName =
                          "tt${DateTime.now().microsecondsSinceEpoch}.pdf";
                      File file = File('$path/$fileName');

                      await file.writeAsBytes(bytes, flush: true);
                      Fluttertoast.showToast(
                          msg: "File saved at ${file.absolute.path}");

                      Navigator.pop(context);
                      //Open the PDF document in mobile
                      //OpenFile.open('$path/$fileName');
                      //Save the file and launch/download

                    } catch (e) {
                      logger.e(e.toString());
                    }
                  },
                ),
              ],
            );
          }

          if (snapshot.hasError) {
            return ErrWidget(err: snapshot.error as Map<String, dynamic>);
          }
          return const CustomPgrWidget(
              title: "Loading Weekly Timetable",
              desc: "Please wait while we load weekly timetable for you");
        }));
  }
}
