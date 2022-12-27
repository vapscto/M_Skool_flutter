import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';

class BirthdayItem extends StatelessWidget {
  const BirthdayItem({
    Key? key,
    required this.color,
  }) : super(key: key);

  final int color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: noticeBackgroundColor.elementAt(color),
        borderRadius: BorderRadius.circular(8.0),
      ),
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 36.0,
            backgroundColor: noticeColor.elementAt(color),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ankush",
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                const Text("BGHS1254"),
                const SizedBox(
                  height: 6.0,
                ),
                const Text("IX & A"),
              ],
            ),
          ),
          Text(
            "22-11-2011",
            style: Theme.of(context).textTheme.titleSmall!.merge(
                  const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
