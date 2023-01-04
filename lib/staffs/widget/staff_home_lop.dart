import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class StaffHomeLop extends StatelessWidget {
  const StaffHomeLop({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.width * 0.5 - 28,
      child: CustomContainer(
        child: Column(
          children: [
            ListTile(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              visualDensity:
                  const VisualDensity(vertical: VisualDensity.minimumDensity),
              title: Text(
                "LOP",
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
              ),
              trailing: const Chip(
                  backgroundColor: Color(0xFFFBCFCF),
                  label: Text(
                    "November",
                    style: TextStyle(color: Color(0xFFA83232)),
                  )),
            ),
            Image.asset(
              "assets/images/money.png",
              height: 60,
            ),
            // const SizedBox(
            //   height: 12.0,
            // ),
            Text(
              "₹5000",
              style: Theme.of(context).textTheme.titleMedium!.merge(
                    const TextStyle(
                      fontSize: 30.0,
                      color: Color(0xFFFF385C),
                    ),
                  ),
            ),
            const SizedBox(
              height: 4.0,
            ),
            Text(
              "15 day leave",
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    TextStyle(
                        fontSize: 18.0,
                        color: Theme.of(context).textTheme.labelMedium!.color,
                        fontWeight: FontWeight.normal),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
