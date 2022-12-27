import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';

class StaffHomeScreen extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const StaffHomeScreen(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController});

  @override
  State<StaffHomeScreen> createState() => _StaffHomeScreen();
}

class _StaffHomeScreen extends State<StaffHomeScreen> {
  final GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/svg/menu.svg'),
          onPressed: () {
            _scaffold.currentState!.openDrawer();
          },
        ),
      ),
      drawer: const Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget
                    .loginSuccessModel.staffmobileappprivileges!.values!.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    onTap: () {
                      if (widget.loginSuccessModel.staffmobileappprivileges!
                              .values!
                              .elementAt(index)
                              .pagename ==
                          "Attendance Entry") {
                        return;
                      }
                    },
                    title: Text(widget
                        .loginSuccessModel.staffmobileappprivileges!.values!
                        .elementAt(index)
                        .pagename!),
                  );
                })
          ],
        ),
      ),
    );
  }
}
