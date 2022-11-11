import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/exam/screen/result_detail.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/vaps_container.dart';

class ExamHome extends StatelessWidget {
  const ExamHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 30,
        title: Text("Exam".tr),
        leading: const CustomGoBackButton(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          16.0,
        ),
        child: VapsContainer(
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.to(() => ResultDetail(resultType: 0));
                  },
                  child: CustomContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/exam.png",
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "Exam Wise".tr,
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 12.0,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Get.to(() => ResultDetail(resultType: 1));
                  },
                  child: CustomContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Image.asset(
                            "assets/images/book.png",
                            width: 100,
                            height: 100,
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                          Text(
                            "Subject Wise".tr,
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
