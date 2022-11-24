import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';

class ProfileTab extends StatelessWidget {
  final MskoolController mskoolController;
  final LoginSuccessModel loginSuccessModel;
  const ProfileTab(
      {super.key,
      required this.mskoolController,
      required this.loginSuccessModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left_rounded,
            color: Colors.white,
            size: 34,
          ),
          onPressed: () {},
        ),
        leadingWidth: 30,
        title: Text("Profile"),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/svg/bell.svg'),
            onPressed: () {},
          ),
          const SizedBox(
            width: 8.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [],
        ),
      ),
    );
  }
}
