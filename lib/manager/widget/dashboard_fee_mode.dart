import 'package:flutter/material.dart';
import 'package:m_skool_flutter/manager/controller/manager_dashboard_controller.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class DashboardFeeMode extends StatelessWidget {
  final ManagerDashboardController dashboardController;
  const DashboardFeeMode({super.key, required this.dashboardController});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: Get.width * 0.5 - 28,
      child: CustomContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 4.0),
                  visualDensity: const VisualDensity(
                      vertical: VisualDensity.minimumDensity),
                  title: Text(
                    "Fee Collection",
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                          const TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                  ),
                  // trailing: Text(
                  //     getFormatedDate(DateTime.parse(values.punchdate!))
                  //         .substring(
                  //             0,
                  //             getFormatedDate(DateTime.parse(values.punchdate!))
                  //                     .length -
                  //                 2)
                  //         .trim(),
                  //     style: Theme.of(context).textTheme.titleSmall),
                ),
                Image.asset(
                  "assets/images/money.png",
                  width: 50,
                ),
                Text(
                  "₹${dashboardController.feeDetails.first.totalAmount}",
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0,
                        ),
                      ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
              ],
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: const Color(0xFFE5FFF3)),
              child: Text(
                "${dashboardController.feeDetails.first.totalPaidOnline} Student paid fee through online fee payment",
                style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(color: Color(0xFF269962), fontSize: 13.0)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
