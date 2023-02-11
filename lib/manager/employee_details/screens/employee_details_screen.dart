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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Employee details').getAppBar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          Navigator.pop(context);
          Navigator.pop(context);
        },
        child: const Icon(Icons.home),
      ),
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
                        dataRowHeight: 45,
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
                          if (employeeDetailsController.selectedHeaderList
                              .contains(0))
                            const DataColumn(
                              label: Text(
                                'Employee Code',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          if (employeeDetailsController.selectedHeaderList
                              .contains(1))
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
                          if (employeeDetailsController.selectedHeaderList
                              .contains(2))
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
                          if (employeeDetailsController.selectedHeaderList
                              .contains(3))
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
                          if (employeeDetailsController.selectedHeaderList
                              .contains(4))
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
                          if (employeeDetailsController.selectedHeaderList
                              .contains(5))
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
                              if (employeeDetailsController.selectedHeaderList
                                  .contains(0))
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
                              if (employeeDetailsController.selectedHeaderList
                                  .contains(1))
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
                              if (employeeDetailsController.selectedHeaderList
                                  .contains(2))
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
                              if (employeeDetailsController.selectedHeaderList
                                  .contains(3))
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
                              if (employeeDetailsController.selectedHeaderList
                                  .contains(4))
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
                              if (employeeDetailsController.selectedHeaderList
                                  .contains(5))
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
