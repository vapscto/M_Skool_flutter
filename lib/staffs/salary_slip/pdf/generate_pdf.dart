import 'package:document_file_save_plus/document_file_save_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/staffs/salary_slip/controller/salary_slip_related_controller.dart';
import 'package:number_to_words_english/number_to_words_english.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

class GenerateSalarySlip {
  GenerateSalarySlip.init();
  static final GenerateSalarySlip instance = GenerateSalarySlip.init();
  generateNow({
    required SalarySlipController controller,
  }) async {
    // final Response response = await getGlobalDio()
    //     .get(controller.salarySlipDetail.first.institutionDetails!.mILogo!);
    // logger.d(response.data.runtimeType);
    final Document document = Document();
    int i = 0;
    document.addPage(
      Page(
        build: (_) {
          return Container(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                controller.salarySlipDetail.first.institutionDetails!.mIName
                    .toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontBold: Font.courierBold(),
                  color: PdfColor.fromHex("#000000"),
                ),
              ),
              SizedBox(height: 24.0),
              Text(
                "Salary Slip : ${controller.salarySlipDetail.first.hreSMonth} ${controller.salarySlipDetail.first.hreSYear}",
                style: TextStyle(
                  fontSize: 12,
                  color: PdfColor.fromHex("#000000"),
                ),
              ),
              SizedBox(height: 12.0),
              Table(children: [
                TableRow(children: [
                  Text(
                    'Name  : ${controller.salarySlipDetail.first.currentemployeeDetails!.hrmEEmployeeFirstName} ${controller.salarySlipDetail.first.currentemployeeDetails!.hrmEEmployeeMiddleName} ${controller.salarySlipDetail.first.currentemployeeDetails!.hrmEEmployeeLastName}',
                    style: TextStyle(
                      fontSize: 12,
                      color: PdfColor.fromHex("#000000"),
                    ),
                  ),
                  Text(
                    'Employee Code : ${controller.salarySlipDetail.first.currentemployeeDetails!.hrmEEmployeeCode} ',
                    style: TextStyle(
                      fontSize: 12,
                      color: PdfColor.fromHex("#000000"),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Department  : ${controller.salarySlipDetail.first.departmentName} ',
                    style: TextStyle(
                      fontSize: 12,
                      color: PdfColor.fromHex("#000000"),
                    ),
                  ),
                  Text(
                    'Date Of Joining : ${controller.salarySlipDetail.first.currentemployeeDetails!.hrmEDoj!.toLocal().toString().split(" ").first} ',
                    style: TextStyle(
                      fontSize: 12,
                      color: PdfColor.fromHex("#000000"),
                    ),
                  ),
                ]),
                TableRow(children: [
                  Text(
                    'Designation  : ${controller.salarySlipDetail.first.designationName} ',
                    style: TextStyle(
                      fontSize: 12,
                      color: PdfColor.fromHex("#000000"),
                    ),
                  ),
                  Text(
                    'Total Days : ${controller.salarySlipDetail.first.empsaldetail!.hreSWorkingDays} ',
                    style: TextStyle(
                      fontSize: 12,
                      color: PdfColor.fromHex("#000000"),
                    ),
                  ),
                ])
              ]),
              SizedBox(height: 20.0),
              Table(
                border: TableBorder.all(),
                children: [
                  TableRow(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("S No."),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Name"),
                      ),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Type"),
                      ),
                      Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Amount")),
                    ],
                  ),
                  ...List.generate(
                    controller.salarySlipDetail.first.employeeSalaryslipDetails!
                        .values!.length,
                    (index) => TableRow(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${++i}"),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(controller.salarySlipDetail.first
                              .employeeSalaryslipDetails!.values!
                              .elementAt(index)!
                              .hrmedName!),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(controller.salarySlipDetail.first
                              .employeeSalaryslipDetails!.values!
                              .elementAt(index)!
                              .hrmedEarnDedFlag!),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.salarySlipDetail.first
                                .employeeSalaryslipDetails!.values!
                                .elementAt(index)!
                                .amount
                                .toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                  "Net Salary : ${controller.salarySlipDetail.first.employeeSalaryslipDetails!.values!.last!.amount.toString()}"),
              SizedBox(height: 8.0),
              Text(
                  "Salary In Words : ${NumberToWordsEnglish.convert(controller.salarySlipDetail.first.employeeSalaryslipDetails!.values!.last!.amount!.toInt())}"),
              SizedBox(height: 8.0),
              Text(
                  "Note : Signature is not required because it is computer generated statement"),
            ],
          ));
        },
      ),
    );
    try {
      await DocumentFileSavePlus.saveFile(
          await document.save(),
          "Salary-Slip-${DateTime.now().millisecondsSinceEpoch}",
          "application/pdf");
      Fluttertoast.showToast(msg: "Salary slip saved to download folder.");
    } catch (e) {
      logger.e(e.toString());
      Fluttertoast.showToast(msg: "Failed to generate Pdf.. Try again later");
    }
  }
}
