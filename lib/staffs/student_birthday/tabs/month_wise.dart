import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/staffs/student_birthday/widget/bday_item.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class MonthWise extends StatefulWidget {
  const MonthWise({super.key});

  @override
  State<MonthWise> createState() => _MonthWiseState();
}

class _MonthWiseState extends State<MonthWise> {
  String selectedMonth = "January";

  int color = -1;

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
              value: selectedMonth,
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
                        "assets/images/calendar.png",
                        height: 24.0,
                        color: const Color(0xFF28B6C8),
                      ),
                      const SizedBox(
                        width: 6.0,
                      ),
                      Text(
                        "Select Month",
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
                fullMonths.length,
                (index) {
                  return DropdownMenuItem<String>(
                    value: fullMonths.elementAt(index),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 8, left: 5),
                      child: Text(
                        fullMonths.elementAt(index),
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
            "Birthday Details",
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .merge(const TextStyle(fontWeight: FontWeight.w600)),
          ),
          const SizedBox(
            height: 16.0,
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                color += 1;
                if (index % 6 == 0) {
                  color = 0;
                }
                if (color > 6) {
                  color = 0;
                }
                return BirthdayItem(color: color);
              },
              separatorBuilder: (_, index) {
                return const SizedBox(
                  height: 16.0,
                );
              },
              itemCount: 7)
        ],
      ),
    );
  }
}
