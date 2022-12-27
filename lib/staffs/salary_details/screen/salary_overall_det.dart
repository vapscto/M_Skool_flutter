import 'package:flutter/material.dart';
import 'package:m_skool_flutter/staffs/salary_details/widget/salary_breakdown_item.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class SalaryOverallDetails extends StatelessWidget {
  const SalaryOverallDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "January").getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Earning Amount",
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomContainer(
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF8FFFF),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListView.separated(
                  padding: const EdgeInsets.all(12.0),
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    return const SalaryBreakDown();
                  },
                  separatorBuilder: (_, index) {
                    return const SizedBox(
                      height: 12.0,
                    );
                  },
                  itemCount: 7,
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomContainer(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 24.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF6F5),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "PF",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "3706",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "PT",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "306",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "Loan",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          "706",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 24.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        color: const Color(0xFFE9F7FF)),
                    child: Column(
                      children: [
                        Text(
                          "Total Earnings",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "51000",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 24.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          8.0,
                        ),
                        color: const Color(0xFFF9FFEB)),
                    child: Column(
                      children: [
                        Text(
                          "Total Deductions",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "1000",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                const TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16.0,
            ),
            CustomContainer(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFEFF3FF),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: ListTile(
                  title: Text(
                    "Net Salary",
                    style: Theme.of(context).textTheme.titleMedium!.merge(
                        TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.0)),
                  ),
                  trailing: Text(
                    "₹ 51000",
                    style: Theme.of(context).textTheme.titleMedium!.merge(
                        TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: 20.0)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
