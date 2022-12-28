import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class Leaves extends StatefulWidget {
  const Leaves({super.key});

  @override
  State<Leaves> createState() => _LeavesState();
}

class _LeavesState extends State<Leaves> {
  int backgroundColor = -1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 88,
        // width: double.infinity,
        child: ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8.0),
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            backgroundColor += 1;

            if (index % 6 == 0) {
              backgroundColor = 0;
            }
            if (backgroundColor > 6) {
              backgroundColor = 0;
            }
            return SizedBox(
              width: Get.width * 0.38,
              child: CustomContainer(
                  child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircularProgressIndicator(
                          value: 0.5,
                          backgroundColor: noticeBackgroundColor
                              .elementAt(backgroundColor)
                              .withOpacity(0.8),
                          color: noticeColor.elementAt(backgroundColor),
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: SvgPicture.asset(
                              "assets/svg/medication.svg",
                              color: noticeColor.elementAt(backgroundColor),
                            )),
                      ],
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "08",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          Text(
                            "Sick Leave",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            );
          },
          itemCount: 5,
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 16.0,
            );
          },
        ),
      ),
    );
  }
}
