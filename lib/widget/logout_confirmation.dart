import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/global_utilities.dart';
import '../main.dart';
import '../screens/authentication_screen.dart';

class LogoutConfirmationPopup extends StatefulWidget {
  const LogoutConfirmationPopup({
    Key? key,
  }) : super(key: key);

  @override
  State<LogoutConfirmationPopup> createState() =>
      _LogoutConfirmationPopupState();
}

class _LogoutConfirmationPopupState extends State<LogoutConfirmationPopup>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 450), vsync: this);
    scaleAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.elasticInOut);
    animationController.addListener(() {
      // setState(() {});
    });
    animationController.forward();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: scaleAnimation,
      child: AlertDialog(
        title:
            Text("Logout".tr, style: Theme.of(context).textTheme.labelMedium),
        content: Text("Are you sure, you want to logout?".tr,
            style: Theme.of(context).textTheme.labelMedium),
        actions: [
          TextButton(
            onPressed: () async {
              Get.back();
              isPageLoading.value = true;
              bool isLoggedOut = await AuthenticationController().logout();
              if (isLoggedOut) {
                // widget.profileController.profileData.clear();
                // widget.profileController.dispose();
                await logInBox!.put("isLoggedIn", false);
                // await cookieBox!.put("session", null);
                Get.offAll(() => const AuthenticationScreen());
                isPageLoading.value = false;
                // exit(0);
              } else {
                isPageLoading.value = false;
              }
            },
            child: Text(
              "Yes".tr,
            ),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "No".tr,
            ),
          ),
        ],
      ),
    );
  }
}
