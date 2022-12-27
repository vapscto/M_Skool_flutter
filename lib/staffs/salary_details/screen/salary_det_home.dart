import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/salary_details/screen/salary_overall_det.dart';
import 'package:m_skool_flutter/staffs/salary_details/widget/salary_line_chart.dart';
import 'package:m_skool_flutter/staffs/salary_details/widget/salary_month_item.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/home_fab.dart';

class SalaryDetails extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const SalaryDetails(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<SalaryDetails> createState() => _SalaryDetailsState();
}

class _SalaryDetailsState extends State<SalaryDetails> {
  int color = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Salary Details").getAppBar(),
      floatingActionButton: const HomeFab(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Dashboard",
                  style: Theme.of(context).textTheme.titleSmall!.merge(
                        const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                ),
                const Chip(
                  label: Text(
                    "2022-2023",
                    style: TextStyle(color: Color(0xFF28B6C8)),
                  ),
                  backgroundColor: Color(0xFFDFFBFE),
                ),
              ],
            ),
            const SizedBox(
              height: 4.0,
            ),
            const SalaryLineChart(),
            const SizedBox(
              height: 16.0,
            ),
            Text(
              "Details",
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            GridView.builder(
                shrinkWrap: true,
                itemCount: 12,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12.0,
                  mainAxisExtent: 100,
                ),
                itemBuilder: (_, index) {
                  color += 1;
                  if (index % 6 == 0) {
                    color = 0;
                  }
                  if (color > 6) {
                    color = 0;
                  }
                  return InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) {
                          return const SalaryOverallDetails();
                        }));
                      },
                      child: SalaryMonthItem(color: color));
                }),
          ],
        ),
      ),
    );
  }
}
