import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';

class InboxTabStaff extends StatefulWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  const InboxTabStaff({
    super.key,
    required this.loginSuccessModel,
    required this.mskoolController,
  });

  @override
  State<InboxTabStaff> createState() => _InboxTabStaffState();
}

class _InboxTabStaffState extends State<InboxTabStaff> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
