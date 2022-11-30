import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Change Password").getAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Create New Password",
              style: Theme.of(context).textTheme.titleMedium!.merge(
                    const TextStyle(fontSize: 20.0),
                  ),
            ),
            const SizedBox(
              height: 8.0,
            ),
            Text(
              "Your new password must be different from the previous used passwords.",
              style: Theme.of(context).textTheme.titleSmall!.merge(
                    const TextStyle(fontSize: 16.0),
                  ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Previous Password",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .merge(const TextStyle(fontSize: 16.0)),
            ),
            const SizedBox(
              height: 8.0,
            ),
            CustomContainer(
              child: TextField(
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      TextStyle(
                          fontSize: 16,
                          color:
                              Theme.of(context).textTheme.titleMedium!.color),
                    ),
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    border: InputBorder.none,
                    hintText: " Enter your previous password"),
              ),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Text(
              "New Password",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .merge(const TextStyle(fontSize: 16.0)),
            ),
            const SizedBox(
              height: 8.0,
            ),
            CustomContainer(
              child: TextField(
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      TextStyle(
                          fontSize: 16,
                          color:
                              Theme.of(context).textTheme.titleMedium!.color),
                    ),
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    border: InputBorder.none,
                    hintText: " Enter your new password"),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              "Confirm Password",
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .merge(const TextStyle(fontSize: 16.0)),
            ),
            const SizedBox(
              height: 8.0,
            ),
            CustomContainer(
              child: TextField(
                style: Theme.of(context).textTheme.titleSmall!.merge(
                      TextStyle(
                          fontSize: 16,
                          color:
                              Theme.of(context).textTheme.titleMedium!.color),
                    ),
                decoration: const InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
                    border: InputBorder.none,
                    hintText: " Confirm your new password"),
              ),
            ),
            const SizedBox(
              height: 48.0,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      minimumSize: Size(Get.width * 0.6, 50)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return ResetPassword();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "Save Password",
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                        const TextStyle(color: Colors.white, fontSize: 18.0)),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
