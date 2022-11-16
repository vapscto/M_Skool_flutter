import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';

class CustomAppBar {
  final String title;
  const CustomAppBar({required this.title});

  PreferredSizeWidget getAppBar() {
    return AppBar(
      title: Text(
        title,
      ),
      leadingWidth: 30.0,
      leading: const CustomGoBackButton(),
    );
  }
}
