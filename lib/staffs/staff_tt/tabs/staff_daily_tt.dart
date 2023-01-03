import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class StaffDailyTT extends StatelessWidget {
  const StaffDailyTT({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 32.0,
          ),
          CustomContainer(
            child: DropdownButtonFormField<String>(
              value: fullMonths.first,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(16.0),
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
                label: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                      color: const Color(0xFFFFEBEA),
                      borderRadius: BorderRadius.circular(24.0)),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/calendar.png",
                        color: const Color(0xFFFF6F67),
                        height: 22.0,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        "Select Month",
                        style: Theme.of(context).textTheme.labelMedium!.merge(
                            const TextStyle(
                                fontSize: 20, color: Color(0xFFFF6F67))),
                      ),
                    ],
                  ),
                ),
              ),
              icon: const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.keyboard_arrow_down_rounded,
                  size: 30,
                ),
              ),
              iconSize: 30,
              items: List.generate(
                fullMonths.length,
                (index) => DropdownMenuItem<String>(
                  value: fullMonths.elementAt(index),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 12.0, left: 8, right: 8),
                    child: Text(
                      fullMonths.elementAt(index),
                      style: Theme.of(context).textTheme.labelSmall!.merge(
                          const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16.0,
                              letterSpacing: 0.3)),
                    ),
                  ),
                ),
              ),
              onChanged: (s) {
                // selectedValue = s;
                // asmayId.value = s!.asmaYId!;
                // setState(() {});
                // handler.updateSelectedInDropDown(s!);
                // handler.asmayId.value = s.asmaYId!;
                // logger.d(s.asmaYId);
                // reloadEvent();
              },
            ),
          ),
        ],
      ),
    );
  }
}
