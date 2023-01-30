import 'package:flutter/material.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

class ManagerStudentDetails extends StatelessWidget {
  const ManagerStudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Student Details",
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 55),
          child: Container(
            color: Theme.of(context).primaryColor,
          ),
        ),
      ).getAppBar(),
    );
  }
}
