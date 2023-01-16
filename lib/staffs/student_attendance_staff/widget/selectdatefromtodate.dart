import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Expanded(
            child: CustomContainer(
              child: TextField(
                controller: startDate,
                style: Theme.of(context).textTheme.titleSmall,
                readOnly: true,
                //maxLines: 4,
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
                  suffixIcon: IconButton(
                    onPressed: () async {},
                    icon: SvgPicture.asset(
                      'assets/svg/calendar_icon.svg',
                      color: const Color(0xFF787878),
                      height: 22.0,
                    ),
                  ),
                  contentPadding: const EdgeInsets.only(top: 48.0, left: 12),
                  border: const OutlineInputBorder(),
                  label: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: const Color(0xFFE5F3FF)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/calendar_icon.svg",
                          color: const Color(0xFF3E78AA),
                          height: 24.0,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          " Start Date ",
                          style: Theme.of(context).textTheme.labelMedium!.merge(
                                const TextStyle(
                                  fontSize: 20.0,
                                  color: Color(0xFF3E78AA),
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
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: CustomContainer(
              child: TextField(
                controller: endDate,
                readOnly: true,
                style: Theme.of(context).textTheme.titleSmall,

                //maxLines: 4,
                onTap: () async {
                  var date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2023),
                    lastDate: DateTime(2025),
                  );
                  if (date != null) {
                    setState(() {
                      endDate.text =
                          "${numberList[date.day]}-${numberList[date.month]}-${date.year}";
                    });
                  }
                },
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.only(top: 48.0, left: 12),
                  suffixIcon: IconButton(
                    onPressed: () async {},
                    icon: SvgPicture.asset(
                      'assets/svg/calendar_icon.svg',
                      color: const Color(0xFF787878),
                      height: 22.0,
                    ),
                  ),
                  border: const OutlineInputBorder(),
                  label: Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 8.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: const Color(0xFFE5F3FF)),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          "assets/svg/calendar_icon.svg",
                          color: const Color(0xFF3E78AA),
                          height: 24.0,
                        ),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          " End Date ",
                          style: Theme.of(context).textTheme.labelMedium!.merge(
                                const TextStyle(
                                    fontSize: 20.0, color: Color(0xFF3E78AA)),
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
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
