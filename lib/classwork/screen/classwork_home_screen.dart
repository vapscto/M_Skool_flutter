import 'package:flutter/material.dart';
import 'package:m_skool_flutter/classwork/screen/classwork_home.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/information/controller/hwcwnb_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';

class ClassWorkHomeScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final String title;
  final HwCwNbController hwCwNbController;
  const ClassWorkHomeScreen(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.hwCwNbController, required this.title});

  @override
  State<ClassWorkHomeScreen> createState() => _ClassWorkHomeScreenState();
}

class _ClassWorkHomeScreenState extends State<ClassWorkHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        leading: const CustomGoBackButton(),
        leadingWidth: 30,
        title: Text(widget.title),
      ),
        body: ClassworkHome(
      loginSuccessModel: widget.loginSuccessModel,
      mskoolController: widget.mskoolController,
      hwCwNbController: widget.hwCwNbController,
    ));
  }
}
