import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:m_skool_flutter/staffs/student_birthday/widget/bday_item.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class BetweenDays extends StatefulWidget {
  const BetweenDays({super.key});

  @override
  State<BetweenDays> createState() => _BetweenDaysState();
}

class _BetweenDaysState extends State<BetweenDays> {
  int color = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 16.0,
          ),
          Row(
            //crossAxisAlignment: CrossAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CustomContainer(
                  child: TextField(
                    readOnly: true,
                    style: Theme.of(context).textTheme.titleSmall,
                    //controller: date,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.only(top: 48.0, left: 12),
                      border: const OutlineInputBorder(),
                      label: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: const Color(0xFFDFFBFE),
                        ),
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
                              "From Date",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .merge(
                                    const TextStyle(
                                      fontSize: 20.0,
                                      color: Color(0xFF28B6C8),
                                    ),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      hintText: 'Select Date',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      suffixIcon: InkWell(
                          onTap: () async {
                            DateTime? selectedDT = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1998, 10, 12),
                              lastDate: DateTime.now(),
                            );

                            if (selectedDT == null) {
                              Fluttertoast.showToast(
                                  msg: "You didn't selected the date");
                              return;
                            }

                            //date.text = getFormatedDate(selectedDT);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              "assets/images/calendar.png",
                              height: 16.0,
                              width: 16.0,
                              color: const Color(0xFF28B6C8),
                              // color: Theme.of(context)
                              //     .textTheme
                              //     .titleMedium!
                              //     .color,
                            ),
                          )),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              Expanded(
                child: CustomContainer(
                  child: TextField(
                    readOnly: true,

                    style: Theme.of(context).textTheme.titleSmall,
                    //controller: date,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding:
                          const EdgeInsets.only(top: 48.0, left: 12),
                      border: const OutlineInputBorder(),
                      label: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 8.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24.0),
                          color: const Color(0xFFDFFBFE),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset("assets/images/calendar.png",
                                height: 24.0, color: const Color(0xFF28B6C8)),
                            const SizedBox(
                              width: 6.0,
                            ),
                            Text(
                              "To Date",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .merge(
                                    const TextStyle(
                                        fontSize: 20.0,
                                        color: Color(0xFF28B6C8)),
                                  ),
                            ),
                          ],
                        ),
                      ),
                      hintText: 'Select Date',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.transparent,
                        ),
                      ),
                      suffixIcon: InkWell(
                          onTap: () async {
                            DateTime? selectedDT = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1998, 10, 12),
                              lastDate: DateTime.now(),
                            );

                            if (selectedDT == null) {
                              Fluttertoast.showToast(
                                  msg: "You didn't selected the date");
                              return;
                            }

                            //date.text = getFormatedDate(selectedDT);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Image.asset(
                              "assets/images/calendar.png",
                              height: 16.0,
                              width: 16.0,
                              color: const Color(0xFF28B6C8),
                              // color: Theme.of(context)
                              //     .textTheme
                              //     .titleMedium!
                              //     .color,
                            ),
                          )),
                    ),
                  ),
                ),
              ),
            ],
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
