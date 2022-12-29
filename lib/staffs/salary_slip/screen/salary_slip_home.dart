import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/dropdown_label.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/mskoll_btn.dart';

class SalarySlipHome extends StatefulWidget {
  const SalarySlipHome({super.key});

  @override
  State<SalarySlipHome> createState() => _SalarySlipHomeState();
}

class _SalarySlipHomeState extends State<SalarySlipHome> {
  List<String> demoList = [
    'Demo',
    'Demo1',
    'Demo3',
    'Demo5',
  ];
  String slected = 'Demo';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 25,
        title: const Text('Salary Slip'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                value: slected,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: CustomDropDownLabel(
                    icon: 'assets/images/hat1.png',
                    containerColor: Color.fromRGBO(223, 251, 254, 1),
                    text: 'Academic Year',
                    textColor: Color.fromRGBO(40, 182, 200, 1),
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                ),
                iconSize: 30,
                items: List.generate(demoList.length, (index) {
                  return DropdownMenuItem(
                    value: demoList[index],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 5),
                      child: Text(
                        demoList[index],
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                  );
                }),
                onChanged: (s) {
                  // selectedStaff = s!;
                  // logger.d(s.hrmEId.toString());
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(16.0),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 8,
                    color: Colors.black12,
                  ),
                ],
              ),
              child: DropdownButtonFormField<String>(
                value: slected,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                  ),
                  isDense: true,
                  label: CustomDropDownLabel(
                    icon: 'assets/images/hat1.png',
                    containerColor: Color.fromRGBO(223, 251, 254, 1),
                    text: 'Academic Year',
                    textColor: Color.fromRGBO(40, 182, 200, 1),
                  ),
                ),
                icon: const Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Icon(
                    Icons.keyboard_arrow_down_rounded,
                    size: 30,
                  ),
                ),
                iconSize: 30,
                items: List.generate(demoList.length, (index) {
                  return DropdownMenuItem(
                    value: demoList[index],
                    child: Padding(
                      padding: const EdgeInsets.only(top: 13, left: 5),
                      child: Text(
                        demoList[index],
                        style: Theme.of(context).textTheme.labelSmall!.merge(
                            const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16.0,
                                letterSpacing: 0.3)),
                      ),
                    ),
                  );
                }),
                onChanged: (s) {
                  // selectedStaff = s!;
                  // logger.d(s.hrmEId.toString());
                },
              ),
            ),
            const SizedBox(height: 40),
            MSkollBtn(title: 'Generate PDF', onPress: () {}),
            const SizedBox(height: 50),
            Image.asset('assets/images/salaryslipillustration.png'),
          ],
        ),
      ),
    );
  }
}
