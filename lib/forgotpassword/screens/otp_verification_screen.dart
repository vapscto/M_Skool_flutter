import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/config/themes/theme_data.dart';

import 'package:m_skool_flutter/forgotpassword/screens/change_password.dart';
import 'package:m_skool_flutter/widget/custom_app_bar.dart';

import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SvgPicture.asset('assets/svg/verification.svg'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                    const SizedBox(
                      width: 12.0,
                    ),
                    Container(
                      height: 7,
                      width: 30,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              width: double.infinity,
              margin: EdgeInsets.only(top: Get.height * 0.39),
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
                    "Verification Code",
                    style: Theme.of(context).textTheme.titleMedium!.merge(
                          const TextStyle(fontSize: 20.0),
                        ),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  const Text(
                    "We’ve send the verification code on +91-9876543210.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  // PinCodeTextField(
                  //   appContext: context,
                  //   boxShadows: CustomThemeData.getShadow(),
                  //   length: 6,
                  //   backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  //   onChanged: (e) {},
                  //   pinTheme: PinTheme(
                  //     shape: PinCodeFieldShape.box,
                  //     borderRadius: BorderRadius.circular(12.0),
                  //   ),
                  // ),

                  const SizedBox(
                    height: 16.0,
                  ),
                  Pinput(
                    length: 6,
                    defaultPinTheme: PinTheme(
                      //padding: const EdgeInsets.all(16.0),
                      width: 56,
                      height: 56,
                      textStyle: Theme.of(context).textTheme.titleMedium!,
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: CustomThemeData.getShadow(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 6.0),
                          ),
                          child: Text(
                            "Resend Code",
                            style:
                                Theme.of(context).textTheme.titleSmall!.merge(
                                      const TextStyle(
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                          )),
                      Text(
                        "0:05",
                        style: Theme.of(context).textTheme.titleSmall!.merge(
                              const TextStyle(
                                  // decoration: TextDecoration.underline,
                                  color: Color(0xFFFF828A)),
                            ),
                      ),
                    ],
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
                                return ChangePassword();
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
