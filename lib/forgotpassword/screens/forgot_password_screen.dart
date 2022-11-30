import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/forgotpassword/screens/select_verification_type.dart';

import 'package:m_skool_flutter/widget/custom_app_bar.dart';
import 'package:m_skool_flutter/widget/custom_container.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Theme.of(context).primaryColor,
      appBar: const CustomAppBar(title: "Forgot Password").getAppBar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              height: Get.height * 0.44,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Column(children: [
                const SizedBox(
                  height: 16.0,
                ),
                SvgPicture.asset('assets/svg/fp.svg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 7,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Container(
                      height: 7,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    const SizedBox(
                      width: 12.0,
                    ),
                    Container(
                      height: 7,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade400,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: Get.height * 0.4),
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Forgot Password ?",
                    style: Theme.of(context).textTheme.titleMedium!.merge(
                          const TextStyle(fontSize: 20.0),
                        ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                    "Enter your User name below to receieve the forgot password instructions.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 36.0,
                  ),
                  CustomContainer(
                    child: TextField(
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                            TextStyle(
                                fontSize: 18,
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color),
                          ),
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          labelStyle:
                              Theme.of(context).textTheme.labelSmall!.merge(
                                    TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.3,
                                      color: Theme.of(context)
                                          .textTheme
                                          .labelMedium!
                                          .color,
                                    ),
                                  ),
                          // hintText: "Eg: Demo0485",
                          // floatingLabelBehavior: FloatingLabelBehavior.always,
                          label: const Text(
                            "User Name",
                          )),
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  Center(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24.0),
                            ),
                            minimumSize: Size(Get.width * 0.4, 50)),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) {
                                return SelectVerificationType();
                              },
                            ),
                          );
                        },
                        child: Text(
                          "Continue",
                          style: Theme.of(context).textTheme.titleSmall!.merge(
                              const TextStyle(
                                  color: Colors.white, fontSize: 18.0)),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
