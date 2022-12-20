import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/instance_manager.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/card_widget.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';

import '../main.dart';

class SchoolDetailsScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  const SchoolDetailsScreen({super.key, required this.loginSuccessModel});

  @override
  State<SchoolDetailsScreen> createState() => _SchoolDetailsScreenState();
}

class _SchoolDetailsScreenState extends State<SchoolDetailsScreen> {
  MskoolController mskoolController = Get.find<MskoolController>();
  @override
  Widget build(BuildContext context) {
    logger.d(mskoolController.universalInsCodeModel!.toJson());
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 30,
        title: const Text("School Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CardWidget(
              backgroundColor: const Color(0xFFFFF4E9),
              padding: const EdgeInsets.all(10),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      width: 120,
                      child: Text("Name"),
                    ),
                    const Text(":  "),
                    Flexible(
                      child: Text(
                        "${widget.loginSuccessModel.institutedetails!.values!.first.mIName}",
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 120,
                        child: Text("Address"),
                      ),
                      const Text(":  "),
                      Flexible(
                        child: Text(
                          "${widget.loginSuccessModel.institutedetails!.values!.first.mIAddress1}"
                          " ${widget.loginSuccessModel.institutedetails!.values!.first.mIAddress2},"
                          " ${widget.loginSuccessModel.institutedetails!.values!.first.mIAddress3}.",
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 120,
                        child: Text("E-mail Id"),
                      ),
                      const Text(":  "),
                      Flexible(
                        child: Text(
                            "${widget.loginSuccessModel.institutedetails!.values!.first}"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 120,
                        child: Text("Contact Number"),
                      ),
                      const Text(":  "),
                      Flexible(
                        child: Text(
                            "${widget.loginSuccessModel.institutedetails!.values!.first}"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 120,
                        child: Text("Website"),
                      ),
                      const Text(":  "),
                      Flexible(
                        child: Text(
                            "${widget.loginSuccessModel.institutedetails!.values!.first}"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SvgPicture.asset(
              "assets/svg/ShoolDetails.svg",
              // color: Colors.red,
            ),
            const SizedBox()
          ],
        ),
      ),
    );
  }
}
