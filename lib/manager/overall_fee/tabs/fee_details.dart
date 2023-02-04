import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/manager/overall_fee/widget/manager_fee_bar_chart.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/marks_entry/widget/dropdown_label.dart';

class ManagerFeeDetails extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const ManagerFeeDetails({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<ManagerFeeDetails> createState() => _ManagerFeeDetailsState();
}

class _ManagerFeeDetailsState extends State<ManagerFeeDetails> {
  List<String> list = ["Demo", "dEMO1"];
  String? selected;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 16),
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
              value: selected,
              decoration: InputDecoration(
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
                isDense: true,
                hintStyle: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        letterSpacing: 0.3)),
                hintText: 'Select Year',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: const CustomDropDownLabel(
                  icon: 'assets/images/hat.png',
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
              items: List.generate(list.length, (index) {
                return DropdownMenuItem(
                  value: list[index],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13, left: 5),
                    child: Text(
                      list.elementAt(index),
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
                selected = s!;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              value: selected,
              decoration: InputDecoration(
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
                hintStyle: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        letterSpacing: 0.3)),
                hintText: 'Select Class',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                isDense: true,
                label: const CustomDropDownLabel(
                  icon: 'assets/images/classnew.png',
                  containerColor: Color.fromRGBO(255, 235, 234, 1),
                  text: 'Class',
                  textColor: Color.fromRGBO(255, 111, 103, 1),
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
              items: List.generate(list.length, (index) {
                return DropdownMenuItem(
                  value: list[index],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13, left: 5),
                    child: Text(
                      list[index],
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
                selected = s!;
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              value: selected,
              decoration: InputDecoration(
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
                isDense: true,
                hintStyle: Theme.of(context).textTheme.labelSmall!.merge(
                    const TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                        letterSpacing: 0.3)),
                hintText: 'Select Section',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                label: const CustomDropDownLabel(
                  icon: 'assets/images/sectionnew.png',
                  containerColor: Color.fromRGBO(219, 253, 245, 1),
                  text: 'Section',
                  textColor: Color.fromRGBO(71, 186, 158, 1),
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
              items: List.generate(list.length, (index) {
                return DropdownMenuItem(
                  value: list[index],
                  child: Padding(
                    padding: const EdgeInsets.only(top: 13, left: 5),
                    child: Text(
                      list[index],
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
                selected = s!;
              },
            ),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Result",
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 22),
            child: ManagerFeeBarChart(
              chipText: '2022-2023',
              totalCharges: 100000,
              payable: 50000,
              totalConcession: 10000,
              totalPaid: 40000,
              asmayId: 0,
              asmclId: 0,
            ),
          ),
        ],
      ),
    );
  }
}
