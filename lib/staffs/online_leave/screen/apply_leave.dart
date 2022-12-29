import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/online_leave/widget/apply_leave_widget.dart';
import 'package:m_skool_flutter/staffs/online_leave/widget/leaves.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class ApplyForLeave extends StatefulWidget {
  const ApplyForLeave({super.key});

  @override
  State<ApplyForLeave> createState() => _ApplyForLeaveState();
}

class _ApplyForLeaveState extends State<ApplyForLeave> {
  //RxBool isHalfDay = RxBool(false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Apply Leave").getAppBar(),
      body: SingleChildScrollView(
        // padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: ApplyLeaveWidget(),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Add Leave",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .merge(const TextStyle(fontWeight: FontWeight.w600)),
              ),
            ),
            // const SizedBox(
            //   height: 16.0,
            // ),
            const Leaves(),
          ],
        ),
      ),
    );
  }
}
