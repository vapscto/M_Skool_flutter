import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/online_leave/widget/leaves.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class StaffHomeLeave extends StatefulWidget {
  const StaffHomeLeave({super.key});

  @override
  State<StaffHomeLeave> createState() => _StaffHomeLeaveState();
}

class _StaffHomeLeaveState extends State<StaffHomeLeave> {
  int backgroundColor = -1;
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Leaves",
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                ),
                const Icon(Icons.chevron_right_rounded),
              ],
            ),
          ),
          SizedBox(
            height: 80,
            child: ListView.separated(
                padding: const EdgeInsets.all(8.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  backgroundColor += 1;
                  if (backgroundColor % 6 == 0) {
                    backgroundColor = 0;
                  }
                  return LeaveNames(backgroundColor: backgroundColor);
                },
                separatorBuilder: (_, index) {
                  return const SizedBox(
                    width: 8.0,
                  );
                },
                itemCount: 5),
          ),
        ],
      ),
    );
  }
}
