import 'package:flutter/material.dart';

import 'package:m_skool_flutter/widget/custom_back_btn.dart';

class CustomAppBar {
  final String title;
  const CustomAppBar({required this.title});

  PreferredSizeWidget getAppBar() {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
      ),
      leadingWidth: 30.0,
      leading: const CustomGoBackButton(),
    );
  }
}
