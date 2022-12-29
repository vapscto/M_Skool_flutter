import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class AppliedLeaveItem extends StatelessWidget {
  final int color;
  const AppliedLeaveItem({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Suffering from Fever",
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Text(
                    "Sick Leave | 3 Days",
                    style: Theme.of(context).textTheme.labelSmall!.merge(
                          TextStyle(
                              letterSpacing: 0.2,
                              fontSize: 14.0,
                              color: Theme.of(context)
                                  .textTheme
                                  .labelMedium!
                                  .color),
                        ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: noticeBackgroundColor.elementAt(color)),
                        child: SvgPicture.asset(
                          'assets/svg/medication.svg',
                          color: noticeColor.elementAt(color),
                        ),
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Row(
                        children: [
                          Text(
                            "Leave From : ",
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      TextStyle(
                                        color: Theme.of(context)
                                            .textTheme
                                            .labelMedium!
                                            .color,
                                      ),
                                    ),
                          ),
                          Text(
                            "25th Oct - 27th Oct",
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Chip(
              label: Text(
                "Approved",
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      const TextStyle(
                        color: Colors.white,
                      ),
                    ),
              ),
              backgroundColor: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}
