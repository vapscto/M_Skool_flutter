import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:m_skool_flutter/widget/custom_back_btn.dart';

class SchoolDetailsScreen extends StatefulWidget {
  const SchoolDetailsScreen({super.key});

  @override
  State<SchoolDetailsScreen> createState() => _SchoolDetailsScreenState();
}

class _SchoolDetailsScreenState extends State<SchoolDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const CustomGoBackButton(),
        leadingWidth: 30,
        title: const Text("Profile"),
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
      body: Container(),
    );
  }
}
