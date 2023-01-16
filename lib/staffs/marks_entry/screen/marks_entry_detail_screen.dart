import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/marks_entry/api/marks_entry_related_api.dart';
import 'package:m_skool_flutter/staffs/marks_entry/controller/marks_entry_related_controller.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/save_button.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';

class MarksEntryDetailScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final int asmsId;
  final int asmclId;
  final int asmayId;
  final int emeId;
  final int ismsId;
  final int emssId;
  const MarksEntryDetailScreen(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.asmsId,
      required this.asmclId,
      required this.asmayId,
      required this.emeId,
      required this.ismsId,
      required this.emssId,
      });

  @override
  State<MarksEntryDetailScreen> createState() => _MarksEntryDetailScreenState();
}

class _MarksEntryDetailScreenState extends State<MarksEntryDetailScreen> {
  final MarksEntryController marksEntryController =
      Get.put(MarksEntryController());

  List<Map<String, dynamic>> detailsList = [
    {"amsTId": 19633, "estMId": 2303994, "obtainmarks": "55"}
  ];

  void getMarksDataTable() async {
    marksEntryController.istableloading(true);
    await marksEntryController.getMarksEntrytabledetail(
      userId: widget.loginSuccessModel.userId!,
      miId: widget.loginSuccessModel.mIID!,
      roleId: widget.loginSuccessModel.roleId!,
      asmsId: widget.asmsId,
      asmclId: widget.asmclId,
      asmayId: widget.asmayId,
      emeId: widget.emeId,
      ismsId: widget.ismsId,
      base: baseUrlFromInsCode(
        'exam',
        widget.mskoolController,
      ),
    );
    marksEntryController.istableloading(false);
  }

  void saveDetails() async {
    marksEntryController.issaveloading(true);
    await saveMarksEntryDetails(
      miId: widget.loginSuccessModel.mIID!,
      asmayId: widget.asmayId,
      asmclId: widget.asmclId,
      asmsId: widget.asmsId,
      amstId: widget.loginSuccessModel.amsTId!,
      emeId: widget.emeId,
      ismsId: widget.ismsId,
      userId: widget.loginSuccessModel.userId!,
      detailsList: detailsList,
      base: baseUrlFromInsCode(
        'exam',
        widget.mskoolController,
      ),
      // emssId: widget.emssId,
    ).then((value) => logger.d(value));
    marksEntryController.issaveloading(false);
  }

  void enterMarks(int index, int amsTId, int estMId, String obtainmarks) async {
    detailsList.add({
      "amsTId": amsTId,
      "estMId": estMId,
      "obtainmarks": obtainmarks,
    });
  }

  @override
  void initState() {
    getMarksDataTable();
    logger.d(detailsList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 25,
        title: const Text('Marks Entry'),
        actions: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
            child: SaveBtn(
              title: 'Save',
              onPress: () {
                logger.d(detailsList);
                saveDetails();
              },
            ),
          ),
        ],
      ),
      floatingActionButton: const HomeFab(),
      body: Obx(
        () => marksEntryController.isTable.value
            ? const Center(
                child: AnimatedProgressWidget(
                    title: "Loading Marks Entry",
                    desc:
                        "Please wait while we load marks entry detail table and create a view for you.",
                    animationPath: "assets/json/default.json"),
              )
            : marksEntryController.marksEntryDataTableList.isNotEmpty
                ? SingleChildScrollView(
                    child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFDFD6),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          width: 160,
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Maximum Marks : ',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .merge(
                                      const TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xffF24E1E),
                                      ),
                                    ),
                              ),
                              Text(
                                marksEntryController
                                    .marksEntryDataTableList.first.totalMarks
                                    .toString()
                                    .substring(0, 2),
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .merge(
                                      const TextStyle(
                                        fontSize: 14.0,
                                        color: Color(0xffE13C3C),
                                      ),
                                    ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: DataTable(
                                dataTextStyle: const TextStyle(
                                    fontSize: 12,
                                    color: Color.fromRGBO(0, 0, 0, 0.95),
                                    fontWeight: FontWeight.w500),
                                dataRowHeight: 35,
                                headingRowHeight: 40,
                                horizontalMargin: 10,
                                columnSpacing: 40,
                                dividerThickness: 1,
                                headingTextStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                                border: TableBorder.all(
                                    borderRadius: BorderRadius.circular(10),
                                    width: 0.5),
                                headingRowColor: MaterialStateProperty.all(
                                    Theme.of(context).primaryColor),
                                columns: const [
                                  DataColumn(
                                    numeric: true,
                                    label: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'S.No',
                                        style: TextStyle(
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Name',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Adm.No',
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ),
                                  DataColumn(
                                    label: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Enter Marks',
                                        style: TextStyle(
                                            fontSize: 14,
                                            overflow: TextOverflow.clip),
                                      ),
                                    ),
                                  ),
                                ],
                                rows: List.generate(
                                    marksEntryController.marksEntryDataTableList
                                        .length, (index) {
                                  var i = index + 1;
                                  return DataRow(
                                    cells: [
                                      DataCell(Align(
                                          alignment: Alignment.center,
                                          child: Text('$i'))),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(marksEntryController
                                              .marksEntryDataTableList
                                              .elementAt(index)
                                              .studentname
                                              .toString()),
                                        ),
                                      ),
                                      DataCell(
                                        Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            marksEntryController
                                                .marksEntryDataTableList
                                                .elementAt(index)
                                                .amsTAdmNo
                                                .toString(),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: TextFormField(
                                            initialValue: marksEntryController
                                                .marksEntryDataTableList
                                                .elementAt(index)
                                                .obtainmarks!
                                                .substring(0, 2),
                                            onChanged: (value) {
                                              enterMarks(
                                                  index,
                                                  marksEntryController
                                                      .marksEntryDataTableList
                                                      .elementAt(index)
                                                      .amsTId!
                                                      .toInt(),
                                                  marksEntryController
                                                      .marksEntryDataTableList
                                                      .elementAt(index)
                                                      .estMId!
                                                      .toInt(),
                                                  value);
                                            },
                                            keyboardType: TextInputType.number,
                                            inputFormatters: [
                                              LengthLimitingTextInputFormatter(
                                                  2)
                                            ],
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))
                : const SizedBox(),
      ),
    );
  }
}
