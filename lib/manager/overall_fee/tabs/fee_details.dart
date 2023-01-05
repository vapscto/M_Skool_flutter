import 'package:flutter/material.dart';
import 'package:m_skool_flutter/manager/overall_fee/widget/manager_fee_bar_chart.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class ManagerFeeDetails extends StatefulWidget {
  const ManagerFeeDetails({super.key});

  @override
  State<ManagerFeeDetails> createState() => _ManagerFeeDetailsState();
}

class _ManagerFeeDetailsState extends State<ManagerFeeDetails> {
  List<String> academic = ["2023", "2022", "2021", "2020"];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          CustomContainer(
            child: DropdownButtonFormField<String>(
              value: academic.first,
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
                // labelStyle: TextStyle(color: Color(0xFF28B6C8)),
                label: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFDFFBFE),
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/cap.png",
                        height: 24.0,
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        " Academic Year ",
                        style: Theme.of(context).textTheme.labelMedium!.merge(
                              const TextStyle(
                                  backgroundColor: Color(0xFFDFFBFE),
                                  fontSize: 20.0,
                                  color: Color(0xFF28B6C8)),
                            ),
                      ),
                    ],
                  ),
                ),
                border: const OutlineInputBorder(),
              ),
              icon: const Padding(
                padding: EdgeInsets.only(top: 4.5),
                child: Icon(
                  Icons.keyboard_arrow_down_outlined,
                  size: 30,
                ),
              ),
              items: List.generate(
                academic.length,
                (index) {
                  return DropdownMenuItem<String>(
                    value: academic.elementAt(index),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 5),
                      child: Text(
                        academic.elementAt(index),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .merge(const TextStyle(fontSize: 16.0)),
                      ),
                    ),
                  );
                },
              ),
              onChanged: (value) {
                // selectedValue = value!;
                // debugPrint(selectedValue.toString());
              },
            ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            "Result",
            style: Theme.of(context).textTheme.titleSmall!.merge(
                  const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ),
          const SizedBox(
            height: 16.0,
          ),
          const ManagerFeeBarChart(),
        ],
      ),
    );
  }
}
