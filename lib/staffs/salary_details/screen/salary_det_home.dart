import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/global_utilities.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/staffs/salary_details/api/salary_details_api.dart';
import 'package:m_skool_flutter/staffs/salary_details/models/salary_detail_monthwise_model.dart';
import 'package:m_skool_flutter/staffs/salary_details/screen/salary_overall_det.dart';
import 'package:m_skool_flutter/staffs/salary_details/widget/salary_line_chart.dart';
import 'package:m_skool_flutter/staffs/salary_details/widget/salary_month_item.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
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
      body: FutureBuilder<List<SalaryDetailsMonthwiseValues>>(
          future: SalaryDetailsApi.instance.getSalary(
              miId: widget.loginSuccessModel.mIID!,
              userId: widget.loginSuccessModel.userId!,
              year: DateTime.now().year,
              base: baseUrlFromInsCode("portal", widget.mskoolController)),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
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
                        Chip(
                          label: Text(
                            "${DateTime.now().year} - ${DateTime.now().year + 1}",
                            style: const TextStyle(color: Color(0xFF28B6C8)),
                          ),
                          backgroundColor: const Color(0xFFDFFBFE),
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
                            const TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) {
                                  return SalaryOverallDetails(
                                    hresId:
                                        snapshot.data!.elementAt(index).hresId!,
                                    loginSuccessModel: widget.loginSuccessModel,
                                    month: snapshot.data!
                                        .elementAt(index)
                                        .monthName!,
                                    mskoolController: widget.mskoolController,
                                  );
                                }));
                              },
                              child: SalaryMonthItem(
                                color: color,
                                month:
                                    snapshot.data!.elementAt(index).monthName!,
                                salary: snapshot.data!.elementAt(index).salary!,
                              ));
                        }),
                  ],
                ),
              );
            }

            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }

            return const AnimatedProgressWidget(
                title: "Loading Salary Details",
                desc:
                    "Please wait while we load salary details and create a view for you.",
                animationPath: "assets/json/default.json");
          }),
    );
  }
}
