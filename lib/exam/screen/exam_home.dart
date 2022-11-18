import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/exam/screen/result_detail.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';
import 'package:m_skool_flutter/widget/vaps_container.dart';

class ExamHome extends StatefulWidget {
  const ExamHome({super.key});

  @override
  State<ExamHome> createState() => _ExamHomeState();
}

class _ExamHomeState extends State<ExamHome> with TickerProviderStateMixin {
  TabController? tabController;

  List<Widget> pages = const [
    ResultDetail(resultType: 0),
    ResultDetail(resultType: 1),
  ];

  RxInt currentPage = RxInt(0);

  final PageController pageController = PageController();
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController!.addListener(() {
      pageController.animateToPage(tabController!.index,
          duration: const Duration(milliseconds: 800),
          curve: Curves.fastLinearToSlowEaseIn);
    });
    pageController.addListener(() {
      currentPage.value = tabController!.index;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("Build");
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leadingWidth: 30,
        title: Text("Exam".tr),
        leading: const CustomGoBackButton(),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 12.0,
            ),
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            child: Obx(() {
              return TabBar(
                onTap: (index) {},
                controller: tabController!,
                unselectedLabelColor: Colors.white,
                labelColor: Colors.black,
                indicator: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.0),
                    topRight: Radius.circular(12.0),
                  ),
                  color: Colors.white,
                ),
                tabs: [
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentPage.value == 0
                            ? SvgPicture.asset('assets/svg/exam_ic.svg')
                            : const SizedBox(),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "Exam Wise",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                TextStyle(
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.1,
                                    color: currentPage.value != 0
                                        ? Colors.white
                                        : Colors.black),
                              ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        currentPage.value == 1
                            ? SvgPicture.asset('assets/svg/exam_ic.svg')
                            : const SizedBox(),
                        const SizedBox(
                          width: 6.0,
                        ),
                        Text(
                          "Subject Wise",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                                TextStyle(
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.1,
                                    color: currentPage.value != 1
                                        ? Colors.white
                                        : Colors.black),
                              ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            }),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              height: Get.height,
              child: PageView.builder(
                  onPageChanged: (newPage) {
                    tabController!.animateTo(newPage);
                  },
                  controller: pageController,
                  itemCount: pages.length,
                  itemBuilder: (_, index) {
                    return pages.elementAt(index);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

// class OldRow extends StatelessWidget {
//   const OldRow({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               Get.to(() => ResultDetail(resultType: 0));
//             },
//             child: CustomContainer(
//               gradient: const LinearGradient(
//                   colors: [Color(0xFF147278), Color(0xFFB7F1E7)]),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       "assets/images/exam.png",
//                       width: 100,
//                       height: 100,
//                     ),
//                     const SizedBox(
//                       height: 6.0,
//                     ),
//                     Text(
//                       "Exam Wise".tr,
//                       style: Theme.of(context).textTheme.titleMedium,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         const SizedBox(
//           width: 12.0,
//         ),
//         Expanded(
//           child: InkWell(
//             onTap: () {
//               Get.to(() => ResultDetail(resultType: 1));
//             },
//             child: CustomContainer(
//               gradient: const LinearGradient(
//                   colors: [Color(0xFFBe6D84), Color(0xFFFFD5c5)]),
//               child: Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Column(
//                   children: [
//                     Image.asset(
//                       "assets/images/book.png",
//                       width: 100,
//                       height: 100,
//                     ),
//                     const SizedBox(
//                       height: 6.0,
//                     ),
//                     Text(
//                       "Subject Wise".tr,
//                       style: Theme.of(context).textTheme.titleMedium,
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
