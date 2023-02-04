import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/manager/employee_details/widget/data_card_widget.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class EmployeeDetailsHomeScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const EmployeeDetailsHomeScreen({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<EmployeeDetailsHomeScreen> createState() =>
      _EmployeeDetailsHomeScreenState();
}

class _EmployeeDetailsHomeScreenState extends State<EmployeeDetailsHomeScreen> {
  List<String> headerList = [
    'Employee Code',
    'Employee Name',
    'Father Name',
    'Mobile No.',
  ];
  final controller = ScrollController();
  final controller1 = ScrollController();
  final controller2 = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Employee details').getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 50),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: headerList.length,
                    itemBuilder: (context, index) {
                      return DataCardWidget(
                          header: headerList.elementAt(index));
                    },
                  ),
                ),
                Positioned(
                  top: -20,
                  left: 14,
                  child: Container(
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(235, 253, 255, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/headericon.png',
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          ' Header',
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(50, 185, 202, 1),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: RawScrollbar(
                    thumbColor: const Color(0xFF1E38FC),
                    trackColor: const Color.fromRGBO(223, 239, 253, 1),
                    trackRadius: const Radius.circular(10),
                    trackVisibility: true,
                    radius: const Radius.circular(10),
                    thickness: 14,
                    thumbVisibility: true,
                    controller: controller,
                    child: ListView.builder(
                      controller: controller,
                      itemCount: headerList.length,
                      itemBuilder: (context, index) {
                        return DataCardWidget(
                            header: headerList.elementAt(index));
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: -20,
                  left: 14,
                  child: Container(
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(219, 253, 245, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/typeicon.png',
                          color: const Color.fromRGBO(71, 186, 158, 1),
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          ' Type',
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(71, 186, 158, 1),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: RawScrollbar(
                    thumbColor: const Color(0xFF1E38FC),
                    trackColor: const Color.fromRGBO(223, 239, 253, 1),
                    trackRadius: const Radius.circular(10),
                    trackVisibility: true,
                    radius: const Radius.circular(10),
                    thickness: 14,
                    thumbVisibility: true,
                    controller: controller1,
                    child: ListView.builder(
                      controller: controller1,
                      itemCount: headerList.length,
                      itemBuilder: (context, index) {
                        return DataCardWidget(
                            header: headerList.elementAt(index));
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: -20,
                  left: 14,
                  child: Container(
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(255, 235, 234, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/subjectfielicon.png',
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          ' Department',
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(255, 111, 103, 1),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 180,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 1),
                        blurRadius: 4,
                        color: Colors.black12,
                      ),
                    ],
                  ),
                  child: RawScrollbar(
                    thumbColor: const Color(0xFF1E38FC),
                    trackColor: const Color.fromRGBO(223, 239, 253, 1),
                    trackRadius: const Radius.circular(10),
                    trackVisibility: true,
                    radius: const Radius.circular(10),
                    thickness: 14,
                    thumbVisibility: true,
                    controller: controller2,
                    child: ListView.builder(
                      controller: controller2,
                      itemCount: headerList.length,
                      itemBuilder: (context, index) {
                        return DataCardWidget(
                            header: headerList.elementAt(index));
                      },
                    ),
                  ),
                ),
                Positioned(
                  top: -20,
                  left: 14,
                  child: Container(
                    height: 30,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                    decoration: const BoxDecoration(
                      color: Color.fromRGBO(229, 243, 255, 1),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          'assets/images/selectteachericon.png',
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          ' Designation',
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14.0,
                                  color: Color.fromRGBO(62, 120, 170, 1),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
