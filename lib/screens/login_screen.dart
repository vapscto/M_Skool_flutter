import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:m_skool_flutter/apis/authenticate_user_api.dart';
import 'package:m_skool_flutter/controller/mskoll_controller.dart';
import 'package:m_skool_flutter/main.dart';
import 'package:m_skool_flutter/model/categories_api_item.dart';
import 'package:m_skool_flutter/model/login_success_model.dart';
import 'package:m_skool_flutter/screens/home.dart';
import 'package:m_skool_flutter/widget/err_widget.dart';
import 'package:m_skool_flutter/widget/pgr_widget.dart';

class LoginScreen extends StatefulWidget {
  final MskoolController mskoolController;
  const LoginScreen({super.key, required this.mskoolController});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController password = TextEditingController();
  RxBool showPassword = RxBool(false);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // extendBody: true,
      // appBar: AppBar(
      //   backgroundColor: Colors.transparent,

      // ),
      body: Stack(
        children: [
          Container(
              //padding: const EdgeInsets.only(bottom: 128.0),
              height: Get.height * 0.39,
              width: double.infinity,
              color: Theme.of(context).primaryColor,
              child: Image.asset(
                "assets/images/stars.png",
                //height: Get.width * 0.2,
                fit: BoxFit.cover,
              )),
          Container(
            margin: EdgeInsets.only(top: Get.height * 0.36),
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/vpslogo.png",
                        height: 40,
                      ),
                      const SizedBox(
                        width: 12.0,
                      ),
                      Text(
                        "VAPS International School",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Text(
                    "USER ID",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  TextField(
                    controller: userName,
                    style: Theme.of(context).textTheme.titleSmall!.merge(
                        TextStyle(
                            color:
                                Theme.of(context).textTheme.titleMedium!.color,
                            fontSize: 17)),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(18.0),
                      filled: true,
                      isDense: false,
                      fillColor: Theme.of(context)
                          .colorScheme
                          .secondary
                          .withOpacity(0.5),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14.0),
                        borderSide: const BorderSide(color: Colors.transparent),
                      ),
                      hintText: 'User Id',
                      //label: Text("Institutional Code"),
                      prefixIcon: Container(
                        margin: EdgeInsets.only(bottom: 2.0),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SvgPicture.asset(
                            'assets/svg/profile.svg',
                            color: Color.fromARGB(188, 30, 60, 194),
                            height: 24.0,
                            width: 24.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24.0,
                  ),
                  Text(
                    "PASSWORD",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Obx(() {
                    return TextField(
                      controller: password,
                      obscureText: !showPassword.value,
                      style: Theme.of(context).textTheme.titleSmall!.merge(
                          TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .color,
                              fontSize: 17)),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(18.0),
                          isDense: true,
                          filled: true,
                          fillColor: Theme.of(context)
                              .colorScheme
                              .secondary
                              .withOpacity(0.5),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14.0),
                            borderSide:
                                const BorderSide(color: Colors.transparent),
                          ),
                          hintText: 'Password',
                          //label: Text("Institutional Code"),
                          prefixIcon: Container(
                            margin: const EdgeInsets.only(bottom: 2.0),
                            child: const Icon(
                              Icons.lock_outline,
                              color: Color.fromARGB(188, 30, 60, 194),
                              size: 24,
                            ),
                          ),
                          suffixIcon: InkWell(
                              onTap: () {
                                showPassword.value = !showPassword.value;
                              },
                              child: showPassword.value
                                  ? const Icon(
                                      Icons.visibility_off_outlined,
                                      size: 24.0,
                                    )
                                  : const Icon(
                                      Icons.visibility,
                                      size: 24.0,
                                    ))),
                    );
                  }),
                  // TextField(
                  //   controller: userName,
                  //   decoration: const InputDecoration(
                  //     filled: true,
                  //     label: Text(
                  //       "Username",
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 16.0,
                  // ),
                  // TextField(
                  //   controller: password,
                  //   obscureText: true,
                  //   decoration: const InputDecoration(
                  //     filled: true,
                  //     label: Text(
                  //       "Password",
                  //     ),
                  //   ),
                  // ),
                  // const SizedBox(
                  //   height: 16.0,
                  // ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "FORGOT PASSWORD ?",
                          style: Theme.of(context).textTheme.labelSmall!.merge(
                                const TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Color(0xFF666FB0),
                                ),
                              ),
                        )),
                  ),
                  const SizedBox(
                    height: 36.0,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        if (userName.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please provide a valid username");
                          return;
                        }
                        if (password.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please provide a valid password");
                        }

                        // AndroidDeviceInfo info = await DeviceInfoPlugin().androidInfo;
                        // logger.d(info.toMap());

                        String loginBaseUrl = "";
                        for (int i = 0;
                            i <
                                widget.mskoolController.universalInsCodeModel!
                                    .value.apiarray.values.length;
                            i++) {
                          final CategoriesApiItem apiItem = widget
                              .mskoolController
                              .universalInsCodeModel!
                              .value
                              .apiarray
                              .values
                              .elementAt(i);
                          if (apiItem.iivrscurLAPIName.toLowerCase() ==
                              "login") {
                            loginBaseUrl = apiItem.iivrscurLAPIURL;
                          }
                        }
                        await Future.delayed(const Duration(milliseconds: 200));
                        showDialog(
                            context: context,
                            builder: (_) {
                              return Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16.0),
                                ),
                                child: FutureBuilder<LoginSuccessModel>(
                                    future: AuthenticateUserApi.instance
                                        .authenticateNow(
                                      userName.text,
                                      password.text,
                                      widget.mskoolController
                                          .universalInsCodeModel!.value.miId,
                                      loginBaseUrl,
                                    ),
                                    builder: (_, snapshot) {
                                      if (snapshot.hasData) {
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              CircleAvatar(
                                                backgroundColor:
                                                    Colors.grey.shade100,
                                                radius: 36.0,
                                                backgroundImage: NetworkImage(
                                                    snapshot
                                                        .data!.userImagePath!),
                                              ),
                                              const SizedBox(
                                                height: 16.0,
                                              ),
                                              Text(
                                                snapshot.data!.userName!,
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .titleMedium!
                                                    .merge(
                                                      const TextStyle(
                                                          fontSize: 20.0),
                                                    ),
                                              ),
                                              const SizedBox(
                                                height: 8.0,
                                              ),
                                              Text(
                                                "Welcom back ${snapshot.data!.userName}, you can now continue to home screen",
                                                textAlign: TextAlign.center,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .labelMedium!,
                                              ),
                                              const SizedBox(
                                                height: 16.0,
                                              ),
                                              ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  minimumSize: const Size(
                                                    double.infinity,
                                                    50,
                                                  ),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16.0),
                                                  ),
                                                ),
                                                onPressed: () async {
                                                  Navigator.pop(context);

                                                  logInBox!
                                                      .put("isLoggedIn", true);
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (_) {
                                                        return Home(
                                                          loginSuccessModel:
                                                              snapshot.data!,
                                                          mskoolController: widget
                                                              .mskoolController,
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  "Continue",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelMedium!
                                                      .merge(
                                                        const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }

                                      if (snapshot.hasError) {
                                        final Map<String, dynamic> err =
                                            snapshot.error
                                                as Map<String, dynamic>;
                                        return ErrWidget(
                                          err: err,
                                        );
                                      }
                                      return const ProgressWidget();
                                    }),
                              );
                            });
                      },
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          minimumSize: Size(Get.width * 0.6, 50)),
                      child: Text(
                        "Continue",
                        style: Theme.of(context).textTheme.titleSmall!.merge(
                              const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
