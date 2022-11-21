import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m_skool_flutter/main.dart';

class FeeReceiptTab extends StatefulWidget {
  const FeeReceiptTab({super.key});

  @override
  State<FeeReceiptTab> createState() => _FeeReceiptTabState();
}

class _FeeReceiptTabState extends State<FeeReceiptTab> {
  List<String> academicYears = [
    "2017-2018",
    "2018-2019",
    "2019-2020",
    "2020-2021",
    "2021-2022",
  ];

  String selectedValue = "2021-2022";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Container(
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
              value: selectedValue,
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
                label: Text(
                  "Select Year",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .merge(TextStyle(color: Colors.grey.shade600)),
                ),
              ),
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 30,
              ),
              iconSize: 30,
              items: academicYears.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: Theme.of(context).textTheme.labelSmall!.merge(
                        const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16.0,
                            letterSpacing: 0.3)),
                  ),
                );
              }).toList(),
              onChanged: (s) {
                selectedValue = s!;
              },
            ),
          ),
        ],
      ),
    );
  }
}
