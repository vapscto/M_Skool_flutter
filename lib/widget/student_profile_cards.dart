import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/feedback/screens/feedback_home.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/profile_items_card_widget.dart';

class StudentProfileCards extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const StudentProfileCards(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 18,
      crossAxisSpacing: 12,
      childAspectRatio: 2.5,
      children: [
        ProfileItemsCard(
          cardColor: const Color(0xFFFAEFFE),
          logoAsset: "assets/images/ClassTeacher.png",
          title: "Class Teacher",
          onTap: () {},
        ),
        ProfileItemsCard(
          cardColor: const Color(0xFFECF8FF),
          logoAsset: "assets/images/SubjectTeacher.png",
          title: "Subject Teacher",
          onTap: () {},
        ),
        ProfileItemsCard(
          cardColor: const Color(0xFFFFEBD4),
          logoAsset: "assets/images/SchoolDetails.png",
          title: "School Details",
          onTap: () {},
        ),
        ProfileItemsCard(
          cardColor: const Color(0xFFFFE1E1),
          logoAsset: "assets/images/WriteTo.png",
          title: "Write To",
          onTap: () {
            Get.to(() => FeedBackHome(
                loginSuccessModel: loginSuccessModel,
                mskoolController: mskoolController));
          },
        )
      ],
    );
    // return Padding(
    //   padding: const EdgeInsets.all(8.0),
    //   child: Wrap(
    //     // crossAxisCount: 2,
    //     // spacing: 10,
    //     // runSpacing: 5,
    //     // alignment: WrapAlignment.spaceBetween,
    //     // runAlignment: WrapAlignment.spaceBetween,
    //     // crossAxisAlignment: WrapCrossAlignment.start,
    //     // // crossAxisCount: 2,
    //     // childAspectRatio: 0.3,
    //     children: [
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           decoration: BoxDecoration(
    //             border: const Border.fromBorderSide(BorderSide.none),
    //             backgroundBlendMode: BlendMode.overlay,
    //             borderRadius: BorderRadius.circular(15),
    //             color: Theme.of(context).cardTheme.color,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Theme.of(context).shadowColor,
    //                 // offset: const Offset(-5, -5),
    //                 blurRadius: 5,
    //                 blurStyle: BlurStyle.normal,
    //               ),
    //               // BoxShadow(
    //               //   color: Theme.of(context).shadowColor,
    //               //   // offset: const Offset(5, 5),
    //               //   blurRadius: 5,
    //               //   blurStyle: BlurStyle.normal,
    //               // ),
    //             ],
    //           ),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(15),
    //               color: const Color(0xFFFAEFFE),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: const [
    //                   CircleAvatar(
    //                     radius: 25,
    //                     backgroundImage: AssetImage(
    //                       "assets/images/ClassTeacher.png",
    //                     ),
    //                     backgroundColor: Colors.white,
    //                   ),
    //                   Text("dfghbjkn"),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           decoration: BoxDecoration(
    //             border: const Border.fromBorderSide(BorderSide.none),
    //             backgroundBlendMode: BlendMode.overlay,
    //             borderRadius: BorderRadius.circular(15),
    //             color: Theme.of(context).cardTheme.color,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Theme.of(context).shadowColor,
    //                 // offset: const Offset(-5, -5),
    //                 blurRadius: 5,
    //                 blurStyle: BlurStyle.normal,
    //               ),
    //               // BoxShadow(
    //               //   color: Theme.of(context).shadowColor,
    //               //   // offset: const Offset(5, 5),
    //               //   blurRadius: 5,
    //               //   blurStyle: BlurStyle.normal,
    //               // ),
    //             ],
    //           ),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(15),
    //               color: const Color(0xFFFAEFFE),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: const [
    //                   CircleAvatar(
    //                     radius: 25,
    //                     backgroundImage: AssetImage(
    //                       "assets/images/ClassTeacher.png",
    //                     ),
    //                     backgroundColor: Colors.white,
    //                   ),
    //                   Text("dfghbjkn"),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           decoration: BoxDecoration(
    //             border: const Border.fromBorderSide(BorderSide.none),
    //             backgroundBlendMode: BlendMode.overlay,
    //             borderRadius: BorderRadius.circular(15),
    //             color: Theme.of(context).cardTheme.color,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Theme.of(context).shadowColor,
    //                 // offset: const Offset(-5, -5),
    //                 blurRadius: 5,
    //                 blurStyle: BlurStyle.normal,
    //               ),
    //               // BoxShadow(
    //               //   color: Theme.of(context).shadowColor,
    //               //   // offset: const Offset(5, 5),
    //               //   blurRadius: 5,
    //               //   blurStyle: BlurStyle.normal,
    //               // ),
    //             ],
    //           ),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(15),
    //               color: const Color(0xFFFAEFFE),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: const [
    //                   CircleAvatar(
    //                     radius: 25,
    //                     backgroundImage: AssetImage(
    //                       "assets/images/ClassTeacher.png",
    //                     ),
    //                     backgroundColor: Colors.white,
    //                   ),
    //                   Text("dfghbjkn"),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //       Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           decoration: BoxDecoration(
    //             border: const Border.fromBorderSide(BorderSide.none),
    //             backgroundBlendMode: BlendMode.overlay,
    //             borderRadius: BorderRadius.circular(15),
    //             color: Theme.of(context).cardTheme.color,
    //             boxShadow: [
    //               BoxShadow(
    //                 color: Theme.of(context).shadowColor,
    //                 // offset: const Offset(-5, -5),
    //                 blurRadius: 5,
    //                 blurStyle: BlurStyle.normal,
    //               ),
    //               // BoxShadow(
    //               //   color: Theme.of(context).shadowColor,
    //               //   // offset: const Offset(5, 5),
    //               //   blurRadius: 5,
    //               //   blurStyle: BlurStyle.normal,
    //               // ),
    //             ],
    //           ),
    //           child: Container(
    //             decoration: BoxDecoration(
    //               borderRadius: BorderRadius.circular(15),
    //               color: const Color(0xFFFAEFFE),
    //             ),
    //             child: Padding(
    //               padding: const EdgeInsets.all(8.0),
    //               child: Row(
    //                 mainAxisSize: MainAxisSize.min,
    //                 children: const [
    //                   CircleAvatar(
    //                     radius: 25,
    //                     backgroundImage: AssetImage(
    //                       "assets/images/ClassTeacher.png",
    //                     ),
    //                     backgroundColor: Colors.white,
    //                   ),
    //                   Text("dfghbjkn"),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
