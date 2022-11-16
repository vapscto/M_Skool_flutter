import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/attendance/screens/home_page.dart';
import 'package:m_skool_flutter/certificates/screens/cert_home.dart';
import 'package:m_skool_flutter/coe/screen/coe_home.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';
import 'package:m_skool_flutter/exam/screen/exam_home.dart';
import 'package:m_skool_flutter/feedback/screens/feedback_home.dart';
import 'package:m_skool_flutter/fees/screens/fee_receipt_home.dart';
import 'package:m_skool_flutter/library/screen/library_home.dart';
import 'package:m_skool_flutter/notice/screen/notice_home.dart';
import 'package:m_skool_flutter/timetable/screens/time_table_home.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  RxInt pageNumber = 0.obs;
  RxString keyWord = "".obs;
  TextEditingController textEditingController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CustomThemeData.changeStatusBarColor(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Under Construction",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              "Contains navigation for all the category, this screen will change when ui is available",
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListTile(
              tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                child: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Attendance",
              ),
              subtitle: const Text("Opens attendance screen"),
              onTap: () {
                Get.to(() => const AttendanceHomeScreen());
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListTile(
              tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                child: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Notice",
              ),
              subtitle: const Text("Opens Notice screen"),
              onTap: () {
                Get.to(() => const NoticeHome());
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListTile(
              tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                child: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Feedback",
              ),
              subtitle: const Text("Opens Feedback screen"),
              onTap: () {
                Get.to(() => const FeedBackHome());
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListTile(
              tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                child: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Exam",
              ),
              subtitle: const Text("Opens Exam screen"),
              onTap: () {
                Get.to(() => const ExamHome());
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListTile(
              tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                child: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Library",
              ),
              subtitle: const Text("Opens Library screen"),
              onTap: () {
                Get.to(() => const LibraryHome());
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListTile(
              tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                child: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Time table",
              ),
              subtitle: const Text("Opens Time table screen"),
              onTap: () {
                Get.to(() => const TimeTableHome());
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListTile(
              tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                child: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Fee Receipt",
              ),
              subtitle: const Text("Opens Time Fee screen"),
              onTap: () {
                Get.to(() => const FeeReceiptHome());
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListTile(
              tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                child: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "Certificate",
              ),
              subtitle: const Text("Opens Time Certificate screen"),
              onTap: () {
                Get.to(() => const CertificateHomeScreen());
              },
            ),
            const SizedBox(
              height: 16.0,
            ),
            ListTile(
              tileColor: Theme.of(context).primaryColor.withOpacity(0.2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade200,
                child: const Icon(
                  Icons.date_range_outlined,
                  color: Colors.white,
                ),
              ),
              title: const Text(
                "COE",
              ),
              subtitle: const Text("Opens Time COE screen"),
              onTap: () {
                Get.to(() => const CoeHome());
              },
            )
          ],
        ),
      ),
    );
  }
}
