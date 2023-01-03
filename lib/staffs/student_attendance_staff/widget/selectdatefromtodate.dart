import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class SelectDateFromToDate extends StatefulWidget {
  const SelectDateFromToDate({super.key});

  @override
  State<SelectDateFromToDate> createState() => _SelectDateFromToDateState();
}

class _SelectDateFromToDateState extends State<SelectDateFromToDate> {
  var startDate = TextEditingController();
  var endDate = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 55,
          width: MediaQuery.of(context).size.width / 2.6,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: CustomContainer(
            child: TextField(
              style: Theme.of(context).textTheme.titleSmall,
              controller: startDate,
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2025),
                );
                if (date != null) {
                  setState(() {
                    startDate.text =
                        "${numberList[date.day]}-${numberList[date.month]}-${date.year}";
                  });
                }
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    height: 50,
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
                          'assets/images/darkbluecalendar.png',
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'From Date',
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(62, 120, 170, 1),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                hintText: 'Select date.',
                suffixIconConstraints: const BoxConstraints(maxHeight: 20),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 4),
                  child: Image.asset(
                    'assets/images/darkbluecalendar.png',
                    color: const Color.fromRGBO(120, 120, 120, 1),
                  ),
                ),
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
              ),
              readOnly: true,
            ),
          ),
        ),
        Container(
          height: 55,
          width: MediaQuery.of(context).size.width / 2.6,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: CustomContainer(
            child: TextField(
              style: Theme.of(context).textTheme.titleSmall,
              controller: startDate,
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2025),
                );
                if (date != null) {
                  setState(() {
                    startDate.text =
                        "${numberList[date.day]}-${numberList[date.month]}-${date.year}";
                  });
                }
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                label: Container(
                  margin: const EdgeInsets.only(bottom: 15),
                  child: Container(
                    height: 50,
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
                          'assets/images/darkbluecalendar.png',
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'To Date',
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 18.0,
                                  color: Color.fromRGBO(62, 120, 170, 1),
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                hintText: 'Select date.',
                suffixIconConstraints: const BoxConstraints(maxHeight: 20),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 8.0, bottom: 4),
                  child: Image.asset(
                    'assets/images/darkbluecalendar.png',
                    color: const Color.fromRGBO(120, 120, 120, 1),
                  ),
                ),
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
              ),
              readOnly: true,
            ),
          ),
        ),
      ],
    );
  }
}
