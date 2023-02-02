import 'package:flutter/material.dart';
import 'package:m_skool_flutter/constants/constants.dart';
import 'package:m_skool_flutter/manager/student_details/api/get_exam_details.dart';
import 'package:m_skool_flutter/manager/student_details/model/subject_wise_model.dart';
import 'package:m_skool_flutter/widget/animated_progress_widget.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';

class ViewIndividualMarks extends StatelessWidget {
  final int miId;
  final int asmayId;
  final int emeId;
  final int amstId;
  final String examName;
  final String base;
  const ViewIndividualMarks(
      {super.key,
      required this.miId,
      required this.asmayId,
      required this.emeId,
      required this.amstId,
      required this.examName,
      required this.base});

  @override
  Widget build(BuildContext context) {
    int color = -1;
    return Scaffold(
      appBar: CustomAppBar(title: examName).getAppBar(),
      body: FutureBuilder<List<SubjectWiseDataModelValues>>(
          future: GetExamDetails.instance.getDetails(
              miId: miId,
              emeId: emeId,
              amstId: amstId,
              asmayId: asmayId,
              base: base),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data!.isEmpty) {
                return const Center(
                  child: AnimatedProgressWidget(
                    desc:
                        "There is no marks available for this exam.. Try with another",
                    title: "No Data found",
                    animationPath: "assets/json/nodata.json",
                    animatorHeight: 250,
                  ),
                );
              }
              return GridView.builder(
                  itemCount: snapshot.data!.length,
                  padding: const EdgeInsets.all(16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 150,
                      mainAxisSpacing: 16.0,
                      crossAxisSpacing: 16.0),
                  itemBuilder: (_, index) {
                    color += 1;
                    if (color % 6 == 0) {
                      color = 0;
                    }
                    return CustomContainer(
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                              color: noticeColor.elementAt(color),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12.0),
                                topRight: Radius.circular(12.0),
                              ),
                            ),
                            child: Text(
                              "${snapshot.data!.elementAt(index).iSMSIVRSSubjectName}",
                              style:
                                  Theme.of(context).textTheme.titleSmall!.merge(
                                        const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white,
                                        ),
                                      ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              const SizedBox(
                                height: 22.0,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${snapshot.data!.elementAt(index).eSTMPSObtainedMarks}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .merge(
                                          const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            // color: Colors.white,
                                            fontSize: 22.0,
                                          ),
                                        ),
                                  ),
                                  Text(
                                    "/${snapshot.data!.elementAt(index).eSTMPSMaxMarks}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleSmall!
                                        .merge(
                                          TextStyle(
                                            // fontWeight: FontWeight.w600,
                                            color: Colors.grey.shade700,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 8.0,
                              ),
                              Text(
                                "${snapshot.data!.elementAt(index).eSTMPSPassFailFlg}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .merge(
                                      TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: snapshot.data!
                                                    .elementAt(index)
                                                    .eSTMPSPassFailFlg!
                                                    .toLowerCase() ==
                                                "excellent"
                                            ? Colors.orange
                                            : snapshot.data!
                                                        .elementAt(index)
                                                        .eSTMPSPassFailFlg!
                                                        .toLowerCase() ==
                                                    "pass"
                                                ? Colors.green
                                                : Colors.red,
                                        fontSize: 22.0,
                                      ),
                                    ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  });
            }

            if (snapshot.hasError) {
              return Center(
                child: ErrWidget(
                  err: snapshot.error as Map<String, dynamic>,
                ),
              );
            }
            return const Center(
              child: AnimatedProgressWidget(
                animationPath: 'assets/json/default.json',
                desc: 'Please wait we are loading for you....',
                title: 'Loading Subject wise marks',
              ),
            );
          }),
    );
  }
}
