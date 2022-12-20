import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:m_skool_flutter/widget/pgr_widget.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:ui' as ui;

class DailyTT extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const DailyTT({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<DailyTT> createState() => _DailyTTState();
}

class _DailyTTState extends State<DailyTT> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    controller = TabController(length: 7, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: controller!,
          labelColor: Theme.of(context).textTheme.titleMedium!.color,
          labelStyle: Theme.of(context)
              .textTheme
              .titleSmall!
              .merge(const TextStyle(fontSize: 16.0)),
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: Theme.of(context).primaryColor,
          indicatorWeight: 4,

          // indicator: BoxDecoration(
          //     borderRadius: BorderRadius.circular(24.0),
          //     color: Theme.of(context).primaryColor),
          unselectedLabelColor: Colors.grey.shade600,
          isScrollable: true,
          tabs: [
            Tab(
              text: "Monday",
            ),
            Tab(
              text: "Tuesday",
            ),
            Tab(
              text: "Wednesday",
            ),
            Tab(
              text: "Thrusday",
            ),
            Tab(
              text: "Friday",
            ),
            Tab(
              text: "Saturday",
            ),
            Tab(
              text: "Sunday",
            ),
          ],
        ),
        SizedBox(
          // color: Colors.amber,
          height: Get.height,
          child: Expanded(
            child: TabBarView(controller: controller, children: [
              ShowTT(),
              ShowTT(),
              ShowTT(),
              ShowTT(),
              ShowTT(),
              ShowTT(),
              ShowTT()
            ]),
          ),
        ),
        Divider(
          height: 1.0,
          thickness: 1.0,
        )
      ],
    );
  }
}

class ShowTT extends StatefulWidget {
  const ShowTT({super.key});

  @override
  State<ShowTT> createState() => _ShowTTState();
}

class _ShowTTState extends State<ShowTT> {
  final GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: showT(),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RepaintBoundary(
                    key: _globalKey,
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: List.generate(
                            7,
                            (index) => Column(
                                  children: [
                                    Material(
                                      child: ListTile(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0)),
                                        contentPadding: EdgeInsets.zero,
                                        tileColor: timetablePeriodColor
                                            .elementAt(index)
                                            .withOpacity(0.15),
                                        title: Text(
                                          "English | Ramesh | 9:00 am",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall!
                                              .merge(const TextStyle(
                                                  fontSize: 16.0)),
                                        ),
                                        leading: Container(
                                          alignment: Alignment.center,
                                          height: double.infinity,
                                          width: 80,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            color: timetablePeriodColor
                                                .elementAt(index),
                                          ),
                                          child: Text(
                                            "P${index + 1}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .merge(
                                                  const TextStyle(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 4.0,
                                    ),
                                  ],
                                )),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24.0,
                ),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0)),
                        minimumSize: Size(Get.width * 0.5, 50)),
                    onPressed: () async {
                      try {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (_) {
                              return Dialog(
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(24.0)),
                                  child: const ProgressWidget());
                            });

                        RenderRepaintBoundary boundary =
                            _globalKey.currentContext!.findRenderObject()
                                as RenderRepaintBoundary;

                        ui.Image image =
                            await boundary.toImage(pixelRatio: 2.0);
                        ByteData? byteData = await image.toByteData(
                            format: ui.ImageByteFormat.png);
                        var pngBytes = byteData!.buffer.asUint8List();

                        List<Directory>? directory =
                            await getExternalStorageDirectories(
                                type: StorageDirectory.pictures);

                        String path = directory!.first.path;

                        String fileName =
                            "tt${DateTime.now().microsecondsSinceEpoch}.png";
                        File file = File('$path/$fileName');

                        await file.writeAsBytes(pngBytes, flush: true);

                        await GallerySaver.saveImage(file.path);
                        Fluttertoast.showToast(msg: "File saved to Gallery");

                        Navigator.pop(context);
                      } catch (e) {
                        logger.e(e.toString());
                        Fluttertoast.showToast(
                            msg: "An Error Occured while saving timetable");
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Generate PDF"),
                  ),
                )
              ],
            );
          }

          // if (snapshot.hasData) {
          //   return Column(
          //     children: [
          //       ListView.separated(
          //           shrinkWrap: true,
          //           padding: const EdgeInsets.all(16.0),
          //           itemBuilder: (_, index) {
          //             return ListTile(
          //               shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(8.0)),
          //               contentPadding: EdgeInsets.zero,
          //               tileColor: timetablePeriodColor
          //                   .elementAt(index)
          //                   .withOpacity(0.1),
          //               title: Text(
          //                 "English | Ramesh | 9:00 am",
          //                 style: Theme.of(context)
          //                     .textTheme
          //                     .titleSmall!
          //                     .merge(const TextStyle(fontSize: 16.0)),
          //               ),
          //               leading: Container(
          //                 alignment: Alignment.center,
          //                 height: double.infinity,
          //                 width: 80,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(8.0),
          //                   color: timetablePeriodColor.elementAt(index),
          //                 ),
          //                 child: Text(
          //                   "P${index + 1}",
          //                   style:
          //                       Theme.of(context).textTheme.titleMedium!.merge(
          //                             const TextStyle(
          //                               color: Colors.white,
          //                             ),
          //                           ),
          //                 ),
          //               ),
          //             );
          //           },
          //           separatorBuilder: (_, index) {
          //             return const SizedBox(
          //               height: 4.0,
          //             );
          //           },
          //           itemCount: 8),
          //       const SizedBox(
          //         height: 16.0,
          //       ),
          //     ],
          //   );
          // }
          if (snapshot.hasError) {
            return ErrWidget(err: snapshot.error as Map<String, dynamic>);
          }

          return const CustomPgrWidget(
            title: "Loading Monday's timetable",
            desc: "Please wait while we load timetable for you",
          );
        });
  }

  Future<bool> showT() async {
    await Future.delayed(Duration(seconds: 5));
    return Future.value(true);
  }
}
