import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class CoeHome extends StatefulWidget {
  const CoeHome({super.key});

  @override
  State<CoeHome> createState() => _CoeHomeState();
}

class _CoeHomeState extends State<CoeHome> {
  List<String> dummySession = [
    "2017-2018",
    "2018-2019",
    "2019-2020",
    "2020-2021",
    "2021-2022",
  ];

  String selectedValue = "2021-2022";

  String selectedMonth = "September";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "COE".tr).getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 8.0,
                ),
                CustomContainer(
                  child: DropdownButtonFormField<String>(
                    value: selectedValue,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(12.0),
                      // ),

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

                      label: Text(
                        "Academic Year".tr,
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
                    items: List.generate(
                      dummySession.length,
                      (index) => DropdownMenuItem(
                        value: dummySession.elementAt(index),
                        child: Text(
                          dummySession.elementAt(index),
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                              const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.0,
                                  letterSpacing: 0.3)),
                        ),
                      ),
                    ),
                    onChanged: (s) {},
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                CustomContainer(
                  child: DropdownButtonFormField<String>(
                    value: selectedMonth,
                    decoration: InputDecoration(
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(12.0),
                      // ),

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

                      label: Text(
                        "Select Month".tr,
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
                    items: List.generate(
                      fullMonths.length,
                      (index) => DropdownMenuItem(
                        value: fullMonths.elementAt(index),
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
                    onChanged: (s) {},
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListView.separated(
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return CoeItem(
                    showImage: index == 0 ? true : false,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 16.0,
                  );
                },
                itemCount: 2),
          ],
        ),
      ),
    );
  }
}

class CoeItem extends StatelessWidget {
  final bool showImage;
  const CoeItem({Key? key, required this.showImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Container(
        color: Color.fromARGB(103, 238, 232, 255),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    "Teacher day",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
                PopupMenuButton(
                  splashRadius: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(9.0)),
                  itemBuilder: (_) {
                    return [
                      PopupMenuItem(
                        onTap: () {},
                        child: Text(
                          "View File".tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () {},
                        child: Text(
                          "View Video".tr,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ];
                  },
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "5 Sept",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Row(
                children: [
                  Icon(
                    Icons.watch_later_outlined,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Text(
                    "09:00 - 06:00 pm",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ],
              ),
            ),
            !showImage
                ? const SizedBox(
                    height: 16.0,
                  )
                : Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    height: 180,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://images.unsplash.com/photo-1531686264889-56fdcabd163f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80")),
                      borderRadius: BorderRadius.circular(
                        16.0,
                      ),
                      color: Colors.blueAccent.shade100.withOpacity(0.2),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
