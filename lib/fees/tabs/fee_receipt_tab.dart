import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_titled_container/flutter_titled_container.dart';

import '../widgets/receiptno_card.dart';

class FeeReceiptTab extends StatefulWidget {
  const FeeReceiptTab({super.key});

  @override
  State<FeeReceiptTab> createState() => _FeeReceiptTabState();
}

class _FeeReceiptTabState extends State<FeeReceiptTab> {
  final ScrollController _controller = ScrollController();
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
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
            const SizedBox(height: 35),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 106,
                  padding: const EdgeInsets.only(left: 15, top: 10, bottom: 10),
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
                    thickness: 6,
                    thumbVisibility: true,
                    controller: _controller,
                    child: ListView.builder(
                      controller: _controller,
                      itemCount: 10,
                      itemBuilder: (context, indext) {
                        return ReceiptNoCard();
                      },
                    ),
                  ),
                ),
                const Positioned(
                  top: -10,
                  left: 17,
                  child: Text(
                    'Receipt No.',
                    style: TextStyle(color: Color.fromRGBO(137, 137, 137, 1)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
          onPressed: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 40),
            child: Text(
              'Generate PDF',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
