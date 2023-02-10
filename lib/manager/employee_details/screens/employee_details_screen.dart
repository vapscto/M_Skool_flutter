import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/manager/employee_details/controller/employee_details_related_controller.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

import '../../../model/login_success_model.dart';

class EmployeeDetailsScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final List<Map<String, dynamic>> headerList;
  const EmployeeDetailsScreen({
    super.key,
    required this.headerList,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<EmployeeDetailsScreen> createState() => _EmployeeDetailsScreenState();
}

class _EmployeeDetailsScreenState extends State<EmployeeDetailsScreen> {
  final EmployeeDetailsController employeeDetailsController =
      Get.put(EmployeeDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Employee details').getAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 30, bottom: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Obx(
                () => SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: DataTable(
                        dataTextStyle: const TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(0, 0, 0, 0.95),
                            fontWeight: FontWeight.w500),
                        dataRowHeight: 37,
                        headingRowHeight: 40,
                        horizontalMargin: 8,
                        columnSpacing: 26,
                        dividerThickness: 1,
                        headingTextStyle: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                        border: TableBorder.all(
                          borderRadius: BorderRadius.circular(12),
                          width: 0.5,
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        // showBottomBorder: true,
                        headingRowColor: MaterialStateProperty.all(
                            Theme.of(context).primaryColor),
                        columns: [
                          const DataColumn(
                            label: Text(
                              ' S.No',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                          if (widget.headerList.contains({
                            "columnID": "HRME_EmployeeCode",
                            "columnName": "Employee Code"
                          }))
                            const DataColumn(
                              label: Text(
                                'Employee Code',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          if (widget.headerList.contains({
                            "columnID": "HRME_EmployeeFirstName",
                            "columnName": "Employee Name"
                          }))
                            const DataColumn(
                              label: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '     Employee Name',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          if (widget.headerList.contains({
                            "columnID": "HRME_FatherName",
                            "columnName": "Father Name"
                          }))
                            const DataColumn(
                              label: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Father Name',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          if (widget.headerList.contains({
                            "columnID": "HRME_MobileNo",
                            "columnName": "Mobile No."
                          }))
                            const DataColumn(
                              label: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '       Mobile No.',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          if (widget.headerList.contains({
                            "columnID": "HRME_EmailId",
                            "columnName": "Email Id"
                          }))
                            const DataColumn(
                              label: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  ' Email Id',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 14),
                                ),
                              ),
                            ),
                          if (widget.headerList.contains({
                            "columnID": "HRME_DOB",
                            "columnName": "Date Of Birth"
                          }))
                            const DataColumn(
                              label: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  '     Date Of Birth',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                        ],

                        rows: List.generate(
                            employeeDetailsController
                                .employeeDetailsList.length, (index) {
                          var i = index + 1;
                          return DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  '   $i',
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              if (widget.headerList.contains({
                                "columnID": "HRME_EmployeeCode",
                                "columnName": "Employee Code"
                              }))
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      employeeDetailsController
                                          .employeeDetailsList
                                          .elementAt(index)
                                          .hrmeEmployeeCode!,
                                      textAlign: TextAlign.center,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              if (widget.headerList.contains({
                                "columnID": "HRME_EmployeeFirstName",
                                "columnName": "Employee Name"
                              }))
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      employeeDetailsController
                                          .employeeDetailsList
                                          .elementAt(index)
                                          .hrmeEmployeeFirstName!,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              if (widget.headerList.contains({
                                "columnID": "HRME_FatherName",
                                "columnName": "Father Name"
                              }))
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      employeeDetailsController
                                          .employeeDetailsList
                                          .elementAt(index)
                                          .hrmeFatherName!,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              if (widget.headerList.contains({
                                "columnID": "HRME_MobileNo",
                                "columnName": "Mobile No."
                              }))
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      employeeDetailsController
                                          .employeeDetailsList
                                          .elementAt(index)
                                          .hrmeMobileNo!,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              if (widget.headerList.contains({
                                "columnID": "HRME_EmailId",
                                "columnName": "Email Id"
                              }))
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      employeeDetailsController
                                          .employeeDetailsList
                                          .elementAt(index)
                                          .hrmeEmailId!,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              if (widget.headerList.contains({
                                "columnID": "HRME_DOB",
                                "columnName": "Date Of Birth"
                              }))
                                DataCell(
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      employeeDetailsController
                                          .employeeDetailsList
                                          .elementAt(index)
                                          .hrmeDob!,
                                      overflow: TextOverflow.ellipsis,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
