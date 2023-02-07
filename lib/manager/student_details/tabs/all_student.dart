import 'package:flutter/material.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/manager/student_details/controller/custom_search_handler.dart';
import 'package:m_skool_flutter/manager/student_details/widgets/type_handler.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';

class AllStudent extends StatelessWidget {
  final LoginSuccessModel loginSuccessModel;
  final MskoolController mskoolController;
  final CustomSearchHandler handler;

  const AllStudent(
      {super.key,
      required this.loginSuccessModel,
      required this.mskoolController,
      required this.handler});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchTypeHandler(
            handler: handler,
          )
        ],
      ),
    );
  }
}
