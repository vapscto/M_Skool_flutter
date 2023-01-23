import 'dart:math';

import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/staff_tt/model/daily_tt_classes_model.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:m_skool_flutter/staffs/staff_tt/model/staff_weekly_tt_model.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class TTPdfGenerator {
  TTPdfGenerator.init();
  static final TTPdfGenerator instance = TTPdfGenerator.init();

  Future<void> generateDailyTT(
      RxList<DailyTTClassesModelValues> dailyTT) async {
    final Document document = Document();
    document.addPage(Page(build: (_) {
      return Container(
          child: ListView.separated(
              itemBuilder: (_, index) {
                return Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: PdfColor.fromInt(
                          timetableLLPeriodColor.elementAt(index))),
                  child: Row(children: [
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: PdfColor.fromHex(
                              timetablePdfPeriodColor.elementAt(index))),
                      child: Center(
                        child: Text(
                          "P${index + 1}",
                          style: TextStyle(
                            color: PdfColor.fromHex(
                              "#FFFFFF",
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: Text(
                        "Class : ${dailyTT.elementAt(index).asmcLClassName} | Section: ${dailyTT.elementAt(index).asmCSectionName} | Time : ${dailyTT.elementAt(index).ttmdpTStartTime}",
                      ),
                    )
                  ]),
                );
              },
              itemCount: dailyTT.length,
              separatorBuilder: (Context context, int index) {
                return SizedBox(height: 6.0);
              }));
    }));
    try {
      await DocumentFileSavePlus.saveFile(
          await document.save(),
          "Staff-DTT-${DateTime.now().millisecondsSinceEpoch}",
          "application/pdf");
      Fluttertoast.showToast(msg: "Timetable saved to download folder.");
    } catch (e) {
      logger.e(e.toString());
      Fluttertoast.showToast(msg: "Failed to generate Pdf.. Try again later");
    }
  }

  generateWeeklyTT(WeeklyTTDataModel data) async {
    final Document document = Document();
    document.addPage(Page(build: (_) {
      return Container(
          child: Table(
              border: TableBorder.all(color: PdfColor.fromHex("#3c3c3c")),
              children: [
            TableRow(children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                color: PdfColor.fromHex("#1E38FC"),
                child: Text("Days",
                    style: TextStyle(color: PdfColor.fromHex("#FFFFFF"))),
              ),
              ...List.generate(
                  data.days.values!.length,
                  (index) => Container(
                        padding: const EdgeInsets.all(16.0),
                        color: PdfColor.fromHex("#1E38FC"),
                        child: Text(
                            data.days.values!.elementAt(index).ttmDDayCode!,
                            style:
                                TextStyle(color: PdfColor.fromHex("#FFFFFF"))),
                      ))
            ]),
            ...List.generate(
              data.periods.values!.length,
              (index) => TableRow(
                children: [
                  Container(
                    color: PdfColor.fromHex(timetablePdfPeriodColor
                        .elementAt(Random().nextInt(12))),
                    padding: const EdgeInsets.all(16.0),
                    child: Text("P${index + 1}",
                        style: TextStyle(color: PdfColor.fromHex("#FFFFFF"))),
                  ),
                  ...List.generate(data.days.values!.length, (e2) {
                    Container dc = Container();
                    for (int i = 0;
                        i < data.tt.elementAt(e2).classesAt.length;
                        i++) {
                      String period =
                          data.periods.values!.elementAt(index).ttmPPeriodName!;
                      String day = data.days.values!
                          .elementAt(e2)
                          .ttmDDayName!
                          .toLowerCase()
                          .trim();

                      if (data.tt
                                  .elementAt(e2)
                                  .classesAt
                                  .elementAt(i)
                                  .periodName ==
                              period &&
                          data.tt
                                  .elementAt(e2)
                                  .classesAt
                                  .elementAt(i)
                                  .dayName
                                  .toLowerCase()
                                  .trim() ==
                              day) {
                        dc = Container(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "${data.tt.elementAt(e2).classesAt.elementAt(i).className} ${data.tt.elementAt(e2).classesAt.elementAt(i).sectionName}",
                            style: TextStyle(
                              color: PdfColor.fromHex(
                                timetablePdfPeriodColor
                                    .elementAt(Random().nextInt(12)),
                              ),
                            ),
                          ),
                        );
                      }
                    }
                    return dc;
                  })
                ],
              ),
            ),
          ]));
    }));
    try {
      await DocumentFileSavePlus.saveFile(
          await document.save(),
          "Staff-WTT-${DateTime.now().millisecondsSinceEpoch}",
          "application/pdf");
      Fluttertoast.showToast(msg: "Timetable saved to download folder.");
    } catch (e) {
      logger.e(e.toString());
      Fluttertoast.showToast(msg: "Failed to generate Pdf.. Try again later");
    }
  }
}
